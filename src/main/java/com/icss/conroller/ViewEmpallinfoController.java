package com.icss.conroller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.bean.Department;
import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.User;
import com.icss.bean.ViewEmpallinfo;
import com.icss.business.DepartmentBusiness;
import com.icss.business.UserBusiness;
import com.icss.business.ViewEmpallinfoBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/empinfo")
public class ViewEmpallinfoController {
	
	@Resource(name="viewEmpallinfoBusiness")
	private ViewEmpallinfoBusiness viewEmpallinfoBusiness = null;

	public void setViewEmpallinfoBusiness(
			ViewEmpallinfoBusiness viewEmpallinfoBusiness) {
		this.viewEmpallinfoBusiness = viewEmpallinfoBusiness;
	}

	@Resource(name="userBusiness")
	private UserBusiness userBusiness = null;

	public void setUserBusiness(
			UserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}
	
	@Resource(name="departmentBusiness")
	private DepartmentBusiness departmentBusiness = null;

	public void setDepartmentBusiness(DepartmentBusiness departmentBusiness) {
		this.departmentBusiness = departmentBusiness;
	}


	//个人中心
	@RequestMapping("showMe.do")
	public String showMe(HttpServletRequest request,HttpSession session){
		Subject subject = SecurityUtils.getSubject();
		User tempuser = userBusiness.getByUsername((String) subject.getPrincipal());
			int eid= tempuser.getEid();
			String username = tempuser.getUsername();
			ViewEmpallinfo empall = viewEmpallinfoBusiness.getoneemp(eid);
			empall.setPassword("");
			session.setAttribute("loginemp", empall);
			//获取个人信息的用户角色描述
			List<Role> rolelist= userBusiness.getRoles(username);
			List<String> roles = new ArrayList<String>();  
			 if(rolelist!=null){  
		            for(Role Role:rolelist){  
		                //将数据库中角色限描述放入集合  
		            	roles.add(Role.getDescription());  
		            }  
		        }	
			//获取个人信息的用户权限描述
			List<Permission> permslist= userBusiness.getPermissions(username);
			List<String> permissions = new ArrayList<String>();  
			 if(permslist!=null){  
		            for(Permission Permission:permslist){  
		                //将数据库中的权限描述放入集合  
		            	permissions.add(Permission.getDescription());  
		            }  
		        }
			session.setAttribute("empinforoles", roles);
			session.setAttribute("empinfopermissions", permissions);
			return "public/mine";
	}
	
	//修改个人信息(页面跳转)
	@RequestMapping("editMyInfo.do")
	public String editMyInfo(){
		return "admin/edit_mineInfo";
	}

	// 修改个人信息
	@RequestMapping("updataMyInfo.do")
	public String updataMyInfo(@ModelAttribute("empinfo") ViewEmpallinfo empinfo){
		System.out.println(empinfo.getEducation());
		viewEmpallinfoBusiness.updateoneinfo(empinfo);
		return "redirect:/empinfo/showMe.do";
	}
	
	//员工管理
	@RequestMapping("empmanagement.do")
	public String empmanagement(HttpServletRequest request,HttpSession session){
		PageBean<ViewEmpallinfo> page = viewEmpallinfoBusiness.empmanagement(1);
		List<ViewEmpallinfo> EmpInfo = page.getList();
		PageBean<Department> dept = departmentBusiness.selectAllInfo(1);
		List<Department> depts = dept.getList();
		session.setAttribute("pages", page.getPages());
		session.setAttribute("EmpInfo", EmpInfo);
		session.setAttribute("Department", depts);
		return "sale/employee";
	}
	
	//分页的员工
	@RequestMapping(value="empage.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String emppage(HttpServletRequest request){
		int pagenum = Integer.valueOf(request.getParameter("pageNum"));
		System.out.println(pagenum);
		PageBean<ViewEmpallinfo> page = viewEmpallinfoBusiness.empmanagement(pagenum);
		List<ViewEmpallinfo> EmpInfo = page.getList();
		JSONArray jsonArray = JSONArray.fromObject(EmpInfo);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	//查找员工信息
	@RequestMapping(value="selectempbyname.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectempbyname(HttpServletRequest request){
		int pagenum = Integer.valueOf(request.getParameter("pagenum"));
		PageBean<ViewEmpallinfo> page = viewEmpallinfoBusiness.selectByname(request.getParameter("ename"), pagenum);
		List<ViewEmpallinfo> viewemp = page.getList();
		JSONArray jsonArray = JSONArray.fromObject(viewemp);
//		System.out.println(viewemp.size());
//		System.out.println(jsonArray.toString());
		return jsonArray.toString(); 
	}
}
