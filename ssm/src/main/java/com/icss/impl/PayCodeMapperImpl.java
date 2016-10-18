package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Codecustomer;
import com.icss.bean.CodesInfo;
import com.icss.bean.Language;
import com.icss.bean.PayCode;
import com.icss.bean.Receivables;
import com.icss.bean.SaleRanking;
import com.icss.bean.Studydirection;
import com.icss.dao.PayCodeMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class PayCodeMapperImpl extends BasicSqlSupport implements PayCodeMapper{

	@Override
	public int deleteByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.PayCodeMapper.deleteByPrimaryKey",cid);
	}

	@Override
	public int insert(PayCode record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(PayCode record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.PayCodeMapper.insertSelective",record);
	}

	@Override
	public PayCode selectByPrimaryKey(Integer cid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.PayCodeMapper.selectByPrimaryKey", cid);
	}

	@Override
	public int updateByPrimaryKeySelective(PayCode record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.PayCodeMapper.updateByPrimaryKeySelective",record);
	}

	@Override
	public int updateByPrimaryKey(PayCode record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SaleRanking> ranking(String date) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.ranking",date);
	}

	@Override
	public List<SaleRanking> bustyperanking(String date) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.bustyperanking",date);
	}

	@Override
	public List<SaleRanking> deptranking(String date) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.deptranking",date);
	}
	
	@Override
	public List<SaleRanking> arearanking(String date) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.arearanking",date);
	}

	@Override
	public List<SaleRanking> monthranking(String date) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.monthranking",date);
	}

	@Override
	public List<SaleRanking> monthtyperanking(PayCode code) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.monthtyperanking",code);
	}

	@Override
	public List<PayCode> selectAll() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.selectAllInfo");
	}

	@Override
	public PageBean<CodesInfo> selectAll(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum,CustomerinfoMapperImpl.PAGESIZE);
		List<CodesInfo> list = this.session.selectList("com.icss.dao.PayCodeMapper.selectAllInfo");
		return new PageBean<CodesInfo>(list);
	}

	@Override
	public CodesInfo selectonecodeBycid(int cid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.PayCodeMapper.selectonecodeBycid", cid);
	}

	@Override
	public PageBean<Receivables> creceivables(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum,CustomerinfoMapperImpl.PAGESIZE);
		List<Receivables> list = this.session.selectList("com.icss.dao.PayCodeMapper.creceivables");
		return new PageBean<Receivables>(list);
	}

	@Override
	public PageBean<Codecustomer> codecustomer(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum,CustomerinfoMapperImpl.PAGESIZE);
		List<Codecustomer> list = this.session.selectList("com.icss.dao.PayCodeMapper.codecustomer");
		return new PageBean<Codecustomer>(list);
	}
	
	@Override
	public List<Codecustomer> codecustomer(){
		return this.session.selectList("com.icss.dao.PayCodeMapper.codecustomer");
	}

	@Override
	public List<Studydirection> studydirection() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.studydirection");
	}

	@Override
	public List<Language> studylanguage() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.studylanguage");
	}

	@Override
	public List<Language> ecity() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayCodeMapper.ecity");
	}

}
