package com.iweb.bean;

import java.io.Serializable;

/**
 * 部门
 * 
 * @author jack
 *
 */
public class Dept implements Serializable{

	private Integer deptno;
	private String dname;
	private String loc;

	public Dept() {
		// TODO Auto-generated constructor stub
	}

	public Dept(Integer deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	public Integer getDeptno() {
		return deptno;
	}

	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

}
