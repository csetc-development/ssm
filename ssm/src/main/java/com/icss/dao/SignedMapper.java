package com.icss.dao;


import com.icss.bean.Iaer;
import com.icss.bean.Signed;
import com.icss.util.PageBean;

public interface SignedMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Signed record);

    int insertSelective(Signed record);

    Signed selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Signed record);

    int updateByPrimaryKey(Signed record);
    
    PageBean<Signed> signedinfoIsMine(String sale,int pagenum);
    
    PageBean<Signed> pending(int stateid,int pagenum);
    
    Signed onesignedinfo(int sid);
    
    int addrecord(Iaer iaer);
}