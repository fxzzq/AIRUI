package com.iweb.model;

import java.math.BigDecimal;

public class Menu {
    private BigDecimal meid;
    
    private String memethod;

    public String getMemethod() {
		return memethod;
	}

	public void setMemethod(String memethod) {
		this.memethod = memethod;
	}

	private String mname;

    public BigDecimal getMeid() {
        return meid;
    }

    public void setMeid(BigDecimal meid) {
        this.meid = meid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }
}