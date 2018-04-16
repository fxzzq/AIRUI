package com.mxp.entity;

/**
 * VOrder entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings(value = "serial")
public class VOrder implements java.io.Serializable {

	// Fields

	private VOrderId id;

	// Constructors

	/** default constructor */
	public VOrder() {
	}

	/** full constructor */
	public VOrder(VOrderId id) {
		this.id = id;
	}

	// Property accessors

	public VOrderId getId() {
		return this.id;
	}

	public void setId(VOrderId id) {
		this.id = id;
	}

}