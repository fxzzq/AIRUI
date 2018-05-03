package com.iweb.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.iweb.bean.Emp;
import com.iweb.dao.EmpDao;
import com.opensymphony.xwork2.ActionSupport;

public abstract class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

	private String path;

	protected static String INDEX = "index";

	protected HttpServletRequest request;

	protected HttpServletResponse response;

	public void setPath(String path) {
		this.path = path;
	}

	public String index() {
		// 查询数据

		EmpDao dao = new EmpDao();

		dao.init();

		List<Emp> list = dao.selectList();

		request.setAttribute("list", list);
		
		request.setAttribute("data", new int[]{1,2,3,4});

		dao.close();

		setPath("index");
		return SUCCESS;
	}

	public String getPath() {
		return path;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	protected void writeJSON(Object json) {
		try {
			PrintWriter pw = response.getWriter();
			pw.println(JSON.toJSONString(json));
			//JSON.toJSONStringWithDateFormat(json, null,SerializerFeature.WriteDateUseDateFormat);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
