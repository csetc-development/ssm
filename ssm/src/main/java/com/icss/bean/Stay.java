package com.icss.bean;

public class Stay {
    private Integer stid;

    private String sid;

    private Integer spid;

    private Float stpay;

    private Float stcash;

    private Float stdeduction;

    private String stdate;

    private String stremark;

    private Integer eid;

    private Integer eid1;

    private String checkintime;

    private String checkouttime;

    public Integer getStid() {
        return stid;
    }

    public void setStid(Integer stid) {
        this.stid = stid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public Float getStpay() {
        return stpay;
    }

    public void setStpay(Float stpay) {
        this.stpay = stpay;
    }

    public Float getStcash() {
        return stcash;
    }

    public void setStcash(Float stcash) {
        this.stcash = stcash;
    }

    public Float getStdeduction() {
        return stdeduction;
    }

    public void setStdeduction(Float stdeduction) {
        this.stdeduction = stdeduction;
    }

    public String getStdate() {
        return stdate;
    }

    public void setStdate(String stdate) {
        this.stdate = stdate == null ? null : stdate.trim();
    }

    public String getStremark() {
        return stremark;
    }

    public void setStremark(String stremark) {
        this.stremark = stremark == null ? null : stremark.trim();
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getEid1() {
        return eid1;
    }

    public void setEid1(Integer eid1) {
        this.eid1 = eid1;
    }

    public String getCheckintime() {
        return checkintime;
    }

    public void setCheckintime(String checkintime) {
        this.checkintime = checkintime == null ? null : checkintime.trim();
    }

    public String getCheckouttime() {
        return checkouttime;
    }

    public void setCheckouttime(String checkouttime) {
        this.checkouttime = checkouttime == null ? null : checkouttime.trim();
    }
}