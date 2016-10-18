package com.icss.conroller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.bean.Department;
import com.icss.bean.Empinfo;
import com.icss.business.DepartmentBusiness;
import com.icss.business.EmpinfoBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/emp")
public class EmpinfoController {
	
	@Resource(name="empinfoBusiness")
	private EmpinfoBusiness empinfoBusiness=null;

	public void setEmpinfoBusiness(EmpinfoBusiness empinfoBusiness) {
		this.empinfoBusiness = empinfoBusiness;
	}
	
	@Resource(name="departmentBusiness")
	private DepartmentBusiness departmentBusiness = null;

	public void setDepartmentBusiness(DepartmentBusiness departmentBusiness) {
		this.departmentBusiness = departmentBusiness;
	}



	@RequestMapping(value="selectsuper.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectsuper(HttpServletRequest request){
		int did = Integer.valueOf(request.getParameter("did"));
		StringBuilder sb  = empinfoBusiness.selectsuper(did);
		return sb.toString();
	}
	
	
	//修改员工信息
	@RequestMapping("updataemoinfo.do")
	public String updateempinfo(@ModelAttribute("emp") Empinfo emp){
		empinfoBusiness.update(emp);
		return "redirect:/empinfo/empmanagement.do";
	}
	
	//管理首页
	@RequestMapping("adminindex.do")
	public String adminindex(){
		return "public/index";
	}
	
	/*********************************************陈强*******************************************/
	
	//跳转到员工管理页面
	@RequestMapping("manager.do")
	public String manager(HttpSession session,HttpServletRequest request){	
		List<Department> pageBydepart = departmentBusiness.selectAll();		
		PageBean<Empinfo> page = empinfoBusiness.selectAllInfo(1);
		List<Empinfo> EmpInfo = page.getList();
		session.setAttribute("pages", page.getPages());
		session.setAttribute("EmpInfo", EmpInfo);
		session.setAttribute("Department", pageBydepart);
		return "employee/Employee_manager";
	}
	
	
	/**  
     *编辑用户  
     * @param user  
     * @param request  
     * @return  
     */  
    @RequestMapping("updateUser.do")  
    public String updateUser(@ModelAttribute("empinfo")  Empinfo empinfo,HttpServletRequest request){
//    		String 	add=request.getParameter("eid");
//    		System.out.println(add);
    		empinfoBusiness.update(empinfo);     		
//    		System.out.println(request.getParameter("p_department"));  	
            return "employee/Employee_manager";  
       
    }  
    /**  
     * 根据id查询单个用户  
     * @param id  
     * @param request  
     * @return  
     */  
    @RequestMapping("selectByid.do")  
    public String selectUser(HttpServletRequest request,HttpSession session){  
    	Integer eid = Integer.valueOf(request.getParameter("eid"));
    	Empinfo empinfo=empinfoBusiness.select(eid);
    	Empinfo empsuper = new Empinfo();
    	if(empinfo.getSuperiorid()==null){
    		empsuper.setEid(1);
    		empsuper.setEname("boss");
    	}else{
    		empsuper=empinfoBusiness.select(empinfo.getSuperiorid());
    	}
    	System.out.println(empsuper.getEname());
    	session.setAttribute("empsuper", empsuper);
    	session.setAttribute("EmpInfo", empinfo);
    	return "redirect:/dept/getDeptInfo.do";
    }  
    /**  
     * 删除用户  
     * @param id  
     * @param request  
     * @param response  
     */  
    @RequestMapping("delUser.do")  
    public String delUser(HttpServletRequest request,Model model){  
    	 Integer eid =Integer.valueOf(request.getParameter("id"));
    	 System.out.println(eid);
    	 empinfoBusiness.delete(eid);
         return "employee/Employee_manager";  	 	 
    }  
    
    //  分页
	@RequestMapping(value="pageselect.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String pageselect(HttpServletRequest request,HttpSession session){
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		int num;
		if(pageNum==null||"NaN".equals(pageNum)){
			num=0;
		}else{
			num=Integer.parseInt(pageNum);
		}
		
		PageBean<Empinfo> page = empinfoBusiness.selectAllInfo(num);
		List<Empinfo> Pers = page.getList();	
		session.setAttribute("pages", page.getPages());
		JSONArray jsonArray = JSONArray.fromObject(Pers);
		return jsonArray.toString();
	}
	
	//查询一个员工
	@RequestMapping("selectemp.do")
	public String selectemp(HttpSession session){
		List<Empinfo> list = empinfoBusiness.selectAllInfo();
		session.setAttribute("allemp", list);
		return "redirect:/customer/getAllbustype1.do";
	}
	
}
