package com.xzq.test;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HelloServlet implements Servlet{
    private String from ;
    private String to;
    
	public HelloServlet() {
		System.out.println("------创建Servlet-------");
	}
	
	@Override
	public void init(ServletConfig cfg) throws ServletException {
		System.out.println("---------初始化---------");
		from = cfg.getInitParameter("from");
		to = cfg.getInitParameter("to");
	}
	
	//String val; // ʵ������
	
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("---------服务中---------");
		request.setCharacterEncoding(to);       //只对get有效
		String val = request.getParameter("name");
	
		System.out.println(val);    //乱码
		val = new String(val.getBytes(from),to);   //转码
		System.out.println(val);   //正确
		response.setCharacterEncoding(to);
		response.setContentType("text/html;charset="+to);
		response.getWriter().print("hello "+ val);
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
