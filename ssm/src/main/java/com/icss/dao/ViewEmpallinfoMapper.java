package com.icss.dao;

import com.icss.bean.ViewEmpallinfo;
import com.icss.util.PageBean;

public interface ViewEmpallinfoMapper {
    int insert(ViewEmpallinfo record);

    int insertSelective(ViewEmpallinfo record);
    
    ViewEmpallinfo getoneinfo(int eid);
    
    int updateoneinfo(ViewEmpallinfo emp);
    
    PageBean<ViewEmpallinfo> empinfo(int pagenum);
    
    PageBean<ViewEmpallinfo> selectByname(String ename,int pagenum);
}