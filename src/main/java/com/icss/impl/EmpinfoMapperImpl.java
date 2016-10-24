package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Empinfo;
import com.icss.dao.EmpinfoMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class EmpinfoMapperImpl extends BasicSqlSupport implements EmpinfoMapper{

	@Override
	public int deleteByPrimaryKey(Integer eid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.EmpinfoMapper.deleteByPrimaryKey", eid);
	}

	@Override
	public int insert(Empinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Empinfo record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.EmpinfoMapper.insertSelective", record);
	}

	@Override
	public Empinfo selectByPrimaryKey(Integer eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.EmpinfoMapper.selectByPrimaryKey", eid);
	}

	@Override
	public int updateByPrimaryKeySelective(Empinfo record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.EmpinfoMapper.updateByPrimaryKeySelective", record);
	}

	@Override
	public int updateByPrimaryKey(Empinfo record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.EmpinfoMapper.updateByPrimaryKey", record);
	}

	@Override
	public List<Empinfo> selectsuper(int did) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.EmpinfoMapper.selectsuper", did);
	}
	
	@Override
	public List<Empinfo> findAll() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.EmpinfoMapper.findAll");
	}
	
	@Override
	public PageBean<Empinfo> selectAll(int pagenum) {
		// TODO Auto-generated method stub
//		System.out.println("页面"+pagenum);
		PageHelper.startPage(pagenum,CustomerinfoMapperImpl.PAGESIZE);
		List<Empinfo> list = this.session.selectList("com.icss.dao.EmpinfoMapper.findAll");
		return new PageBean<Empinfo>(list);
	}

}
