package com.icss.dao;

import java.util.List;

import com.icss.bean.Codecustomer;
import com.icss.bean.CodesInfo;
import com.icss.bean.Language;
import com.icss.bean.PayCode;
import com.icss.bean.Receivables;
import com.icss.bean.SaleRanking;
import com.icss.bean.Studydirection;
import com.icss.util.PageBean;

public interface PayCodeMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(PayCode record);

    int insertSelective(PayCode record);

    PayCode selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(PayCode record);

    int updateByPrimaryKey(PayCode record);
    
    List<SaleRanking> ranking(String date);
    
    List<SaleRanking> bustyperanking(String date);
    
    List<SaleRanking> deptranking(String date);
    
    List<SaleRanking> arearanking(String date);
    
    List<SaleRanking> monthranking(String date);
    
    List<SaleRanking> monthtyperanking(PayCode code);
    
    PageBean<Codecustomer> codecustomer(int pagenum);
    
    List<Codecustomer> codecustomer();
    
    /**********陈强***********/
    List<PayCode> selectAll();
    
    PageBean<CodesInfo> selectAll(int pagenum);
    
    CodesInfo selectonecodeBycid(int cid);
    
    PageBean<Receivables> creceivables(int pagenum);
    
    
    /**
     * 所有学习方向
     */
    List<Studydirection> studydirection();
    
    /**
     * 所有学习过的语言
     */
    List<Language> studylanguage();
    /**
     * 意向的就业城市
     */
    List<Language> ecity();
}