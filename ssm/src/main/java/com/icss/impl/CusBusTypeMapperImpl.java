package com.icss.impl;

import java.util.List;

import com.icss.bean.CusBusType;
import com.icss.dao.CusBusTypeMapper;
import com.icss.util.BasicSqlSupport;

public class CusBusTypeMapperImpl extends BasicSqlSupport implements CusBusTypeMapper{

	@Override
	public int deleteByPrimaryKey(Integer btid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(CusBusType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(CusBusType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CusBusType selectByPrimaryKey(Integer btid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(CusBusType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(CusBusType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CusBusType> allBusType() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.CusBusTypeMapper.allBusType");
	}

}
