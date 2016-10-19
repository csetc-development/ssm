package com.icss.impl;

import java.util.List;

import com.icss.bean.CusArea;
import com.icss.dao.CusAreaMapper;
import com.icss.util.BasicSqlSupport;

public class CusAreaMapperImpl extends BasicSqlSupport implements CusAreaMapper{

	@Override
	public int deleteByPrimaryKey(Integer aid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(CusArea record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(CusArea record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CusArea selectByPrimaryKey(Integer aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(CusArea record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(CusArea record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CusArea> allAreaName() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CusAreaMapper.allAreaName");
	}

}
