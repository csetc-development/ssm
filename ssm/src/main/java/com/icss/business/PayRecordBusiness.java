package com.icss.business;

import java.util.List;

import com.icss.bean.PayRecord;
import com.icss.bean.Sigdet;
import com.icss.dao.PayRecordMapper;

public class PayRecordBusiness {
	
	private PayRecordMapper payrecordDao;

	public PayRecordMapper getPayrecordDao() {
		return payrecordDao;
	}

	public void setPayrecordDao(PayRecordMapper payrecordDao) {
		this.payrecordDao = payrecordDao;
	}
	
	public int addrecord(PayRecord record){
		return payrecordDao.insert(record);
	}
	
	public Float countmoney(int cid){
		return payrecordDao.countmomey(cid);
	}

	public List<Sigdet> sigset(int prpaycode){
		return  payrecordDao.sigpaydet(prpaycode);
	}
}
