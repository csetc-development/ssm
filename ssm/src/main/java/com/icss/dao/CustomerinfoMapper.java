package com.icss.dao;


import java.util.List;

import com.icss.bean.CustomerStauts;
import com.icss.bean.Customerinfo;
import com.icss.bean.Detailed;
import com.icss.bean.PayType;
import com.icss.bean.Socialrelations;
import com.icss.bean.Space;
import com.icss.bean.Studentsinfo;
import com.icss.bean.Studydirection;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.WorkExperience;
import com.icss.util.PageBean;

public interface CustomerinfoMapper {
    int deleteByPrimaryKey(Integer crid);

    int insert(Customerinfo record);

    int insertSelective(Customerinfo record);
    
    int insertDetailed(Detailed detailed);

    Customerinfo selectByPrimaryKey(Integer crid);

    int updateByPrimaryKeySelective(Customerinfo record);

    int updateByPrimaryKey(Customerinfo record);
      
    ViewAllcustomerinfo customeroneinfo(int crid);
    
    PageBean<ViewAllcustomerinfo> allcusinfo(int pagenum);
    
    PageBean<ViewAllcustomerinfo> customertype(int pagenum,int cronline);
    
    PageBean<CustomerStauts> allcustatus(int pagenum);
    
    PageBean<ViewAllcustomerinfo> somecusByname(int pagenum, String name);
     
    int updateByPrimaryKeyDetailed(Detailed detailed);
    
    List<WorkExperience> workexperience(int crid);
    
    int insertworkexperience(WorkExperience work);
    
    int deleteworkexperience(int weid);
    
    int updateexperience(WorkExperience work);
    
    List<Socialrelations> selectSocail(int crid);
    
    int updateSocial(Socialrelations social);
    
    int deleteSocial(int srid);
    
    int insertSocial(Socialrelations social);
    
    List<PayType> alltype();
    
    List<Studydirection> allstudaycourse();
    
    List<Space> allSpace();
    
    int batchupdatecus(List<Integer> list);
    
    PageBean<Studentsinfo> allstuinfo(int pagenum);
}