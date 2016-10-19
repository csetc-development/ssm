package com.icss.dao;

import java.util.List;

import com.icss.bean.CusArea;

public interface CusAreaMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(CusArea record);

    int insertSelective(CusArea record);

    CusArea selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(CusArea record);

    int updateByPrimaryKey(CusArea record);
    
    List<CusArea> allAreaName();
}