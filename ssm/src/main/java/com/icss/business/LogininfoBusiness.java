package com.icss.business;

import com.icss.bean.Logininfo;
import com.icss.dao.LogininfoMapper;

public class LogininfoBusiness {
	
	private LogininfoMapper logininfoDao;

	public LogininfoMapper getLogininfoDao() {
		return logininfoDao;
	}

	public void setLogininfoDao(LogininfoMapper logininfoDao) {
		this.logininfoDao = logininfoDao;
	}
	
	public int addlogin(String loginname ,int eid){
		ViewEmpallinfoBusiness bus = new ViewEmpallinfoBusiness();
		String md5pwd= bus.md5("123456");
		Logininfo login = new Logininfo(loginname,md5pwd,eid);
		return logininfoDao.insert(login);
	}

}
