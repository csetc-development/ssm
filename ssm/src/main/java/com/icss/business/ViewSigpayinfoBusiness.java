package com.icss.business;

import com.icss.bean.ViewSigpayinfo;
import com.icss.dao.ViewSigpayinfoMapper;

public class ViewSigpayinfoBusiness {
	
	private ViewSigpayinfoMapper viewsigpsyinfoDao;

	public ViewSigpayinfoMapper getViewsigpsyinfoDao() {
		return viewsigpsyinfoDao;
	}

	public void setViewsigpsyinfoDao(ViewSigpayinfoMapper viewsigpsyinfoDao) {
		this.viewsigpsyinfoDao = viewsigpsyinfoDao;
	}
	
	public ViewSigpayinfo selectpayone(int cid){
		return viewsigpsyinfoDao.selectonepay(cid);
	}
}
