package com.iweb.model;

import java.math.BigDecimal;

public class RolerMenu {
    private BigDecimal oid;

    private BigDecimal rsid;

    private BigDecimal meid;

    public BigDecimal getOid() {
        return oid;
    }

    public void setOid(BigDecimal oid) {
        this.oid = oid;
    }

    public BigDecimal getRsid() {
        return rsid;
    }

    public void setRsid(BigDecimal rsid) {
        this.rsid = rsid;
    }

    public BigDecimal getMeid() {
        return meid;
    }

    public void setMeid(BigDecimal meid) {
        this.meid = meid;
    }
}