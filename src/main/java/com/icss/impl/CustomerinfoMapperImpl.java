package com.icss.impl;

import java.util.Iterator;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.CustomerStauts;
import com.icss.bean.Customerinfo;
import com.icss.bean.Detailed;
import com.icss.bean.PayType;
import com.icss.bean.Socialrelations;
import com.icss.bean.Space;
import com.icss.bean.Studentsinfo;
import com.icss.bean.Studydirection;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.WorkExperience;
import com.icss.dao.CustomerinfoMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class CustomerinfoMapperImpl extends BasicSqlSupport implements CustomerinfoMapper{

	public static final int PAGESIZE = 10;
	
	@Override
	public int deleteByPrimaryKey(Integer crid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.CustomerinfoMapper.deleteByPrimaryKey",crid);
	}

	@Override
	public int insert(Customerinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Customerinfo record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.CustomerinfoMapper.insertSelective",record);
	}

	@Override
	public Customerinfo selectByPrimaryKey(Integer crid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.CustomerinfoMapper.selectByPrimaryKey",crid);
	}

	@Override
	public int updateByPrimaryKeySelective(Customerinfo record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.updateByPrimaryKeySelective",record);
	}

	@Override
	public int updateByPrimaryKey(Customerinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageBean<ViewAllcustomerinfo> allcusinfo(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<ViewAllcustomerinfo> list = this.session.selectList("com.icss.dao.CustomerinfoMapper.allcusinfo");
		return new PageBean<ViewAllcustomerinfo>(list);
	}

	@Override
	public PageBean<CustomerStauts> allcustatus(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<CustomerStauts> list = this.session.selectList("com.icss.dao.CustomerinfoMapper.allcustatus");
		return new PageBean<CustomerStauts>(list);
	}

	@Override
	public PageBean<ViewAllcustomerinfo> somecusByname(int pagenum, String name) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<ViewAllcustomerinfo> list = this.session.selectList("com.icss.dao.CustomerinfoMapper.somecusByname",name);
		return new PageBean<ViewAllcustomerinfo>(list);
	}

	@Override
	public int insertDetailed(Detailed detailed) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.CustomerinfoMapper.insertDetailed", detailed);
	}

	@Override
	public PageBean<ViewAllcustomerinfo> customertype(int pagenum, int cronline) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<ViewAllcustomerinfo> list = this.session.selectList("com.icss.dao.CustomerinfoMapper.customertype",cronline);
		return new PageBean<ViewAllcustomerinfo>(list);
	}

	@Override 
	public ViewAllcustomerinfo customeroneinfo(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.CustomerinfoMapper.customeroneinfo", crid);
	}

	@Override
	public int updateByPrimaryKeyDetailed(Detailed detailed) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.updateByPrimaryKeyDetailed", detailed);
	}

	@Override
	public List<WorkExperience> workexperience(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CustomerinfoMapper.workexperience", crid);
	}

	@Override
	public int insertworkexperience(WorkExperience work) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.CustomerinfoMapper.insertworkexperience", work);
	}

	@Override
	public int deleteworkexperience(int weid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.CustomerinfoMapper.deleteworkexperience", weid);
	}

	@Override
	public int updateexperience(WorkExperience work) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.updateexperience", work);
	}

	@Override
	public List<Socialrelations> selectSocail(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CustomerinfoMapper.selectSocail",crid);
	}

	@Override
	public int updateSocial(Socialrelations social) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.updateSocial", social);
	}

	@Override
	public int deleteSocial(int srid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.CustomerinfoMapper.deleteSocial", srid);
	}

	@Override
	public int insertSocial(Socialrelations social) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.CustomerinfoMapper.insertSocial", social);
	}

	@Override
	public List<PayType> alltype() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CustomerinfoMapper.alltype");
	}

	@Override
	public List<Studydirection> allstudaycourse() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CustomerinfoMapper.allstudaycourse");
	}

	@Override
	public List<Space> allSpace() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CustomerinfoMapper.allSpace");
	}

	@Override
	public int batchupdatecus(List<Integer> list) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.batchupdatecus",list);
	}

	@Override
	public PageBean<Studentsinfo> allstuinfo(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<Studentsinfo> list = this.session.selectList("com.icss.dao.StudentsMapper.allstuinfo");
		Iterator<Studentsinfo> it=list.iterator();
		while(it.hasNext()){
			Studentsinfo s = it.next();
			System.out.println(s.getSqq());
		}
		return new PageBean<Studentsinfo>(list);
	}

}
