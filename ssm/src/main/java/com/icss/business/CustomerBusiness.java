package com.icss.business;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.icss.bean.CustomerStauts;
import com.icss.bean.Customerinfo;
import com.icss.bean.Detailed;
import com.icss.bean.PayType;
import com.icss.bean.Socialrelations;
import com.icss.bean.Space;
import com.icss.bean.Studentsinfo;
import com.icss.bean.Studydirection;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.WorkExperience;
import com.icss.dao.CustomerinfoMapper;
import com.icss.util.PageBean;

public class CustomerBusiness {
	private CustomerinfoMapper customerDao;

	public CustomerinfoMapper getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerinfoMapper customerDao) {
		this.customerDao = customerDao;
	}
	
	public PageBean<ViewAllcustomerinfo> selectAllcus(int pagenum){
		return customerDao.allcusinfo(pagenum);
	}
	
	public PageBean<ViewAllcustomerinfo> selectcustomertype(int pagenum ,int type){
		return customerDao.customertype(pagenum, type);
	}
	
	public int insertCustomer(Customerinfo customer){
		return customerDao.insertSelective(customer);
	}
	
	public int insertDetailed(Detailed detailed){
		return customerDao.insertDetailed(detailed);
	}
	
	public Customerinfo selectOneCus(Integer crid){
		return customerDao.selectByPrimaryKey(crid);
	}
	
	public ViewAllcustomerinfo customeronrinfo(int crid){
		return customerDao.customeroneinfo(crid);
	}
	
	public int updataCustomerInfo(Customerinfo customer) {
		return customerDao.updateByPrimaryKeySelective(customer);
		
	}
	//批量删除（修改）客户信息
	public int updatebatchcus(String str){
		String [] strArrays = str.trim().split(",");
		Integer[] intArray=new Integer[strArrays.length];     
        for (int i = 0; i < intArray.length; i++) {
            intArray[i] = Integer.parseInt((strArrays[i]));
        }
        List<Integer> list  = Arrays.asList(intArray);
        System.out.println(list.toString());
		return customerDao.batchupdatecus(list);
	}
	
	//更新详细信息
	public int updatedeinfo(Detailed detailed){
		return customerDao.updateByPrimaryKeyDetailed(detailed);
	}
	
	//新增客户工作经历
	public int addworkexperience(WorkExperience work){
		return customerDao.insertworkexperience(work);
	}
	
	//查看工作经历
	public List<WorkExperience> lookexperience(int crid){
		return customerDao.workexperience(crid);
	}
	
	//删除工作经历
	public int deleteexperience(int weid){
		return customerDao.deleteworkexperience(weid);
	}
	
	//修改工作经历
	public int updateexprience(WorkExperience work){
		return customerDao.updateexperience(work);
		
	}
	
	//新增客户社会关系
	public int insertsocial(Socialrelations social){
		return customerDao.insertSocial(social);
	}
	
	//查看社会关系
	public List<Socialrelations> selectsocial(int crid){
		return customerDao.selectSocail(crid);
	}
	
	//修改社会关系
	public int updatesocial(Socialrelations social){
		return customerDao.updateSocial(social);
	}
	
	//删除社会关系
	public int deletesocial(int srid){
		return customerDao.deleteSocial(srid);
	}
	
	//获得收款类型
	public List<PayType> getpaytype(){
		return customerDao.alltype();
	}
	
	//获得学习方向
	public List<Studydirection> getstudaycourse(){
		return customerDao.allstudaycourse();
	}
	
	//获得住宿地址
	public List<Space> getSpace(){
		return customerDao.allSpace();
	}
	
	//获得所有已入学客户信息
	public PageBean<Studentsinfo> allstuinfo(int pagenum){
		return customerDao.allstuinfo(pagenum);
	}
	
	public PageBean<CustomerStauts> selectAllstatus(int pagenum){
		return customerDao.allcustatus(pagenum);
	}
	
	public int delectonecusbyid(int crid){
		return customerDao.deleteByPrimaryKey(crid);
	}
	
	public PageBean<ViewAllcustomerinfo> selectByname(int pagenum ,String name){
		return customerDao.somecusByname(pagenum, name);
	}
}
