package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Iaer;
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
		 return this.session.insert("com.icss.dao.SignedMapper.insert", record);
	}

	@Override
	public int insertSelective(Signed record) {
		// TODO Auto-generated method stub
		System.out.println(record.getDept());
		 return this.session.insert("com.icss.dao.SignedMapper.insertSelective", record);
	}

	@Override
	public Signed selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.SignedMapper.selectByPrimaryKey", sid);
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

	@Override
	public Signed onesignedinfo(int sid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.SignedMapper.onesignedinfo",sid);
	}

	@Override
	public int addrecord(Iaer iaer) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.SignedMapper.addrecord", iaer);
	}

	@Override
	public List<String> selectByCardId(String CardId) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.SignedMapper.selectByCardId", CardId);
	}

	@Override
	public List<String> selectByname(String Customername) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.SignedMapper.selectByCardId", Customername);
	}

	@Override
	public Signed SelecByid(Integer sid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.SignedMapper.insertSelecByid", sid);
	}

	

	
	

}
