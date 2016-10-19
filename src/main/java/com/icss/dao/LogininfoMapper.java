package com.icss.dao;

import com.icss.bean.Logininfo;

public interface LogininfoMapper {
    int deleteByPrimaryKey(String loginid);

    int insert(Logininfo record);

    int insertSelective(Logininfo record);

    Logininfo selectByPrimaryKey(String loginid);

    int updateByPrimaryKeySelective(Logininfo record);

    int updateByPrimaryKey(Logininfo record);
}