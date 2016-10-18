package com.icss.business;

import java.util.List;



import com.icss.bean.CusBusType;
import com.icss.dao.CusBusTypeMapper;

public class CusBusTypeBusiness {
	CusBusTypeMapper cusbustypeDao;

	public CusBusTypeMapper getCusbustypeDao() {
		return cusbustypeDao;
	}

	public void setCusbustypeDao(CusBusTypeMapper cusbustypeDao) {
		this.cusbustypeDao = cusbustypeDao;
	}
	
	public List<CusBusType> selectAllbusTypename(){
		return cusbustypeDao.allBusType();
	}
}
