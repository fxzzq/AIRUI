package com.mxp.entity;

/**
 * TbMedicine entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class TbMedicine implements java.io.Serializable {

	// Fields

	private Long id;
	private String medno;
	private String name;
	private String factoryadd;
	private String description;
	private Double price;
	private Long medcount = 0l;
	private Long reqcount = 0l;
	private String photopath;
	private Long categoryid;

	// Constructors

	/** default constructor */
	public TbMedicine() {
	}

	public TbMedicine(Long id) {
		this.id = id;
	}

	/** minimal constructor */
	public TbMedicine(Long id, String medno, String name, Double price) {
		this.id = id;
		this.medno = medno;
		this.name = name;
		this.price = price;
	}

	/** full constructor */
	public TbMedicine(Long id, String medno, String name, String factoryadd, String description, Double price,
			Long medcount, Long reqcount, String photopath, Long categoryid) {
		this.id = id;
		this.medno = medno;
		this.name = name;
		this.factoryadd = factoryadd;
		this.description = description;
		this.price = price;
		this.medcount = medcount;
		this.reqcount = reqcount;
		this.photopath = photopath;
		this.categoryid = categoryid;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMedno() {
		return this.medno;
	}

	public void setMedno(String medno) {
		this.medno = medno;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFactoryadd() {
		return this.factoryadd;
	}

	public void setFactoryadd(String factoryadd) {
		this.factoryadd = factoryadd;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Long getMedcount() {
		return this.medcount;
	}

	public void setMedcount(Long medcount) {
		this.medcount = medcount;
	}

	public Long getReqcount() {
		return this.reqcount;
	}

	public void setReqcount(Long reqcount) {
		this.reqcount = reqcount;
	}

	public String getPhotopath() {
		return this.photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public Long getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(Long categoryid) {
		this.categoryid = categoryid;
	}

}