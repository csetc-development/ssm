/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.bean;

public class ViewUserEmpallinfo {

	private Integer eid;
	
	private String ename;

    private String esex;

    private String ebrithday;

    private String dName;

    private String ejob;

    private String username;

    private String rdescription;

    private String pdescription;


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

    public String getEbrithday() {
        return ebrithday;
    }

    public void setEbrithday(String ebrithday) {
        this.ebrithday = ebrithday == null ? null : ebrithday.trim();
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName == null ? null : dName.trim();
    }

    public String getEjob() {
        return ejob;
    }

    public void setEjob(String ejob) {
        this.ejob = ejob == null ? null : ejob.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getRdescription() {
        return rdescription;
    }

    public void setRdescription(String rdescription) {
        this.rdescription = rdescription == null ? null : rdescription.trim();
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription == null ? null : pdescription.trim();
    }
}