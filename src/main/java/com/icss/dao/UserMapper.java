package com.icss.dao;

import java.util.List;

import com.icss.bean.Signed;
import com.icss.bean.User;

public interface UserMapper {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<String> getPermissions(String username);

	List<String> getRoles(String username);

	String getPwd(Integer eid);

	int updatePwd(User user);
	
}