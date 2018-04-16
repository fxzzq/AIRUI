package com.iweb.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iweb.model.Info;
import com.iweb.model.Proorder;
import com.iweb.model.Type;
import com.iweb.service.MerchandiseService;
import com.iweb.utils.DataGrid;
import com.iweb.utils.JSONUtils;
import com.iweb.utils.ObJUtil;
import com.iweb.utils.Page;

/**
 * 商品管理
 * @author jack
 *
 */
@Controller("merchandiseController")
@RequestMapping("merchandiseController")
public class MerchandiseController {

	@Autowired
	private MerchandiseService merchandiseService;

	@RequestMapping("queryTypeTree")
	public void queryTypeTree(PrintWriter pw) {

		DataGrid dg = merchandiseService.queryTypeTree();
		JSONUtils.writeJSON(pw, dg);
	}

	/**
	 * 查找所有的父节点
	 */
	@RequestMapping("queryParentNodes")
	public void queryParentNodes(PrintWriter pw) {

		List<Type> list = merchandiseService.queryParentNodes();

		JSONUtils.writeJSON(pw, list);

	}

	/**
	 * 添加新类别
	 * @param pw
	 * @param type
	 */
	@RequestMapping("addType")
	public void addType(PrintWriter pw, Type type) {
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.addType(type);
			util.setMsg("添加类别成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 删除类别
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteSelectTypes")
	public void deleteSelectTypes(PrintWriter pw, @RequestParam(value = "ids[]") Integer[] ids) {
		ObJUtil util = new ObJUtil();

		try {
			int count = merchandiseService.deleteSelectTypes(ids);
			util.setMsg("删除" + count + "条类别成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 更新类型数据
	 * @param pw
	 * @param type
	 */
	@RequestMapping("updateType")
	public void updateType(PrintWriter pw, Type type) {
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.updateType(type);
			util.setMsg("更新数据成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 查询商品信息包含类别名称
	 * @param pw
	 * @param page
	 */
	@RequestMapping("queryInfos")
	public void queryInfos(PrintWriter pw, Page page) {
		DataGrid grid = new DataGrid();
		merchandiseService.queryInfos(grid, page);
		JSONUtils.writeJSON(pw, grid);

	}

	/**
	 * 获取添加商品用类别下拉选择菜单
	 * @param pw
	 */
	@RequestMapping("queryInfoType")
	public void queryInfoType(PrintWriter pw) {
		List<Type> list = merchandiseService.queryInfoType();
		JSONUtils.writeJSON(pw, list);
	}

	/**
	 * 添加商品信息
	 * @param pw
	 * @param info
	 */
	@RequestMapping("insertInfo")
	public void insertInfo(PrintWriter pw, Info info) {
		ObJUtil util = new ObJUtil();

		try {
			info = merchandiseService.insertInfo(info);
			util.setObject(info);
			util.setMsg("添加商品数据成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 删除商品数据
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteInfos")
	public void deleteInfos(PrintWriter pw, @RequestParam(value = "ids[]") BigDecimal[] ids) {

		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.deleteInfos(ids);
			util.setMsg("删除商品数据成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 保存编辑的数据
	 * @param pw
	 * @param info
	 */
	@RequestMapping("saveEditInfo")
	public void saveEditInfo(PrintWriter pw, Info info) {
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.saveEditInfo(info);
			util.setMsg("修改商品数据成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 查看商品库存
	 * @param pw
	 * @param page
	 */
	@RequestMapping("queryInfosStock")
	public void queryInfosStock(PrintWriter pw, Page page) {
		DataGrid grid =new DataGrid();
		merchandiseService.queryInfosStock(grid,page);
		JSONUtils.writeJSON(pw, grid);

	}
	
	/**
	 * 修改库存
	 * @param pw
	 * @param info
	 */
	@RequestMapping("saveInfoStock")
	public void saveInfoStock(PrintWriter pw,Info info){
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.saveInfoStock(info);
			util.setMsg("修改库存数据成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
		
	}
	
	/**
	 * 添加订单
	 * @param pw
	 * @param info
	 */
	@RequestMapping("addOrder")
	public void addOrder(PrintWriter pw,Info info,HttpSession session){
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.addOrder(info,session.getAttribute("userID"));
			util.setMsg("添加订单成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
	}
	
	/**
	 * 查看订单的信息
	 * @param pw
	 * @param page
	 */
	@RequestMapping("queryOrders")
	public void queryOrders(PrintWriter pw,Page page){
		DataGrid grid = new DataGrid();
		
		merchandiseService.queryOrders(grid,page);
		
		JSONUtils.writeJSON(pw, grid);
	}
	
	
	/**
	 * 删除订单：已经完成的订单不能删除,只能删除未完成的订单
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteOrders")
	public void deleteOrders(PrintWriter pw , @RequestParam("ids[]")BigDecimal[] ids){
		
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.deleteOrders(ids);
			util.setMsg("删除订单成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
		
	}
	
	/**
	 * 完成订单,先要判断订单状态,未完成订单才可用完成
	 * 修改实际库存,与订单同步
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("updateOrders")
	public void updateOrders(PrintWriter pw , Proorder proorder){
		
		ObJUtil util = new ObJUtil();

		try {
			merchandiseService.updateOrders(proorder);
			util.setMsg("完成订单成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
		
	}
}
