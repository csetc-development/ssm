package com.icss.dao;

import java.util.List;

import com.icss.bean.Customerinfo;
import com.icss.bean.Etcclass;
import com.icss.bean.Score;
import com.icss.bean.Space;
import com.icss.bean.Stay;
import com.icss.bean.Students;
import com.icss.bean.StudentsManagement;
import com.icss.bean.Studentsinfo;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.ViewSigpayinfo;
import com.icss.util.PageBean;

public interface StudentsMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Students record);

    int insertSelective(Students record);

    Students selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Students record);

    int updateByPrimaryKey(Students record);
    
    List<Studentsinfo> getStuByClass(int etcid);
    
    StudentsManagement selectBysid(int sid);
    
    ViewAllcustomerinfo customeroneinfo(int crid);
    
    int updatecustomerstatus(Customerinfo cus);
    
    ViewSigpayinfo payacco(int crid);
    
    List<Space> accoadd(int belongid);
    
    int addstay(Stay stay);
    
    String selectnamebyid(int crid);
    
    List<String> selectBystupy(String namepinyin);
    
    List<String> selectBystucha(String namecha);
    
    List<Studentsinfo> selectstuinfoBypy(String name);
    
    List<Studentsinfo> selectstuinfoBycn(String name);
    
    PageBean<Studentsinfo> studentsinfo(int pagenum);
    
    List<Etcclass> allowaddstuclass();
    
    int deletestusinfo(List<String> list);
    
    int deletestaysinfo(List<String> list);
    
    int variousupdatacus(List<String> list);
    
    List<Studentsinfo> kaohebyclass(int etcid);
    
    int addcheckinfo(Score score);
    
    List<Studentsinfo> selectstuscore(int etcid);
    
    int updatastuscore(Score score);
    
    List<Studentsinfo> stagescore();
}