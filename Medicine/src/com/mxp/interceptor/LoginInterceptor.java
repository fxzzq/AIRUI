package com.mxp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class LoginInterceptor implements Interceptor {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init() {
		// TODO Auto-generated method stub

	}

	public String intercept(ActionInvocation invocation) throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		//System.out.println("LoginInterceptor" + uri);
		uri = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf(".action"));
		Object user = session.getAttribute("username");
		if (!uri.equals("login")) {
			if (user == null) {
				return null;
			} else {
				return invocation.invoke();
			}
		} else {
			String username = request.getParameter("tbUser.username");
			String password = request.getParameter("tbUser.password");
			if (user == null || (username != null && !"".equals(username) && password != null && !"".equals(password))) {
				return invocation.invoke();

			} else {
				return "success";
			}
		}
	}
	

}
