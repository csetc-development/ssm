package com.icss.bean;

public class Etcclass {
    private Integer etcid;

    private String etcname;

    private Integer etcnum;

    private Integer eid;

    private String startdate;

    private String enddate;
    
    private Integer count;
    
    private String ename;

    public Integer getEtcid() {
        return etcid;
    }

    public void setEtcid(Integer etcid) {
        this.etcid = etcid;
    }

    public String getEtcname() {
        return etcname;
    }

    public void setEtcname(String etcname) {
        this.etcname = etcname == null ? null : etcname.trim();
    }

    public Integer getEtcnum() {
        return etcnum;
    }

    public void setEtcnum(Integer etcnum) {
        this.etcnum = etcnum;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate == null ? null : startdate.trim();
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate == null ? null : enddate.trim();
    }

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename == null ? null : ename.trim();
	}
    
    
}