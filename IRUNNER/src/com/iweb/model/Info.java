package com.iweb.model;

import java.math.BigDecimal;

public class Info {
	private BigDecimal pid;

	private String pname;

	private String pcode;

	private BigDecimal price;

	private String pscript;

	private BigDecimal ptid;

	private BigDecimal totalstock;

	private BigDecimal virtualstock;

	private Type type;

	private Shopping shopping;
	
	private Proorder proorder;
	public void setProorder(Proorder proorder) {
		this.proorder = proorder;
	}
	public Proorder getProorder() {
		return proorder;
	}

	public void setShopping(Shopping shopping) {
		this.shopping = shopping;
	}

	public Shopping getShopping() {
		return shopping;
	}
	public void setType(Type type) {
		
		this.type = type;
	}

	public Type getType() {
		return type;
	}

	public BigDecimal getPid() {
		return pid;
	}

	public void setPid(BigDecimal pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname == null ? null : pname.trim();
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode == null ? null : pcode.trim();
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getPscript() {
		return pscript;
	}

	public void setPscript(String pscript) {
		this.pscript = pscript == null ? null : pscript.trim();
	}

	public BigDecimal getPtid() {
		return ptid;
	}

	public void setPtid(BigDecimal ptid) {
		this.ptid = ptid;
	}

	public BigDecimal getTotalstock() {
		return totalstock;
	}

	public void setTotalstock(BigDecimal totalstock) {
		this.totalstock = totalstock;
	}

	public BigDecimal getVirtualstock() {
		return virtualstock;
	}

	public void setVirtualstock(BigDecimal virtualstock) {
		this.virtualstock = virtualstock;
	}
}