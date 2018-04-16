package com.mxp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.mxp.dao.TreeDao;
import com.mxp.dao.UserDao;
import com.mxp.entity.TbUser;
import com.mxp.entity.Tree;

public class LoginServiceImp implements LoginService {

	private UserDao<TbUser> userDao;

	private TreeDao<Tree> treeDao;

	public void setTreeDao(TreeDao<Tree> treeDao) {
		this.treeDao = treeDao;
	}

	public void setUserDao(UserDao<TbUser> userDao) {
		this.userDao = userDao;
	}

	
	public boolean findUser(TbUser tbUser) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		if (tbUser.getUsername() != null && !"".equals(tbUser.getUsername())) {
			map.put("name", tbUser.getUsername());
		}
		if (tbUser.getPassword() != null && !"".equals(tbUser.getPassword())) {
			map.put("pwd", tbUser.getPassword());
		}
		if (map.size() == 2) {
			String hql = "select count(*) from TbUser t where t.username = :name and t.password = :pwd";
			int count = Integer.parseInt(userDao.findUnique(hql, map).toString());

			if (count == 1) {
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("username", tbUser.getUsername());
				return true;
			}
		}
		return false;
	}

	
	public List<Tree> getTreeData(String nid) throws Exception {
		String hql = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if (nid == null || "".equals(nid)) {
			hql = "from Tree t where nid is null order by id ";
			return treeDao.findList(hql);
		} else {
			hql = "from Tree t where nid =:nid order by id";
			map.put("nid", Long.parseLong(nid));
		}
		return treeDao.findList(hql, map);
	}

}
