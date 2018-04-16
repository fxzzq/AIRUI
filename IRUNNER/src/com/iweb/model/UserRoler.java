package com.iweb.model;

import java.math.BigDecimal;

public class UserRoler {
    private BigDecimal oid;

    private BigDecimal usid;

    private BigDecimal rid;

    public BigDecimal getOid() {
        return oid;
    }

    public void setOid(BigDecimal oid) {
        this.oid = oid;
    }

    public BigDecimal getUsid() {
        return usid;
    }

    public void setUsid(BigDecimal usid) {
        this.usid = usid;
    }

    public BigDecimal getRid() {
        return rid;
    }

    public void setRid(BigDecimal rid) {
        this.rid = rid;
    }
}