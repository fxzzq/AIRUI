package com.mxp.entity;

import java.sql.Timestamp;

/**
 * TbCategory entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings(value = "serial")
public class TbCategory implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String description;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public TbCategory() {
	}

	/** minimal constructor */
	public TbCategory(Long id) {
		this.id = id;
	}

	/** full constructor */
	public TbCategory(Long id, String name, String description, Timestamp createtime) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.createtime = createtime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}