package com.mxp.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mxp.dao.BaseDao;
import com.mxp.dao.TreeDao;
import com.mxp.dao.UserDao;
import com.mxp.entity.TbUser;
import com.mxp.entity.Tree;
import com.mxp.util.DataGrid;
import com.mxp.util.Page;

public class SystemServiceImp implements SystemService {

	private UserDao<TbUser> userDao;

	private TreeDao<Tree> treeDao;

	public void setTreeDao(TreeDao<Tree> treeDao) {
		this.treeDao = treeDao;
	}

	public void setUserDao(UserDao<TbUser> userDao) {
		this.userDao = userDao;
	}

	public DataGrid findDataGrid(Page p) throws Exception {
		int page = p.getPage();
		int count = p.getCount();
		String hql = "select count(*) from TbUser";
		int counts = Integer.parseInt(userDao.findUnique(hql).toString());
		hql = "from TbUser order by id";
		List<TbUser> list = userDao.findList(hql, page, count);
		DataGrid dataGrid = new DataGrid();
		dataGrid.setCounts(counts);
		dataGrid.setPages(counts % count == 0 ? counts / count : counts / count + 1);
		dataGrid.setRows(list);
		return dataGrid;

	}

	public boolean addmanager(TbUser tbUser) throws Exception {
		String hql = "select count(*) from TbUser where username = :name";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", tbUser.getUsername());
		int count = Integer.parseInt(userDao.findUnique(hql, map).toString());
		if (count == 0) {
			if (tbUser.getUsername() != null
					&& !"".equals(tbUser.getUsername() != null && tbUser.getPassword() != null
							&& !"".equals(tbUser.getPassword()))) {
				tbUser.setCreatetime(new Timestamp(System.currentTimeMillis()));
				userDao.save(tbUser);
				return true;
			}
		}
		return false;
	}

	public int removeManager(String ids) throws Exception {
		String[] sid = ids.split(",");
		int index = 0;
		for (String id : sid) {
			if (id != null && !"".equals(id.trim())) {
				if (!"1".equals(id)) {
					userDao.delete(new TbUser(Long.parseLong(id)));
					index++;
				}
			}
		}
		return index;
	}

	public TbUser getManager(Long id) throws Exception {
		return userDao.findByID(TbUser.class, id);
	}

	public boolean updatemanager(TbUser tbUser) throws Exception {

		if (tbUser.getPassword() != null && !"".equals(tbUser.getPassword())) {
			TbUser t = userDao.findByID(TbUser.class, tbUser.getId());

			t.setPassword(tbUser.getPassword());
			return true;
		}
		return false;
	}

	public boolean checkUsername(TbUser tbUser) throws Exception {

		if (tbUser.getUsername() != null && !"".equals(tbUser.getUsername().trim())) {
			String hql = "select count(*) from TbUser where username = :name";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", tbUser.getUsername());
			int count = Integer.parseInt(userDao.findUnique(hql, map).toString());
			if (count != 0)
				return false;
		}
		return true;
	}

	public boolean repair() throws Exception {

		// 初始化菜单树
		Tree t1 = new Tree(0L, "医药系统", "closed", "icon-system", null, null);
		Tree t2 = new Tree(1L, "医药商品管理", "closed", "icon-system", null, 0l);
		Tree t3 = new Tree(2L, "医药类别管理", "closed", "icon-system", null, 0l);
		Tree t4 = new Tree(3L, "购买销售管理", "closed", "icon-system", null, 0l);
		Tree t5 = new Tree(4L, "进货需求管理", "open", "icon-search", "required", 0l);
		Tree t6 = new Tree(5L, "系统管理", "closed", "icon-system", null, 0l);
		Tree t7 = new Tree(6L, "药品管理", "open", "icon-search", "medicine", 1l);
		Tree t8 = new Tree(7L, "库存管理", "open", "icon-search", "stock", 1l);
		Tree t9 = new Tree(8L, "查看类别", "open", "icon-search", "category", 2l);
		Tree t10 = new Tree(9L, "选购药品", "open", "icon-search", "selldetail", 3l);
		Tree t11 = new Tree(10L, "查看选购", "open", "icon-search", "querychose", 3l);
		Tree t12 = new Tree(11L, "查看选购明细", "open", "icon-search", "querySelled", 3l);
		Tree t13 = new Tree(12L, "今日销售明细", "open", "icon-search", "queryToday", 3l);
		Tree t14 = new Tree(13L, "日期查询", "open", "icon-search", "queryDate", 3l);
		Tree t15 = new Tree(14L, "销售排行", "open", "icon-search", "orderSell", 3l);
		Tree t16 = new Tree(15L, "管理员管理", "open", "icon-search", "manager", 5l);
		Tree t17 = new Tree(16L, "系统初始化", "open", "icon-search", null, 5l);
		Tree t18 = new Tree(17L, "退出系统", "open", "icon-search", null, 5l);
		// 删除全部数据
		List<Tree> trees = treeDao.findList("from Tree");
		for (Tree tree : trees) {
			treeDao.delete(tree);
		}
		treeDao.save(t1);
		treeDao.save(t2);
		treeDao.save(t3);
		treeDao.save(t4);
		treeDao.save(t5);
		treeDao.save(t6);
		treeDao.save(t7);
		treeDao.save(t8);
		treeDao.save(t9);
		treeDao.save(t10);
		treeDao.save(t11);
		treeDao.save(t12);
		treeDao.save(t13);
		treeDao.save(t14);
		treeDao.save(t15);
		treeDao.save(t16);
		treeDao.save(t17);
		treeDao.save(t18);

		return true;
	}

}
