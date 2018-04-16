package com.iweb.model;

import java.math.BigDecimal;
import java.util.List;

public class Role {
	private BigDecimal rid;

	private String rname;

	private String description;

	private List<Menu> menus;

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public BigDecimal getRid() {
		return rid;
	}

	public void setRid(BigDecimal rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname == null ? null : rname.trim();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}
}