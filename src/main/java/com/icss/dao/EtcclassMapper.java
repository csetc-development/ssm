package com.icss.dao;

import java.util.List;

import com.icss.bean.Etcclass;
import com.icss.bean.Studentsinfo;

public interface EtcclassMapper {
    int deleteByPrimaryKey(Integer etcid);

    int insert(Etcclass record);

    int insertSelective(Etcclass record);

    Etcclass selectByPrimaryKey(Integer etcid);

    int updateByPrimaryKeySelective(Etcclass record);

    int updateByPrimaryKey(Etcclass record);
    
    List<Studentsinfo> getStuByClass(int etcid);
    
    List<Etcclass> allclassinfo();
}