package com.icss.dao;

import java.util.List;

import com.icss.bean.Empinfo;
import com.icss.util.PageBean;

public interface EmpinfoMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Empinfo record);

    int insertSelective(Empinfo record);

    Empinfo selectByPrimaryKey(Integer eid);

    int updateByPrimaryKeySelective(Empinfo record);

    int updateByPrimaryKey(Empinfo record);
    
    List<Empinfo> selectsuper(int did);
    
    List<Empinfo> findAll(); 
    
    PageBean<Empinfo> selectAll(int pagenum);
}