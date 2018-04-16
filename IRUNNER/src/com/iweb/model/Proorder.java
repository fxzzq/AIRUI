package com.iweb.model;

import java.math.BigDecimal;
import java.util.Date;

public class Proorder {
	private BigDecimal id;

	private String proid;

	private BigDecimal memberId;

	private BigDecimal pid;

	private Date placetime;

	private Date closingtime;

	private BigDecimal quantity;

	private String orderstatu;

	private double total;

	private User user;

	private Info info;

	public void setTotal(double total) {
		this.total = total;
	}

	public double getTotal() {
		double price = info.getPrice().doubleValue();
		double count = this.quantity.doubleValue();
		this.total = price * count;
		return total;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid == null ? null : proid.trim();
	}

	public BigDecimal getMemberId() {
		return memberId;
	}

	public void setMemberId(BigDecimal memberId) {
		this.memberId = memberId;
	}

	public BigDecimal getPid() {
		return pid;
	}

	public void setPid(BigDecimal pid) {
		this.pid = pid;
	}

	public Date getPlacetime() {
		return placetime;
	}

	public void setPlacetime(Date placetime) {
		this.placetime = placetime;
	}

	public Date getClosingtime() {
		return closingtime;
	}

	public void setClosingtime(Date closingtime) {
		this.closingtime = closingtime;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public String getOrderstatu() {
		return orderstatu;
	}

	public void setOrderstatu(String orderstatu) {
		this.orderstatu = orderstatu == null ? null : orderstatu.trim();
	}
}