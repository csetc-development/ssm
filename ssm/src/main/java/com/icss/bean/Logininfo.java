package com.icss.bean;

public class Logininfo {
    private String loginid;

    private String password;

    private Integer eid;

    public String getLoginid() {
        return loginid;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid == null ? null : loginid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }
    

	public Logininfo() {
	}

	public Logininfo(String loginid, String password, Integer eid) {
		this.loginid = loginid;
		this.password = password;
		this.eid = eid;
	}
    
    
}