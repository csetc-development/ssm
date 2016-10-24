package com.icss.impl;

import com.icss.bean.ViewSigpayinfo;
import com.icss.dao.ViewSigpayinfoMapper;
import com.icss.util.BasicSqlSupport;

public class ViewSigpayinfoMapperImpl extends BasicSqlSupport implements ViewSigpayinfoMapper {

	@Override
	public int insert(ViewSigpayinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(ViewSigpayinfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ViewSigpayinfo selectonepay(int cid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.ViewSigpayinfoMapper.selectonepay", cid);
	}

}
