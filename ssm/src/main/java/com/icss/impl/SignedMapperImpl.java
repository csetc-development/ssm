package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Signed;
import com.icss.dao.SignedMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class SignedMapperImpl extends BasicSqlSupport implements SignedMapper{

	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Signed record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Signed record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Signed selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Signed record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Signed record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PageBean<Signed> signedinfoIsMine(String sale,int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, CustomerinfoMapperImpl.PAGESIZE);
		List<Signed> list = this.session.selectList("com.icss.dao.SignedMapper.signedinfoIsMine",sale);
		return new PageBean<Signed>(list);
	}

	@Override
	public PageBean<Signed> pending(int stateid,int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, CustomerinfoMapperImpl.PAGESIZE);
		List<Signed> list = this.session.selectList("com.icss.dao.SignedMapper.pending",stateid);
		return new PageBean<Signed>(list);
	}

}
