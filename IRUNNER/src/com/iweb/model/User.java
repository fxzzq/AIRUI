package com.iweb.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class User {
    private BigDecimal usid;

    private String usname;

    private String passwd;

    private String ussex;

    private Date birthday;

    private String address;

    private BigDecimal cellphone;

    private Date joindate;
    
    private Role role;
    
    private List<Menu> menus;
    
    public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
    
    public List<Menu> getMenus() {
		return menus;
	}
    
    public void setRole(Role role) {
		this.role = role;
	}
    
    public Role getRole() {
		return role;
	}

    public BigDecimal getUsid() {
        return usid;
    }

    public void setUsid(BigDecimal usid) {
        this.usid = usid;
    }

    public String getUsname() {
        return usname;
    }

    public void setUsname(String usname) {
        this.usname = usname == null ? null : usname.trim();
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    public String getUssex() {
        return ussex;
    }

    public void setUssex(String ussex) {
        this.ussex = ussex == null ? null : ussex.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getCellphone() {
        return cellphone;
    }

    public void setCellphone(BigDecimal cellphone) {
        this.cellphone = cellphone;
    }

    public Date getJoindate() {
        return joindate;
    }

    public void setJoindate(Date joindate) {
        this.joindate = joindate;
    }
}