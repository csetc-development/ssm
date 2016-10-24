package com.icss.impl;

import java.util.List;

import com.icss.bean.Etcclass;
import com.icss.bean.Studentsinfo;
import com.icss.dao.EtcclassMapper;
import com.icss.util.BasicSqlSupport;

public class EtcclassMapperImpl extends BasicSqlSupport implements EtcclassMapper{

	@Override
	public int deleteByPrimaryKey(Integer etcid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Etcclass record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Etcclass record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.EtcclassMapper.insertSelective", record);
	}

	@Override
	public Etcclass selectByPrimaryKey(Integer etcid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.EtcclassMapper.selectByPrimaryKey", etcid);
	}

	@Override
	public int updateByPrimaryKeySelective(Etcclass record) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.EtcclassMapper.updateByPrimaryKeySelective",record);
	}

	@Override
	public int updateByPrimaryKey(Etcclass record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Studentsinfo> getStuByClass(int etcid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.getStuByClass",etcid);
	}

	@Override
	public List<Etcclass> allclassinfo() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.EtcclassMapper.allclassinfo");
	}
}
