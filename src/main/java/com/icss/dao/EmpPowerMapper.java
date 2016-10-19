package com.icss.dao;

import com.icss.bean.EmpPower;

public interface EmpPowerMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(EmpPower record);

    int insertSelective(EmpPower record);

    EmpPower selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(EmpPower record);

    int updateByPrimaryKey(EmpPower record);
}