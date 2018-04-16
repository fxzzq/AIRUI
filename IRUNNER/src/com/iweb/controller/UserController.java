package com.iweb.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iweb.model.Menu;
import com.iweb.model.Role;
import com.iweb.model.User;
import com.iweb.model.UserRoler;
import com.iweb.service.UserService;
import com.iweb.utils.DataGrid;
import com.iweb.utils.JSONUtils;
import com.iweb.utils.ObJUtil;
import com.iweb.utils.Page;

/**
 * 用户管理
 * @author jack
 *
 */
@Controller("userController")
@RequestMapping("userController")
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 查询用户信息和用户角色
	 * @param pw
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping("query")
	public void query(PrintWriter pw, Page page) {

		DataGrid grid = userService.queryUserRole(page);
		JSONUtils.writeJSON(pw, grid);
	}

	@RequestMapping("register")
	public void register(PrintWriter pw, User user) {
		ObJUtil util = new ObJUtil();
		try {
			User u = userService.registerUser(user);
			util.setMsg("注册成功");
			util.setResult(true);
			util.setObject(u);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 删除多选
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteSelected")
	public void deleteSelected(PrintWriter pw, String ids) {
		ObJUtil util = new ObJUtil();
		try {
			int count = userService.deleteSelected(ids);
			util.setMsg("成功删除" + count + "条数据");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}

		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 修改用户信息
	 * @param pw
	 * @param user
	 */
	@RequestMapping("updateUser")
	public void updateUser(PrintWriter pw, User user) {
		ObJUtil util = new ObJUtil();
		try {
			user = userService.updateUser(user);
			util.setResult(true);
			util.setMsg("修改成功");
			util.setObject(user);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 获取角色的combobox内容明细
	 * @param pw
	 */
	@RequestMapping("getRoleCombobox")
	public void getRoleCombobox(PrintWriter pw) {

		List<Role> list = userService.getRoleCombobox();
		JSONUtils.writeJSON(pw, list);
	}

	/**
	 * 设置管理员权限
	 * @param role
	 * @param pw
	 */
	@RequestMapping("setManagerRole")
	public void setManagerRole(UserRoler userRoler, PrintWriter pw) {

		ObJUtil util = new ObJUtil();
		try {
			String msg = userService.addManagerRole(userRoler);
			util.setResult(true);
			util.setMsg(msg);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 查看角色信息
	 * @param pw
	 * @param page
	 */
	@RequestMapping("querygljs")
	public void querygljs(PrintWriter pw, Page page) {

		DataGrid dg = userService.querygljs(page);

		JSONUtils.writeJSON(pw, dg);

	}

	/**
	 * 获取所有的权限清单
	 * @param pw
	 */
	@RequestMapping("queryMenus")
	public void queryMenus(PrintWriter pw) {

		List<Map<String, Object>> list = userService.queryMenus();

		JSONUtils.writeJSON(pw, list);

	}

	/**
	 * 添加角色并设置角色权限
	 * @param pw
	 * @param role
	 */
	@RequestMapping("addRole")
	public void addRole(PrintWriter pw, Role role) {
		ObJUtil util = new ObJUtil();

		try {
			userService.addRole(role);
			util.setMsg("添加角色成功");
			util.setResult(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			util.setMsg(e.getMessage());
			util.setResult(false);
		}

		JSONUtils.writeJSON(pw, util);

	}

	/**
	 * 删除角色
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteRole")
	public void deleteRole(PrintWriter pw, @RequestParam(value = "ids[]") String[] ids) {
		ObJUtil util = new ObJUtil();
		try {
			int count = userService.deleteRole(ids);
			util.setMsg("成功删除" + count + "条数据");
		} catch (Exception e) {
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 修改角色权限
	 * @param pw
	 * @param role
	 */
	@RequestMapping("updateRole")
	public void updateRole(PrintWriter pw, Role role) {
		ObJUtil util = new ObJUtil();

		try {
			userService.updateRole(role);
			util.setMsg("修改角色权限成功");
			util.setResult(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			util.setMsg(e.getMessage());
			util.setResult(false);
		}

		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 查询权限清单
	 * @param pw
	 */
	@RequestMapping("queryglqx")
	public void queryglqx(PrintWriter pw, Page page) {
		DataGrid dg = userService.queryglqx(page);

		JSONUtils.writeJSON(pw, dg);

	}

	/**
	 * 添加权限
	 * @param pw
	 * @param menu
	 */
	@RequestMapping("addMenu")
	public void addMenu(PrintWriter pw, Menu menu) {
		ObJUtil util = new ObJUtil();

		try {
			userService.addMenu(util, menu);
			util.setMsg("添加权限菜单成功");
			util.setResult(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			util.setMsg(e.getMessage());
			util.setResult(false);
		}

		JSONUtils.writeJSON(pw, util);
	}

	/**
	 * 删除权限多选
	 * @param pw
	 * @param ids
	 */
	@RequestMapping("deleteMenus")
	public void deleteMenus(PrintWriter pw, @RequestParam(value = "ids[]") String[] ids) {

		ObJUtil util = new ObJUtil();

		try {
			int count = userService.deleteMenus(ids);
			util.setMsg("删除了" + count + "条权限数据..");
			util.setResult(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			util.setMsg(e.getMessage());
			util.setResult(false);
		}

		JSONUtils.writeJSON(pw, util);

	}
}
