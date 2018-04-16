package com.iweb.utils;


public class ObJUtil {

	private Boolean result;//用来说明业务是否执行成功

	private String msg;

	private Object object;

	public ObJUtil() {
		// TODO Auto-generated constructor stub
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public Boolean getResult() {
		return result;
	}
}
