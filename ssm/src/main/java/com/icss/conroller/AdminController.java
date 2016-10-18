package com.icss.conroller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icss.bean.Empinfo;
import com.icss.business.EmpinfoBusiness;
import com.icss.business.LogininfoBusiness;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Resource(name="empinfoBusiness")
	private EmpinfoBusiness empinfoBusiness=null;
	
	public void setEmpinfoBusiness(EmpinfoBusiness empinfoBusiness) {
		this.empinfoBusiness = empinfoBusiness;
	}

	@Resource(name="logininfoBusiness")
	private LogininfoBusiness logininfoBusiness =null;

	public void setLogininfoBusiness(LogininfoBusiness logininfoBusiness) {
		this.logininfoBusiness = logininfoBusiness;
	}

	@RequestMapping("manager.do")
	public String admin_manager(){
		//System.out.println("管理员");
		return "admin/admin_manager";
	}
	
	//新增员工
	@RequestMapping("add.do")
	public String add(@ModelAttribute("emp") Empinfo emp){
		emp.setPid(1);
		empinfoBusiness.addnewemp(emp);
		int eid = emp.getEid();
		System.out.println(eid);
		logininfoBusiness.addlogin(emp.getEname(), eid);
		return "admin/admin_manager";
	}
}
