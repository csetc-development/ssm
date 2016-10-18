/**
 * @date 2016/10/17
 * @author 李敏
 * 签单相关的业务
 */
package com.icss.business;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.icss.bean.Signed;
import com.icss.bean.User;
import com.icss.dao.SignedMapper;
import com.icss.util.PageBean;

public class SignedBusiness {
	private SignedMapper signedDao;
	
	public SignedMapper getSignedDao() {
		return signedDao;
	}

	public void setSignedDao(SignedMapper signedDao) {
		this.signedDao = signedDao;
	}

	/**
	 * @param session
	 * 查询自己的签单
	 */
	public PageBean<Signed> getSignedinfo(HttpSession session){
		/*User sale = (User)session.getAttribute("tempuser");
		System.out.println(sale.getUsername());
		return signedDao.signedinfoIsMine(sale.getUsername());*/
		String sale = ((User)session.getAttribute("tempuser")).getUsername();
		return signedDao.signedinfoIsMine(sale,1);
	}
	
	/**
	 * @param stateid
	 * @return 根据状态查询签单相关信息
	 */
	public PageBean<Signed> financeSignedinfo(int stateid,int pagenum){
		return signedDao.pending(stateid,pagenum); 
	}
}
