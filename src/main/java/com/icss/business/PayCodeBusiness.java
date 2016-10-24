package com.icss.business;

import java.util.Calendar;
import java.util.List;

import com.icss.bean.Codecustomer;
import com.icss.bean.CodesInfo;
import com.icss.bean.Language;
import com.icss.bean.PayCode;
import com.icss.bean.Receivables;
import com.icss.bean.SaleRanking;
import com.icss.bean.Studydirection;
import com.icss.dao.PayCodeMapper;
import com.icss.util.PageBean;

public class PayCodeBusiness {

	private PayCodeMapper paycodeDAO;

	public PayCodeMapper getPaycodeDAO() {
		return paycodeDAO;
	}

	public void setPaycodeDAO(PayCodeMapper paycodeDAO) {
		this.paycodeDAO = paycodeDAO;
	}

	//获得当前年份和月份
	public String getNowDate(){
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		StringBuilder builder = null;
		if (month < 10) {
			builder = new StringBuilder(year + "-0");
		} else {
			builder = new StringBuilder(year + "-");
		}
		String date = builder.append(month).toString();
		return date;
	}
	
	public int inserCode(PayCode pcode) {
		return paycodeDAO.insertSelective(pcode);
	}
	
	public List<SaleRanking> ranking(){
		return paycodeDAO.ranking(getNowDate());
	}
	
	public List<SaleRanking> bustyperanking(){
		return paycodeDAO.bustyperanking(getNowDate());			
	}
	
	public List<SaleRanking> deptranking(){
		return paycodeDAO.deptranking(getNowDate());
	}
	
	public List<SaleRanking> arearanking(){
		return paycodeDAO.arearanking(getNowDate());
	}
	
	public List<SaleRanking> monthranking(){
		return paycodeDAO.monthranking(getNowDate().substring(0, 4));
	}
	
	public List<SaleRanking> monthtyperanking(String typename){
		PayCode code = new PayCode();
		code.setCremark(typename);
		code.setCtime(getNowDate().substring(0, 4));
		return paycodeDAO.monthtyperanking(code);
		
	}
	
	public PageBean<Codecustomer> selectallcode(int pagenum){
		return paycodeDAO.codecustomer(pagenum);
	}
	public List<Codecustomer> selectallcode(){
		return paycodeDAO.codecustomer();
	}
	
	public PageBean<Receivables> creceivables(int pagenum){
		return paycodeDAO.creceivables(pagenum);
	}
	
	/**
	 * 学习方向
	 */
	public List<Studydirection>  studydi(){
		return paycodeDAO.studydirection();
	}
	/**
	 * 学习过的语言
	 * @return
	 */
	public List<Language>  language(){
		return paycodeDAO.studylanguage();
	}
	/**
	 * 意向就业城市
	 * @return
	 */
	public List<Language>  ecity(){
		return paycodeDAO.ecity();
	}
	
	
	
	/*************************************************cq********************************************************/
	//删除	
	public int delete(Integer cid){
			return paycodeDAO.deleteByPrimaryKey(cid);			
	}
	
	//更新数据
	public int updataCodes(PayCode code){
		//System.out.println("更新数据");
		return paycodeDAO.updateByPrimaryKeySelective(code);
	}
	
	
	//查询(按id来查询)
	public PayCode selectByPrimaryKey(Integer cid){
		
			return paycodeDAO.selectByPrimaryKey(cid);
	}
	
	//查询所有
	public List<PayCode> selectAll(){
		return paycodeDAO.selectAll();
	}
	
	/**  
     * 分页
     */
	public PageBean<CodesInfo>selectAllInfo(int pageNumber){
		return paycodeDAO.selectAll(pageNumber);		
	}
	

}
