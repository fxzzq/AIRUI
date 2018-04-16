package com.mxp.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class SystemInterceptor implements Interceptor {

	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
	public void init() {
		// TODO Auto-generated method stub
		
	}

	
	public String intercept(ActionInvocation invocation) throws Exception {
		return invocation.invoke();
	}

}
