package com.icss.business;

import java.util.List;

import com.icss.bean.CusArea;
import com.icss.dao.CusAreaMapper;

public class CusAreaBusiness {
	CusAreaMapper cusareaDao;

	public CusAreaMapper getCusareaDao() {
		return cusareaDao;
	}

	public void setCusareaDao(CusAreaMapper cusareaDao) {
		this.cusareaDao = cusareaDao;
	}

	public List<CusArea> selectAllareaname(){
		return cusareaDao.allAreaName();
	}
}
