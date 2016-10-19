package com.icss.dao;

import java.util.List;

import com.icss.bean.CusBusType;

public interface CusBusTypeMapper {
    int deleteByPrimaryKey(Integer btid);

    int insert(CusBusType record);

    int insertSelective(CusBusType record);

    CusBusType selectByPrimaryKey(Integer btid);

    int updateByPrimaryKeySelective(CusBusType record);

    int updateByPrimaryKey(CusBusType record);
    
    List<CusBusType> allBusType();
}