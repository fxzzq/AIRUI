package com.mxp.entity;

import java.sql.Timestamp;

public class TbShopcart {

	private Long id;

	// private Long medid;

	private TbMedicine medicine;

	private Long sellcount;

	private Long userid;

	private Timestamp selltime;

	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	// public Long getMedid() {
	// return medid;
	// }
	//
	// public void setMedid(Long medid) {
	// this.medid = medid;
	// }

	public void setMedicine(TbMedicine medicine) {
		this.medicine = medicine;
	}

	public TbMedicine getMedicine() {
		return medicine;
	}

	public Long getSellcount() {
		return sellcount;
	}

	public void setSellcount(Long sellcount) {
		this.sellcount = sellcount;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Timestamp getSelltime() {
		return selltime;
	}

	public void setSelltime(Timestamp selltime) {
		this.selltime = selltime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
