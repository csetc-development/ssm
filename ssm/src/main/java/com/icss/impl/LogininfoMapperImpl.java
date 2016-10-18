package com.icss.impl;

import com.icss.bean.Logininfo;
import com.icss.dao.LogininfoMapper;
import com.icss.util.BasicSqlSupport;

public class LogininfoMapperImpl extends BasicSqlSupport implements LogininfoMapper{

	@Override
	public int deleteByPrimaryKey(String loginid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Logininfo record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.LogininfoMapper.insert", record);
	}

	@Override
	public int insertSelective(Logininfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Logininfo selectByPrimaryKey(String loginid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Logininfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Logininfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
