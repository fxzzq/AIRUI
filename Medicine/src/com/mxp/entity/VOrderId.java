package com.mxp.entity;


/**
 * VOrderId entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings(value = "serial")
public class VOrderId implements java.io.Serializable {

	// Fields

//	private Long medid;
	private TbMedicine medicine;
	private Long sellcount;

	// Constructors

	/** default constructor */
	public VOrderId() {
	}


	// Property accessors

	
	public void setMedicine(TbMedicine medicine) {
		this.medicine = medicine;
	}
	public TbMedicine getMedicine() {
		return medicine;
	}
	

	public Long getSellcount() {
		return this.sellcount;
	}

	public void setSellcount(Long sellcount) {
		this.sellcount = sellcount;
	}


}