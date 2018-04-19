package com.xzq.test;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

public class testsevlet2  implements Servlet {
   String from;
   String to;
   public testsevlet2() {
	   System.out.println("......创建servlet.....");
   }

	@Override
	public void destroy() {
		
		
	}

	@Override
	public ServletConfig getServletConfig() {
		
		return null;
	}

	@Override
	public String getServletInfo() {
		
		return null;
	}

	@Override
	public void init(ServletConfig cfg) throws ServletException {
		System.out.println("......初始化.....");
		from=cfg.getInitParameter("from");
		to=cfg.getInitParameter("to");
		
	}

	@Override
	public void service(ServletRequest req, ServletResponse respo) throws ServletException, IOException {
	System.out.println("....服务中.....");
	
	String name=req.getParameter("name");
	req.setCharacterEncoding(to);
	System.out.println(name);
	name=new String(name.getBytes(from),to);
	respo.setCharacterEncoding(to);
	respo.setContentType("text/html;charset="+to);
	respo.getWriter().println(""+name);   
	
	
	
		
	}
	

}
