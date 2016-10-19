package com.icss.business;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import com.icss.bean.Empinfo;
import com.icss.bean.ViewEmpallinfo;
import com.icss.dao.ViewEmpallinfoMapper;
import com.icss.util.PageBean;

public class ViewEmpallinfoBusiness {
	
	private ViewEmpallinfoMapper empallinfoDAO = null;
	
	public ViewEmpallinfoMapper getEmpallinfoDAO() {
		return empallinfoDAO;
	}

	public void setEmpallinfoDAO(ViewEmpallinfoMapper empallinfoDAO) {
		this.empallinfoDAO = empallinfoDAO;
	}


	
	//获得某员工信息
	public ViewEmpallinfo getoneemp(int eid){
		return empallinfoDAO.getoneinfo(eid);
	}
	
	//更改个人信息
	public int updateoneinfo(ViewEmpallinfo emp){
		return empallinfoDAO.updateoneinfo(emp);
	}
	
	//员工信息管理
	public PageBean<ViewEmpallinfo> empmanagement(int pagenum){
		return empallinfoDAO.empinfo(pagenum);
	}
	
	//通过名字查找员工信息
	public PageBean<ViewEmpallinfo> selectByname(String ename,int pagenum){
		return empallinfoDAO.selectByname(ename, pagenum);
	}
	
	//md5加密
	public String md5(String str){
		String md5str = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] md5 = md.digest(str.getBytes());
			md5str = new String(md5);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return md5str;
	}
}
