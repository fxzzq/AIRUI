package com.xzq.servlet;

import java.io.IOException;  
import java.lang.reflect.InvocationTargetException;  
import java.lang.reflect.Method;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.Cookie;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
public class BaseHttpServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
    @Override
    public void init() throws ServletException {
    	System.out.println("base");
    }
  
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
        execute(req, resp);  
    }  
  
    @Override  
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
        execute(req, resp);  
    }  
  
      
    /**利用反射查找方法 
     * */  
    public void execute(HttpServletRequest req, HttpServletResponse resp) {  
        //userLogin  
        String methodName = req.getParameter("method");  
        try {  
        	System.out.println(getClass());
            Method method = this.getClass().getDeclaredMethod(methodName, HttpServletRequest.class,  
                    HttpServletResponse.class);  
            method.invoke(this, req, resp);  
        } catch (NoSuchMethodException e) {   
            e.printStackTrace();  
        } catch (SecurityException e) {  
            e.printStackTrace();  
        } catch (IllegalAccessException e) {    
            e.printStackTrace();  
        } catch (IllegalArgumentException e) {  
            e.printStackTrace();  
        } catch (InvocationTargetException e) {  
            e.printStackTrace();  
        }  
    }  
      
      
    /** 
     * 设置页面调转 
     * */  
    protected void goTo(String url,HttpServletRequest req,HttpServletResponse resp){  
        try {  
            req.getRequestDispatcher(url+".jsp").forward(req, resp);  
        } catch (ServletException | IOException e) {  
            e.printStackTrace();  
        }  
    }  
      
    /** 
     * 重定向 
     * */  
    protected void redirect(String url,HttpServletRequest req,HttpServletResponse resp){  
        try {  
            resp.sendRedirect(req.getContextPath()+url+".jsp");  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
      
  
  
}  