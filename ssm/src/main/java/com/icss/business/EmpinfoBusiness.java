package com.icss.business;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.icss.bean.Department;
import com.icss.bean.Empinfo;
import com.icss.dao.EmpinfoMapper;
import com.icss.util.PageBean;

public class EmpinfoBusiness {
	private  EmpinfoMapper empinfoDao;

	public EmpinfoMapper getEmpinfoDao() {
		return empinfoDao;
	}

	public void setEmpinfoDao(EmpinfoMapper empinfoDao) {
		this.empinfoDao = empinfoDao;
	}
	
	public int addnewemp(Empinfo emp){
		return empinfoDao.insertSelective(emp);
	}
	
	public StringBuilder selectsuper(int did){
				
		List<Empinfo> list = empinfoDao.selectsuper(did);
		StringBuilder sbHtml = new StringBuilder("<option value='1'>boss</option>");
		if(list.size()>0){
			for (Empinfo empinfo : list) {
				Integer eid = empinfo.getEid();
				String ename = empinfo.getEname();
				sbHtml.append("<option value=\"");
				sbHtml.append(eid);
				sbHtml.append("\">");
				sbHtml.append(ename);
				sbHtml.append("</option>");
			}
		}
		System.out.println(sbHtml.toString());
		return sbHtml;
	}
	
	
	public List<Empinfo> selectemp(){
		return empinfoDao.selectsuper(11);
	}
	
	public List<Empinfo> selectAllInfo(){
		return empinfoDao.findAll();
	}
	
	/******************************************陈强***************************************************/
	
	/**  
     * 查找全部
     */
	public List<Empinfo> findAll(){
		  return empinfoDao.findAll();
	  } 

	/**  
     * 删除
     */
	public  int delete(Integer eid){
		return empinfoDao.deleteByPrimaryKey(eid);
	}
	/**  
     * 查询  
     */
	public Empinfo select(Integer pid) {	
		return empinfoDao.selectByPrimaryKey(pid);
	}
	/**  
     * 修改  
     */
	public  int update(Empinfo record){	
		return empinfoDao.updateByPrimaryKeySelective(record);

	}
	/**  
     * 分页
     */
	public PageBean<Empinfo>selectAllInfo(int pageNumber){			
		return empinfoDao.selectAll(pageNumber);
}
	
	
}
