/**
 * @date 2016/10/17
 * @author 李敏
 * 签单相关的业务
 */
package com.icss.business;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.icss.bean.Iaer;
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
	
	/**
	 * @param request
	 * @return 根据id查询整个签单信息
	 */
	public Signed selectSignedById(HttpServletRequest request){
		int sid = Integer.parseInt(request.getParameter("sid"));
		return signedDao.onesignedinfo(sid);
	}
	
	public int addAndChange(HttpServletRequest request, Iaer iaer){
		System.out.println("************************");
		System.out.println(request.getParameter("stateid"));
		System.out.println("************************");
		System.out.println(iaer.getSid());
		System.out.println(iaer.getTime());
		System.out.println(iaer.getHandler());
		return 0;
	}
	/** 
     * 读取Excel数据到数据库 
     * @param signed 
     * @return 
     * @author chen
     */  
	
	public void InsertSigned(Signed signed){
		/** 
	     * 读取Excel数据到数据库 
	     * @param signed 
	     * @return 
	     * @author chen
	     * 一，如果有CardId(唯一)，通过身份证CardId来进行去重复处理，得到上传数据的CardId,用CardId去查询数据，相同就不插入这条。
	     * 二，没有CardId，可以通过Customername来进行去重复处理，得到上传数据的Customername，用Customername去查询数据，
	     * 只要一个字段名的数据不同就插入，反之，则要在Excel表进行备注。
	     * 没有做。
	     */  
		String CardId=	signed.getScustomercardid();//获取上传的CardId.
		String Customername=signed.getScustomername();
		List<String> list=	signedDao.selectByCardId(CardId);//通过上传的CardID去数据查询所有的身份证信息，并得到一个list.
		List<String> listSigned=signedDao.selectByname(Customername);
	
			signedDao.insertSelective(signed);	
		
	}
}
