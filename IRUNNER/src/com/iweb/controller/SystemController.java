package com.iweb.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iweb.model.Tree;
import com.iweb.model.User;
import com.iweb.service.SystemService;
import com.iweb.utils.JSONUtils;
import com.iweb.utils.ObJUtil;

/**
 * 系统管理
 * @author jack
 *
 */
@Controller("systemController")
@RequestMapping("systemController")
public class SystemController {

	@Autowired
	private SystemService systemService;

	@RequestMapping("getTree")
	public void getTree(String id, PrintWriter pw) throws Exception {

		List<Tree> trees = systemService.getTree(id);
		JSONUtils.writeJSON(pw, trees);

	}

	/**
	 * 登陆系统
	 * @param pw
	 * @param user
	 */
	@RequestMapping("login")
	public void login(PrintWriter pw, User user, HttpSession session) {
		ObJUtil util = new ObJUtil();
		try {
			user = systemService.login(user);
			session.setAttribute("userID", String.valueOf(user.getUsid()));
			util.setMsg("登陆成功");
			util.setResult(true);
		} catch (Exception e) {
			util.setResult(false);
			util.setMsg(e.getMessage());
		}
		JSONUtils.writeJSON(pw, util);

	}

}
