package com.mxp.action;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.mxp.util.Page;

/**
 *  编写存放一些Action中通用的属性和方法
 * @author Administrator
 *
 */
public class BaseAction {

	protected final static String RESULT = "result";

	protected String path;

	protected Page page;

	protected String ids;

	protected String message;

	protected String startTime;

	protected String endTime;

	public String getMessage() {
		return message;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	protected void JSONWrite(String str) throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();

		response.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();

		pw.println(str);

		pw.flush();
		pw.close();
	}

	protected void JSONWrite(Object obj) throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();

		response.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();

		// long 数据库获取的是long型的 在页面展示的时候也是long
		// SerializerFeature.DisableCircularReferenceDetect解除SSH 级联的循环引用
		pw.println(JSON.toJSONStringWithDateFormat(obj, null, SerializerFeature.WriteDateUseDateFormat,
				SerializerFeature.DisableCircularReferenceDetect));
		// pw.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd"));
		pw.flush();
		pw.close();
	}

	public String getPath() {
		return path;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Page getPage() {
		return page;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
