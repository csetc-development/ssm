package com.icss.bean;

public class Socialrelations {
    private Integer srid;

    private String srname;

    private String srelations;

    private String srworkcompany;

    private String srpost;

    private String srtel;

    private Integer crid;

    public Integer getSrid() {
        return srid;
    }

    public void setSrid(Integer srid) {
        this.srid = srid;
    }

    public String getSrname() {
        return srname;
    }

    public void setSrname(String srname) {
        this.srname = srname == null ? null : srname.trim();
    }

    public String getSrelations() {
        return srelations;
    }

    public void setSrelations(String srelations) {
        this.srelations = srelations == null ? null : srelations.trim();
    }

    public String getSrworkcompany() {
        return srworkcompany;
    }

    public void setSrworkcompany(String srworkcompany) {
        this.srworkcompany = srworkcompany == null ? null : srworkcompany.trim();
    }

    public String getSrpost() {
        return srpost;
    }

    public void setSrpost(String srpost) {
        this.srpost = srpost == null ? null : srpost.trim();
    }

    public String getSrtel() {
        return srtel;
    }

    public void setSrtel(String srtel) {
        this.srtel = srtel == null ? null : srtel.trim();
    }

    public Integer getCrid() {
        return crid;
    }

    public void setCrid(Integer crid) {
        this.crid = crid;
    }
}