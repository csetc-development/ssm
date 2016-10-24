package com.icss.impl;

import java.util.List;

import com.icss.bean.User;
import com.icss.dao.UserMapper;
import com.icss.util.BasicSqlSupport;

public class UserMapperImpl extends BasicSqlSupport implements UserMapper{

	@Override
	public int deleteByPrimaryKey(String username) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public User selectByPrimaryKey(String username) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.UserMapper.selectByPrimaryKey",username);
	}
	
	@Override
	public List<String> getRoles(String username) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getRoles",username);
	}
	
	@Override
	public List<String> getPermissions(String username) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getPermissions",username);
	}

	@Override
	public String getPwd(Integer eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.UserMapper.getPwd",eid);
	}

	@Override
	public int updatePwd(User user) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.UserMapper.updatePwd", user);
	}

   
}