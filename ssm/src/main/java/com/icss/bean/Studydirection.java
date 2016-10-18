package com.icss.bean;

public class Studydirection {
    private Integer syid;

    private String syname;

    private Float studytime;

    private Float stuition;

    public Integer getSyid() {
        return syid;
    }

    public void setSyid(Integer syid) {
        this.syid = syid;
    }

    public String getSyname() {
        return syname;
    }

    public void setSyname(String syname) {
        this.syname = syname == null ? null : syname.trim();
    }

    public Float getStudytime() {
        return studytime;
    }

    public void setStudytime(Float studytime) {
        this.studytime = studytime;
    }

    public Float getStuition() {
        return stuition;
    }

    public void setStuition(Float stuition) {
        this.stuition = stuition;
    }
}