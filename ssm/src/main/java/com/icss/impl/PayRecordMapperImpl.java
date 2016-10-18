package com.icss.impl;

import java.util.List;

import com.icss.bean.PayRecord;
import com.icss.bean.Sigdet;
import com.icss.dao.PayRecordMapper;
import com.icss.util.BasicSqlSupport;

public class PayRecordMapperImpl extends BasicSqlSupport implements PayRecordMapper{

	@Override
	public int deleteByPrimaryKey(Integer prid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(PayRecord record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.PayRecordMapper.insert", record);
	}

	@Override
	public int insertSelective(PayRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PayRecord selectByPrimaryKey(Integer prid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(PayRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(PayRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Float countmomey(int prpaycode) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.PayRecordMapper.countmomey",prpaycode);
	}

	@Override
	public List<Sigdet> sigpaydet(int prpaycode) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.PayRecordMapper.sigpaydet",prpaycode);
	}

}
