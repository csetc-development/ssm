package com.icss.dao;

import java.util.List;

import com.icss.bean.PayRecord;
import com.icss.bean.Sigdet;

public interface PayRecordMapper {
    int deleteByPrimaryKey(Integer prid);

    int insert(PayRecord record);

    int insertSelective(PayRecord record);

    PayRecord selectByPrimaryKey(Integer prid);

    int updateByPrimaryKeySelective(PayRecord record);

    int updateByPrimaryKey(PayRecord record);
    
    Float countmomey(int prpaycode);
    
    List<Sigdet> sigpaydet(int prpaycode);
}