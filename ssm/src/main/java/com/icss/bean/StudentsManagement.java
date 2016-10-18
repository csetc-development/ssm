package com.icss.bean;

public class StudentsManagement {
    private String crname;

    private String crsex;

    private String etcname;

    private String cdbrithday;

    private String sid;

    private String ename;

    private String syname;

    private String crtel;

    private String sqq;

    private String semail;

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

    public String getEtcname() {
        return etcname;
    }

    public void setEtcname(String etcname) {
        this.etcname = etcname == null ? null : etcname.trim();
    }

    public String getCdbrithday() {
        return cdbrithday;
    }

    public void setCdbrithday(String cdbrithday) {
        this.cdbrithday = cdbrithday == null ? null : cdbrithday.trim();
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getSyname() {
        return syname;
    }

    public void setSyname(String syname) {
        this.syname = syname == null ? null : syname.trim();
    }

    public String getCrtel() {
        return crtel;
    }

    public void setCrtel(String crtel) {
        this.crtel = crtel == null ? null : crtel.trim();
    }

    public String getSqq() {
        return sqq;
    }

    public void setSqq(String sqq) {
        this.sqq = sqq == null ? null : sqq.trim();
    }

    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail == null ? null : semail.trim();
    }
}
