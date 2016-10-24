package com.icss.bean;

public class WorkExperience {
    private Integer weid;

    private String westartime;

    private String wendtime;

    private String wecompanyname;

    private String wesalary;

    private String wewitness;

    private String wetel;

    private String weleavresons;

    private String weindustry;

    private String wedepartment;

    private String wepost;

    private String weobject;

    private String wepersonumber;

    private String weworkcontent;

    private Integer crid;

    public Integer getWeid() {
        return weid;
    }

    public void setWeid(Integer weid) {
        this.weid = weid;
    }

    public String getWestartime() {
        return westartime;
    }

    public void setWestartime(String westartime) {
        this.westartime = westartime == null ? null : westartime.trim();
    }

    public String getWendtime() {
        return wendtime;
    }

    public void setWendtime(String wendtime) {
        this.wendtime = wendtime == null ? null : wendtime.trim();
    }

    public String getWecompanyname() {
        return wecompanyname;
    }

    public void setWecompanyname(String wecompanyname) {
        this.wecompanyname = wecompanyname == null ? null : wecompanyname.trim();
    }

    public String getWesalary() {
        return wesalary;
    }

    public void setWesalary(String wesalary) {
        this.wesalary = wesalary == null ? null : wesalary.trim();
    }

    public String getWewitness() {
        return wewitness;
    }

    public void setWewitness(String wewitness) {
        this.wewitness = wewitness == null ? null : wewitness.trim();
    }

    public String getWetel() {
        return wetel;
    }

    public void setWetel(String wetel) {
        this.wetel = wetel == null ? null : wetel.trim();
    }

    public String getWeleavresons() {
        return weleavresons;
    }

    public void setWeleavresons(String weleavresons) {
        this.weleavresons = weleavresons == null ? null : weleavresons.trim();
    }

    public String getWeindustry() {
        return weindustry;
    }

    public void setWeindustry(String weindustry) {
        this.weindustry = weindustry == null ? null : weindustry.trim();
    }

    public String getWedepartment() {
        return wedepartment;
    }

    public void setWedepartment(String wedepartment) {
        this.wedepartment = wedepartment == null ? null : wedepartment.trim();
    }

    public String getWepost() {
        return wepost;
    }

    public void setWepost(String wepost) {
        this.wepost = wepost == null ? null : wepost.trim();
    }

    public String getWeobject() {
        return weobject;
    }

    public void setWeobject(String weobject) {
        this.weobject = weobject == null ? null : weobject.trim();
    }

    public String getWepersonumber() {
        return wepersonumber;
    }

    public void setWepersonumber(String wepersonumber) {
        this.wepersonumber = wepersonumber == null ? null : wepersonumber.trim();
    }

    public String getWeworkcontent() {
        return weworkcontent;
    }

    public void setWeworkcontent(String weworkcontent) {
        this.weworkcontent = weworkcontent == null ? null : weworkcontent.trim();
    }

    public Integer getCrid() {
        return crid;
    }

    public void setCrid(Integer crid) {
        this.crid = crid;
    }
}