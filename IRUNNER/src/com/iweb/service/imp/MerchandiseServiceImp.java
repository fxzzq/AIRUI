package com.iweb.service.imp;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iweb.mapper.InfoMapper;
import com.iweb.mapper.ProorderMapper;
import com.iweb.mapper.ShoppingMapper;
import com.iweb.mapper.TypeMapper;
import com.iweb.model.Info;
import com.iweb.model.Proorder;
import com.iweb.model.Type;
import com.iweb.service.MerchandiseService;
import com.iweb.utils.DataGrid;
import com.iweb.utils.Page;

@Service("merchandiseService")
public class MerchandiseServiceImp implements MerchandiseService {

	@Autowired
	private TypeMapper typeMapper;

	@Autowired
	private InfoMapper infoMapper;

	@Autowired
	private ShoppingMapper shoppingMapper;

	@Autowired
	private ProorderMapper proorderMapper;

	public DataGrid queryTypeTree() {
		DataGrid dg = new DataGrid();
		long total = typeMapper.selectCount();

		List<Type> list = typeMapper.selectList();

		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (Type t : list) {
			map = new HashMap<String, Object>();
			map.put("ptid", t.getPtid());
			map.put("ptype", t.getPtype());
			map.put("_parentId", t.getMaintype());
			map.put("state", t.getState());
			rows.add(map);
		}

		dg.setRows(rows);
		dg.setTotal(total);

		return dg;
	}

	/**
	 * 状态是closed的表示有子节点,通过查询表获取
	 */
	public List<Type> queryParentNodes() {

		return typeMapper.queryParentNodes();
	}

	/**
	 * 确认类别是否重复
	 */
	public synchronized void addType(Type type) {

		int count = typeMapper.selectCountExist(type);
		if (count != 0) {
			throw new RuntimeException("产品类别已存在");
		}
		int maxId = typeMapper.selectMaxId();
		type.setPtid(new BigDecimal(maxId + 1));
		typeMapper.insertSelective(type);

	}

	/**
	 * 分离数据判断是否是叶子节点
	 * 先删除叶子节点数据
	 * 如果有树枝节点数据,判断其是否还有子节点,没有则可以删除;
	 * 树根不能删除
	 * 判断该叶子是否使用状态,使用不能删除
	 */
	public synchronized int deleteSelectTypes(Integer[] ids) {

		Set<Integer> leafs = new HashSet<Integer>();//叶子节点
		Set<Integer> branchs = new HashSet<Integer>();//非叶子节点

		Set<Integer> all_leafs = typeMapper.selectAllLeafs();
		System.out.println(all_leafs);
		for (int id : ids) {
			if (id == 0)
				continue;
			if (exist(id, all_leafs))
				leafs.add(id);
			else
				branchs.add(id);
		}

		//所有使用中的节点
		Set<Integer> usedNodes = infoMapper.selectUsedNodes();
		int count = 0;
		for (int id : leafs) {
			if (!exist(id, usedNodes)) {
				typeMapper.deleteByPrimaryKey(new BigDecimal(id));
				count++;
			}
		}

		//查看可以删除的树枝节点
		Set<Integer> delete_able_nodes = typeMapper.selectDeleteAbleNodes();

		if (delete_able_nodes.size() > 0) {
			for (int id : branchs) {
				if (exist(id, delete_able_nodes)) {
					typeMapper.deleteByPrimaryKey(new BigDecimal(id));
					count++;
				}
			}
		}

		return count;
	}

	private boolean exist(int id, Set<Integer> all_leafs) {
		for (int leaf : all_leafs) {
			if (id == leaf)
				return true;
		}
		return false;
	}

	/**
	 * 只能更新类别名称其他数据都保持不变
	 */
	public void updateType(Type type) {
		type.setState(null);
		type.setMaintype(null);
		typeMapper.updateByPrimaryKeySelective(type);
	}

	/**
	 * 查询商品的信息和商品的类别名称
	 */
	public void queryInfos(DataGrid grid, Page page) {
		long total = infoMapper.selectCount();
		List<Info> rows = infoMapper.selectListTypes(page);
		grid.setTotal(total);
		grid.setRows(rows);
	}

	/**
	 * 获取类别下拉选择菜单，只有叶子节点才可以作为类别使用
	 */
	public List<Type> queryInfoType() {

		return typeMapper.selectInfoTypes();
	}

	/**
	 * 需要判断商品编码不能重复
	 * 总库存和可用库存默认为0
	 */
	public synchronized Info insertInfo(Info info) {

		int count = infoMapper.selectInfoExist(info.getPcode());

		if (count != 0) {
			throw new RuntimeException("商品编码重复");
		}

		int maxId = infoMapper.selectMaxId();

		info.setPid(new BigDecimal(maxId + 1));

		infoMapper.insertSelective(info);

		info = infoMapper.selectByPrimaryKey(info.getPid());

		return info;
	}

	/**
	 * 需要确认商品是已经有加入购物车的,
	 * 没有加入购物车的商品方可删除
	 */
	public synchronized void deleteInfos(BigDecimal[] ids) {

		for (BigDecimal pid : ids) {
			if (shoppingMapper.selectCountPidUsed(pid) != 0) {
				continue;
			}
			List<Proorder> list = proorderMapper.selectCountPidUsed(pid);
			if (list != null && list.size() > 0) {
				continue;
			}
			infoMapper.deleteByPrimaryKey(pid);
		}

	}

	/**
	 * 修改商品数据只允许修改价格描述和类别
	 */
	public synchronized void saveEditInfo(Info info) {
		if (info.getPrice() == null) {
			throw new RuntimeException("价格不能为空");
		}
		if (info.getPscript() == null) {
			throw new RuntimeException("商品描述不能为空");
		}
		if (info.getPtid() == null) {
			throw new RuntimeException("商品类别不能为空");
		}
		Info in = new Info();
		in.setPid(info.getPid());
		in.setPrice(info.getPrice());
		in.setPscript(info.getPscript());

		in.setPtid(info.getPtid());
		infoMapper.updateByPrimaryKeySelective(in);
	}

	/**
	 * 查看商品信息，总库存，可用库存，购物车商品数量
	 */
	public DataGrid queryInfosStock(DataGrid grid, Page page) {

		long total = infoMapper.selectCount();

		List<Info> rows = infoMapper.queryInfosStock(page);
		grid.setTotal(total);
		grid.setRows(rows);
		return grid;
	}

	/**
	 * 调整商品库存,只可调整总库存和可用库存,添加完后要验证总库存=可用库存+购物车库存
	 */
	public synchronized void saveInfoStock(Info info) {

		int total = info.getTotalstock().intValue();
		int virtual = info.getVirtualstock().intValue();
		int order = info.getShopping().getOrderCount().intValue();
		if (total != (virtual + order)) {
			throw new RuntimeException("设置参数不对,请检查");
		}

		infoMapper.updateByPrimaryKeySelective(info);

	}

	/**
	 * 根据订单表重新进行数据封装,订单编号使用当天的日期
	 * 
	 */
	public void addOrder(Info info, Object attribute) {

		Proorder order = new Proorder();
		int maxId = proorderMapper.selectMaxId();
		order.setId(new BigDecimal(maxId + 1));
		order.setMemberId(new BigDecimal(String.valueOf(attribute)));
		order.setProid("order" + new SimpleDateFormat("yyyyMMdd").format(new Date()));
		order.setPid(info.getPid());
		order.setQuantity(info.getProorder().getQuantity());
		proorderMapper.insertSelective(order);

	}

	/**
	 * 多表查询,订单总价根据查询结果在get方法中计算得到
	 */
	public void queryOrders(DataGrid grid, Page page) {

		long total = proorderMapper.selectCount();
		List<Proorder> rows = proorderMapper.selectListUserInfo(page);
		grid.setRows(rows);
		grid.setTotal(total);

	}

	public synchronized void deleteOrders(BigDecimal[] ids) {
		String status = "";
		for (BigDecimal id : ids) {
			//确定订单状态
			status = proorderMapper.selectOrderStatus(id);
			if ("Y".equals(status.trim())) {
				continue;
			}
			proorderMapper.deleteByPrimaryKey(id);
		}

	}

	public synchronized void updateOrders(Proorder proorder) {
		if ("Y".equals(proorder.getOrderstatu())) {
			throw new RuntimeException("订单已完成");
		}
		//完成订单
		proorder.setOrderstatu("Y");
		proorder.setClosingtime(new Date());
		proorderMapper.updateByPrimaryKeySelective(proorder);
		//查看现在库存
		Info info = infoMapper.selectByPrimaryKey(proorder.getPid());
		long total = info.getTotalstock().longValue();
		long virtual = info.getVirtualstock().longValue();

		info.setTotalstock(new BigDecimal(proorder.getQuantity().longValue()+total));
		info.setVirtualstock(new BigDecimal(virtual + proorder.getQuantity().longValue()));

		infoMapper.updateByPrimaryKeySelective(info);

	}

}
