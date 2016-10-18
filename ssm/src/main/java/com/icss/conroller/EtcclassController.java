package com.icss.conroller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icss.bean.Etcclass;
import com.icss.business.EmpinfoBusiness;
import com.icss.business.EtccclassBusiness;

@Controller
@RequestMapping("/etcclass")
public class EtcclassController {	//班级管理
	
	@Resource(name="etcclassBusiness")
	private EtccclassBusiness etcclassBusiness =null;

	public void setEtcclassbusiness(EtccclassBusiness etcclassbusiness) {
		this.etcclassBusiness = etcclassbusiness;
	}
	
	@Resource(name="empinfoBusiness")
	private EmpinfoBusiness empinfoBusiness =null;
	

	@RequestMapping("management.do")
	public String management(HttpSession session){
		session.setAttribute("allclassinfo", etcclassBusiness.getallclass());//查询所有班级
		session.setAttribute("empinfos", empinfoBusiness.selectemp());//班主任（助教）信息
		return "etcclass/etcclass";
	}
	
	@RequestMapping("addclass.do")
	public String addclass(@ModelAttribute("etccclass") Etcclass etcclass){
		etcclassBusiness.addclasa(etcclass);
		return "redirect:/etcclass/management.do";
	}
	
	@RequestMapping("updateclass.do")
	public String updateclass(@ModelAttribute("etccclass") Etcclass etcclass){
		etcclassBusiness.updateclass(etcclass);
		return "redirect:/etcclass/management.do";
	}
}