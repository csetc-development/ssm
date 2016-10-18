package com.icss.bean;

public class Customerinfo {
    private Integer crid;

    private Integer eid;

    private String crname;

    private String crsex;

    private String crschool;

    private String crmajor;

    private String crgrade;

    private Integer crage;

    private String crtel;

    private Integer cronline;

    public Integer getCrid() {
        return crid;
    }

    public void setCrid(Integer crid) {
        this.crid = crid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getCrname() {
        return crname;
    }

    public void setCrname(String crname) {
        this.crname = crname == null ? null : crname.trim();
    }

    public String getCrsex() {
        return crsex;
    }

    public void setCrsex(String crsex) {
        this.crsex = crsex == null ? null : crsex.trim();
    }

    public String getCrschool() {
        return crschool;
    }

    public void setCrschool(String crschool) {
        this.crschool = crschool == null ? null : crschool.trim();
    }

    public String getCrmajor() {
        return crmajor;
    }

    public void setCrmajor(String crmajor) {
        this.crmajor = crmajor == null ? null : crmajor.trim();
    }

    public String getCrgrade() {
        return crgrade;
    }

    public void setCrgrade(String crgrade) {
        this.crgrade = crgrade == null ? null : crgrade.trim();
    }

    public Integer getCrage() {
        return crage;
    }

    public void setCrage(Integer crage) {
        this.crage = crage;
    }

    public String getCrtel() {
        return crtel;
    }

    public void setCrtel(String crtel) {
        this.crtel = crtel == null ? null : crtel.trim();
    }

	public Integer getCronline() {
		return cronline;
	}

	public void setCronline(Integer cronline) {
		this.cronline = cronline;
	}

    
}