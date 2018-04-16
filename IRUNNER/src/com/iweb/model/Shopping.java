package com.iweb.model;

import java.math.BigDecimal;
import java.util.Date;

public class Shopping {
    private BigDecimal id;

    private String orderId;

    private BigDecimal usid;

    private BigDecimal pid;

    private BigDecimal orderCount;

    private Date jointime;

    private Date closetime;

    private String statu;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public BigDecimal getUsid() {
        return usid;
    }

    public void setUsid(BigDecimal usid) {
        this.usid = usid;
    }

    public BigDecimal getPid() {
        return pid;
    }

    public void setPid(BigDecimal pid) {
        this.pid = pid;
    }

    public BigDecimal getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(BigDecimal orderCount) {
        this.orderCount = orderCount;
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public Date getClosetime() {
        return closetime;
    }

    public void setClosetime(Date closetime) {
        this.closetime = closetime;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu == null ? null : statu.trim();
    }
}