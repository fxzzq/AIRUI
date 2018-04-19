package com.xzq.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class functionServlet extends BaseHttpServlet {
	//form 表单默认时post提交   去找LoginServlet 发现没有，就去它的父类去找doget()方法 找到执行
	  
	@Override
	public void init() throws ServletException {
		System.out.println("login");
	}
	//
	public void userLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException{
	
		String username	=req.getParameter("username");
		System.out.println("..........."+username);
		String password	=req.getParameter("password");
		System.out.println("..........."+password);
	}
	//
	public void registerLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		
	}


}
