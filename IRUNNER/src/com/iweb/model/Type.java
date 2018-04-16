package com.iweb.model;

import java.math.BigDecimal;

public class Type {
    private BigDecimal ptid;

    private String ptype;

    private BigDecimal maintype;
    
    private String state;
    
    

    public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public BigDecimal getPtid() {
        return ptid;
    }

    public void setPtid(BigDecimal ptid) {
        this.ptid = ptid;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype == null ? null : ptype.trim();
    }

    public BigDecimal getMaintype() {
        return maintype;
    }

    public void setMaintype(BigDecimal maintype) {
        this.maintype = maintype;
    }
}