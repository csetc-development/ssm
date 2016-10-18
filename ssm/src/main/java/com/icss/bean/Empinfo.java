package com.icss.bean;

public class Empinfo {
    private Integer eid;

    private String ename;

    private String esex;

    private Integer did;

    private String ebrithday;

    private String entrytime;

    private String departuretime;

    private Integer pid;

    private String ecard;

    private String etel;

    private String email;

    private String ecardid;

    private String education;

    private String ejob;

    private String emariage;

    private String eaddress;
    
    private Integer superiorid;

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex == null ? null : esex.trim();
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getEbrithday() {
        return ebrithday;
    }

    public void setEbrithday(String ebrithday) {
        this.ebrithday = ebrithday == null ? null : ebrithday.trim();
    }

    public String getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(String entrytime) {
        this.entrytime = entrytime == null ? null : entrytime.trim();
    }

    public String getDeparturetime() {
        return departuretime;
    }

    public void setDeparturetime(String departuretime) {
        this.departuretime = departuretime == null ? null : departuretime.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getEcard() {
        return ecard;
    }

    public void setEcard(String ecard) {
        this.ecard = ecard == null ? null : ecard.trim();
    }

    public String getEtel() {
        return etel;
    }

    public void setEtel(String etel) {
        this.etel = etel == null ? null : etel.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getEcardid() {
        return ecardid;
    }

    public void setEcardid(String ecardid) {
        this.ecardid = ecardid == null ? null : ecardid.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getEjob() {
        return ejob;
    }

    public void setEjob(String ejob) {
        this.ejob = ejob == null ? null : ejob.trim();
    }

    public String getEmariage() {
        return emariage;
    }

    public void setEmariage(String emariage) {
        this.emariage = emariage == null ? null : emariage.trim();
    }

    public String getEaddress() {
        return eaddress;
    }

    public void setEaddress(String eaddress) {
        this.eaddress = eaddress == null ? null : eaddress.trim();
    }

	public Integer getSuperiorid() {
		return superiorid;
	}

	public void setSuperiorid(Integer superiorid) {
		this.superiorid = superiorid;
	}
    
    
}