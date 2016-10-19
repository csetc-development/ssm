package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.ViewEmpallinfo;
import com.icss.dao.ViewEmpallinfoMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class ViewEmpallinfoMapperImpl extends BasicSqlSupport  implements ViewEmpallinfoMapper{

	@Override
	public int insert(ViewEmpallinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(ViewEmpallinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ViewEmpallinfo getoneinfo(int eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.ViewEmpallinfoMapper.getoneinfo", eid);
	}

	@Override
	public int updateoneinfo(ViewEmpallinfo emp) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.ViewEmpallinfoMapper.updateoneinfo",emp);
	}

	@Override
	public PageBean<ViewEmpallinfo> empinfo(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, CustomerinfoMapperImpl.PAGESIZE);
		List<ViewEmpallinfo> list = this.session.selectList("com.icss.dao.ViewEmpallinfoMapper.empinfo");
		return new PageBean<ViewEmpallinfo>(list);
	}

	@Override
	public PageBean<ViewEmpallinfo> selectByname(String ename,int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, CustomerinfoMapperImpl.PAGESIZE);
		List<ViewEmpallinfo> list = this.session.selectList("com.icss.dao.ViewEmpallinfoMapper.selectByname",ename);
		return new PageBean<ViewEmpallinfo>(list);
	}

}
