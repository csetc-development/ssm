package com.icss.dao;

import com.icss.bean.ViewSigpayinfo;

public interface ViewSigpayinfoMapper {
	
    int insert(ViewSigpayinfo record);

    int insertSelective(ViewSigpayinfo record);
    
    ViewSigpayinfo selectonepay(int cid);
}