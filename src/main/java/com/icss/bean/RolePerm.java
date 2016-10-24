/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.bean;

public class RolePerm {


    private Integer pid;

    private Integer rid;
    
    private String pidlist;

    public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPidlist() {
		return pidlist;
	}

	public void setPidlist(String pidlist) {
		this.pidlist = pidlist;
	}

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
}