package com.icss.bean;

public class CodesInfo {
	 private Integer cid;//订单编号
	 private String aname;//签单地区
	 private Long creceivables;//签单费用
	 private String ctime;//签单时间
	 private String cremark;//备注
	 private String ename;//销售名字
	 private String crname;//客户名字
	 private String btname;//类型名称
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Long getCreceivables() {
		return creceivables;
	}
	public void setCreceivables(Long creceivables) {
		this.creceivables = creceivables;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getCremark() {
		return cremark;
	}
	public void setCremark(String cremark) {
		this.cremark = cremark;
	}

	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	public String getBtname() {
		return btname;
	}
	public void setBtname(String btname) {
		this.btname = btname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	 
	 
}
