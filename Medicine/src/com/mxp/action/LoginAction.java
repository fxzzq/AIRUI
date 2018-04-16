package com.mxp.action;

import com.mxp.entity.TbUser;
import com.mxp.service.LoginService;

/**
 * 登陆。验证码，检测权限.... 首页的自动加载的一些信息
 * @author Administrator
 *
 */
public class LoginAction extends BaseAction {

	private TbUser tbUser;

	private String nid;

	private LoginService loginService;

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}

	public TbUser getTbUser() {
		return tbUser;
	}

	/**
	 * 登陆
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		path = "index";
		if (tbUser != null) {
				System.out.print("哈哈哈");
			if (loginService.findUser(tbUser)) {
				path = "main";
				System.out.print("哈哈哈12344444");
			} else {
				message = "用户名或密码错误";
				System.out.print("哈哈哈11111111111");
			}
		 
		} else {
			message = "用户名或密码错误";
			System.out.print("哈哈哈22222222222");
		}
		return RESULT;
	}

	/**
	 * 获取导航栏
	 * @throws Exception
	 */
	public void getTree() throws Exception {
		JSONWrite(loginService.getTreeData(nid));
	}

}
