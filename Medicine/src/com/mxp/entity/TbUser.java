package com.mxp.entity;

import java.sql.Timestamp;

/**
 * TbUser entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class TbUser implements java.io.Serializable {

	// Fields

	private Long id;
	private String username;
	private String password;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public TbUser() {
	}

	/** minimal constructor */
	public TbUser(Long id) {
		this.id = id;
	}

	/** full constructor */
	public TbUser(Long id, String username, String password, Timestamp createtime) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.createtime = createtime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}