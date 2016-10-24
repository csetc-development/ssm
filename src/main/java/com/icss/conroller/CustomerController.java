package com.icss.conroller;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Codecustomer;
import com.icss.bean.CusArea;
import com.icss.bean.CusBusType;
import com.icss.bean.CustomerStauts;
import com.icss.bean.Customerinfo;
import com.icss.bean.Detailed;
import com.icss.bean.Socialrelations;
import com.icss.bean.Space;
import com.icss.bean.Studentsinfo;
import com.icss.bean.Studydirection;
import com.icss.bean.User;
import com.icss.bean.ViewEmpallinfo;
import com.icss.bean.ViewSigpayinfo;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.WorkExperience;
import com.icss.business.CusAreaBusiness;
import com.icss.business.CusBusTypeBusiness;
import com.icss.business.CustomerBusiness;
import com.icss.business.PayCodeBusiness;
import com.icss.business.ViewSigpayinfoBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource(name="customerBusiness")
	private CustomerBusiness customerBusiness = null;

	public void setCustomerBusiness(CustomerBusiness customerBusiness) {
		this.customerBusiness = customerBusiness;
	}

	@Resource(name="cusAreaBusiness")
	private CusAreaBusiness cusAreaBusiness = null;

	public void setCusAreaBusiness(CusAreaBusiness cusAreaBusiness) {
		this.cusAreaBusiness = cusAreaBusiness;
	}

	@Resource(name="cusBusTypeBusiness")
	private CusBusTypeBusiness cusBusTypeBusiness = null;

	public void setCusBusTypeBusiness(CusBusTypeBusiness cusBusTypeBusiness) {
		this.cusBusTypeBusiness = cusBusTypeBusiness;
	}
	
	@Resource(name="paycodeBusiness")
	private PayCodeBusiness paycodeBusiness =null;
	
	public void setPaycodeBusiness(PayCodeBusiness paycodeBusiness) {
		this.paycodeBusiness = paycodeBusiness;
	}
	
	@Resource(name="viewSigpayinfoBusiness")
	private ViewSigpayinfoBusiness viewSigpayinfoBusiness=null;

	public void setViewSigpayinfoBusiness(
			ViewSigpayinfoBusiness viewSigpayinfoBusiness) {
		this.viewSigpayinfoBusiness = viewSigpayinfoBusiness;
	}

	//客户管理查看所有客户信息
	@RequestMapping("manager.do")
	public String manager(HttpSession session){
		PageBean<ViewAllcustomerinfo> page = customerBusiness.selectAllcus(1);
		List<ViewAllcustomerinfo> customers = page.getList();
		session.setAttribute("allCostomerInfo", customers);
		session.setAttribute("pages", page.getPages());
		return "customer/customer";
	}
	
	//用分页查看10条客户信息
	@RequestMapping("cuspage.do")
	public @ResponseBody String cuspage(HttpServletRequest request){
		int pagenum = Integer.valueOf(request.getParameter("pagenum"));
		List<ViewAllcustomerinfo> list = customerBusiness.selectAllcus(pagenum).getList();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString(); 
	}
	
	@RequestMapping("managerement.do")
	public @ResponseBody String managerement(HttpServletRequest request){
		int pageNum;
		try{
			pageNum = Integer.valueOf(request.getParameter("pageNum"));
		}catch(Exception e){
			pageNum = 1;
		}
		PageBean<ViewAllcustomerinfo> page = customerBusiness.selectAllcus(pageNum);
		List<ViewAllcustomerinfo> costomers = page.getList();
		JSONArray jsonArray = JSONArray.fromObject(costomers);
		return jsonArray.toString();
	}
	
	//新增客户信息（看是否签单）
	@RequestMapping("addCustomer.do")
	public String addCustomer(HttpSession session, @ModelAttribute("customer") Customerinfo customer ,@ModelAttribute("detailed") Detailed detailed){
		User emp = (User) session.getAttribute("tempuser");
		customer.setEid(emp.getEid());
		customerBusiness.insertCustomer(customer);
		int crid = customer.getCrid();
		detailed.setCdid(crid);
		customerBusiness.insertDetailed(detailed);
		return "redirect:/customer/manager.do"; 
	}
	
	//查看某类型客户信息
	@RequestMapping("customertype.do")
	public @ResponseBody String customertype(HttpServletRequest request){
		PageBean<ViewAllcustomerinfo> page = null;
		int type=0;
		try{
			type = Integer.valueOf(request.getParameter("type"));
			page = customerBusiness.selectcustomertype(1, type);
		}catch(Exception e){
			page = customerBusiness.selectAllcus(1);
		}
		if(type<3){//未签单
			return JSONArray.fromObject(page).toString();
		}else if(type==3){//已签单
			return JSONArray.fromObject(paycodeBusiness.selectallcode(1)).toString();
		}else{//已入学
			return JSONArray.fromObject(customerBusiness.allstuinfo(1)).toString();
		}
		
	}
	
	//查看某个客户信息
	@RequestMapping("selectOnecustomer.do")
	public ModelAndView selectOnecustomer(HttpServletRequest request,HttpSession session){
		int crid =Integer.valueOf( request.getParameter("crid"));
		ViewAllcustomerinfo customer = customerBusiness.customeronrinfo(crid);
		//工作经历
		List<WorkExperience> experience = customerBusiness.lookexperience(crid);
		session.setAttribute("experiencelist", experience);
		//社会关系
		List<Socialrelations> social = customerBusiness.selectsocial(crid);
		session.setAttribute("sociallist", social);
		return new ModelAndView("customer/customer_register","customer",customer);
	}
	
	//修改某客户信息
	@RequestMapping("updatecustrunonjsp.do")
	public String updatecustrunonjsp(HttpServletRequest request,HttpSession session){
		ViewAllcustomerinfo cus = customerBusiness.customeronrinfo(Integer.parseInt(request.getParameter("crid")));
		session.setAttribute("customer", cus);
		return "customer/customer_updateinfo";
	}
	
	//批量删除修改客户信息
	@RequestMapping("batchupdatecus.do")
	public String batchupdatecus(HttpServletRequest request){
		String str = request.getParameter("str").substring(0, request.getParameter("str").length()-1);
		customerBusiness.updatebatchcus(str);
		return "redirect:/customer/manager.do";
	}
	
	//新增工作经历
	@RequestMapping("addexperience.do")
	public String addexperience(@ModelAttribute("work") WorkExperience work){
		System.out.println(work.getCrid());
		customerBusiness.addworkexperience(work);
		return"redirect:/customer/selectOnecustomer.do?crid="+work.getCrid();
	}
	
	//删除工作经验
	@RequestMapping("deleteworkexperience.do")
	public String deleteworkexperience(HttpServletRequest request){
		customerBusiness.deleteexperience(Integer.valueOf(request.getParameter("weid")));
		return "redirect:/customer/selectOnecustomer.do?crid="+request.getParameter("crid");
	}
	
	//修改工作经验
	@RequestMapping("updateworkexperience.do")
	public String updateworkexperience(@ModelAttribute("workexperience") WorkExperience workexperience){
		customerBusiness.updateexprience(workexperience);
		return "redirect:/customer/selectOnecustomer.do?crid="+workexperience.getCrid();
	}
	
	//新增社会关系
	@RequestMapping("insertsocial.do")
	public String insertsocial(@ModelAttribute("social") Socialrelations social){
		customerBusiness.insertsocial(social);
		return "redirect:/customer/selectOnecustomer.do?crid="+social.getCrid();
	}
	
	//修改社会关系
	@RequestMapping("updatesocial.do")
	public String updatesocial(@ModelAttribute("social") Socialrelations social){
		customerBusiness.updatesocial(social);
		return "redirect:/customer/selectOnecustomer.do?crid="+social.getCrid();
	}
	
	//删除社会关系
	@RequestMapping("deletesocial.do")
	public String deletesocial(HttpServletRequest request){
		customerBusiness.deletesocial(Integer.valueOf(request.getParameter("srid")));
		return "redirect:/customer/selectOnecustomer.do?crid="+request.getParameter("crid");
	}
	
	//更新某客户基本信息
	@RequestMapping("basicinfo.do")
	public String basicinfo(@ModelAttribute("customerinfo") Customerinfo customerinfo ,@ModelAttribute("detailed") Detailed detailed ){
//		System.out.println(detailed.getAcquaintance());
		customerBusiness.updataCustomerInfo(customerinfo);
		System.out.println(customerinfo.getCrid());
		detailed.setCdid(customerinfo.getCrid());
		System.out.println("detailed"+detailed.getCdid());
		customerBusiness.updatedeinfo(detailed);
		return "redirect:/customer/selectOnecustomer.do?crid="+customerinfo.getCrid();
	}
	
	//确定为上门客户
	@RequestMapping("doorcustomer.do")
	public String doorcustomer(@RequestParam("crid") Integer crid){
		Customerinfo customerinfo = new Customerinfo();
		customerinfo.setCronline(2);
		customerinfo.setCrid(crid);
		customerBusiness.updataCustomerInfo(customerinfo);
		return "redirect:/customer/manager.do";
	}
	
	//编辑某客户信息
	@RequestMapping("edit_customer.do")
	public String editCustomer(@ModelAttribute("customerinfo") Customerinfo customerinfo){
		System.out.println("更新编辑客户信息");
		customerBusiness.updataCustomerInfo(customerinfo);
		return "redirect:/customer/manager.do";
	}
	
	//获取所有业务类型
	@RequestMapping("getAllbustype.do")
	public @ResponseBody String getAllbustype(){
		List<CusBusType> list = cusBusTypeBusiness.selectAllbusTypename();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}
	
	@RequestMapping("getAllbustype1.do")
	public String getAllbustype1(HttpSession session){
		List<CusBusType> list = cusBusTypeBusiness.selectAllbusTypename();
		session.setAttribute("allbustype", list);
		return "redirect:/customer/getAllareaname1.do";
	}
	
	
	//获得所有地区名称
	@RequestMapping("getAllareaname.do")
	public @ResponseBody String getAllareaname(){
		List<CusArea> list = cusAreaBusiness.selectAllareaname();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}
	
	@RequestMapping("getAllareaname1.do")
	public String getAllareaname1(HttpSession session){
		List<CusArea> list = cusAreaBusiness.selectAllareaname();
		session.setAttribute("allareaname", list);
//		return "business/UpdeteCodes";
		return "customer/add_code";
	}
	
	//查看客户状态（已签单，未签单）
	@RequestMapping(value="selectCustomerStatus.do", produces = "text/plain;charset=UTF-8")
	public  @ResponseBody String selectCustomerStatus(HttpSession session,HttpServletRequest request){
		Integer pageNum = Integer.valueOf(request.getParameter("pageNum"));
//		System.out.println("**********页数"+pageNum);
		PageBean<CustomerStauts> empstatus = customerBusiness.selectAllstatus(pageNum);
		List<CustomerStauts> list = empstatus.getList();
		session.setAttribute("pages", empstatus.getPages());
		JSONArray jsonArray = JSONArray.fromObject(list); 
		return jsonArray.toString();
	}
	
	//删除客户信息（保证没有签单）
	@RequestMapping("deleteOneCustomer.do")
	public String deleteOneCustomer(HttpServletRequest request){
		Integer crid =Integer.valueOf(request.getParameter("crid"));
		System.out.println(crid);
		customerBusiness.delectonecusbyid(crid);
		return "redirect:/customer/manager.do";
	}
	
	//签单（页面跳转）
	@RequestMapping(value="addcode.do", produces = "text/plain;charset=UTF-8")
	public String addcode(HttpSession session,@RequestParam("crid") Integer crid){
		ViewAllcustomerinfo customer = customerBusiness.customeronrinfo(crid);
		session.setAttribute("cusinfo", customer);
		//付款类型
		/*List<PayType> paytypes = customerBusiness.getpaytype();
		session.setAttribute("paytypes", paytypes);*/
		//学习方向
		List<Studydirection> studaycourse = customerBusiness.getstudaycourse();
		session.setAttribute("studaycourse", studaycourse);
		//住宿地址
		List<Space> space = customerBusiness.getSpace();
		session.setAttribute("space", space);
		return "redirect:/customer/getAllbustype1.do";
		
	}
	
	//根据用户姓名查询
	@RequestMapping("customersName.do")
	public @ResponseBody String customerName(HttpServletRequest request){
		String cusname = request.getParameter("cusName");
		PageBean<ViewAllcustomerinfo> page = customerBusiness.selectByname(1, cusname);
		List<ViewAllcustomerinfo> list = page.getList();
		/*Iterator<ViewAllcustomerinfo> it= list.iterator();
		while(it.hasNext()){
			ViewAllcustomerinfo user = it.next();
			System.out.println(user.getCrname()+"**"+user.getCid());
		}*/
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	//核对收款
	@RequestMapping(value="cheques.do", produces = "text/plain;charset=UTF-8")
	public String cheques(HttpServletRequest request,HttpSession session){
		int cid = Integer.valueOf(request.getParameter("cid"));
		try {
			String str=new String(request.getParameter("syname").getBytes("ISO8859-1"),"utf-8");
			session.setAttribute("syname", str);
//			System.out.println(str);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		ViewSigpayinfo sigpay = viewSigpayinfoBusiness.selectpayone(cid);
		session.setAttribute("sigpay", sigpay);
		return "redirect:/payrecord/getcountmoney.do?cid="+cid+"&status=1";
	}
	
	//退费
	@RequestMapping("rebate.do")
	public String rebate(HttpServletRequest request,HttpSession session){
		int cid = Integer.valueOf(request.getParameter("cid"));
		try {
			String str=new String(request.getParameter("syname").getBytes("ISO8859-1"),"utf-8");
			session.setAttribute("syname", str);
			System.out.println(str);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		ViewSigpayinfo sigpay = viewSigpayinfoBusiness.selectpayone(cid);
		session.setAttribute("sigpay", sigpay);
		return "redirect:/payrecord/getcountmoney.do?cid="+cid+"&status=2";
		
	}
}
