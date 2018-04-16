package com.iweb.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.iweb.utils.JSONUtils;
import com.iweb.utils.ObJUtil;

/**
 * 用户权限系统
 * 根据请求的目标方法来确定用户是否拥有该权限
 * @author jack
 *
 */
public class UserInterceptor implements HandlerInterceptor {

	@Autowired
	private RoleUtils roleUtils;

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e)
			throws Exception {

	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView mv)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

		ObJUtil util = new ObJUtil();
		HttpSession session = request.getSession();
		HandlerMethod method = (HandlerMethod) o;
		//获取当前操作要调用的目标类和目标方法
		String rolekey = method.getBean().getClass().getSimpleName() + "." + method.getMethod().getName();
		if (rolekey.equals("SystemController.login")) {
			return true;
		}
		Object uid = session.getAttribute("userID");
		if (uid == null) {
			util.setMsg("你没有登陆或者session已失效");
			JSONUtils.writeJSON(response.getWriter(), util);
			return false;
		}
		Map<String, Integer> map = roleUtils.getRoleMap().get(String.valueOf(uid));
		//获取目标类.方法

		System.out.println(rolekey);
		Object result = map.get(rolekey);
		if (result == null) {
			util.setMsg("没有权限");
			JSONUtils.writeJSON(response.getWriter(), util);
			return false;
		}
		return true;
	}

}
