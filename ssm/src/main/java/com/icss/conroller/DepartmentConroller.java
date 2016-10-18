package com.icss.conroller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Department;
import com.icss.business.DepartmentBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/dept")
public class DepartmentConroller {

	@Resource(name = "departmentBusiness")
	private DepartmentBusiness departmentBusiness = null;

	public void setDepartmentBusiness(DepartmentBusiness departmentBusiness) {
		this.departmentBusiness = departmentBusiness;
	}

	/**
	 * 
	 * 新增部门信息
	 */
	@RequestMapping("add.do")
	public ModelAndView dept(@ModelAttribute("dept") Department dept) {
		departmentBusiness.insert(dept);
		String msg = "新增部门成功";
		return new ModelAndView("admin/admin_manager", "msg", msg);
	}

	/**
	 * 
	 * 查看部门信息
	 */
	@RequestMapping(value = "selectDeptInfo.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectDeptInfo(HttpServletRequest request) {
		StringBuilder sb = departmentBusiness.select();
		String selectHtml = sb.toString();
		return selectHtml;
	}

	/**
	 * 查找所有部门编号
	 */
	@RequestMapping(value = "selectAllDeptno.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectAllDeptno(HttpServletRequest request) {
		String did = request.getParameter("did");
		return departmentBusiness.checkdeptno(did);
	}

	/**
	 * 查找所有部门名称
	 */
	@RequestMapping(value = "selectAllDeptname.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String selectAllDeptname(HttpServletRequest request) {
//		System.out.println("传过来的部门编号是：" + request.getParameter("dname"));
		String dname = request.getParameter("dname");
		return departmentBusiness.checkdeptname(dname);
	}
	
	//获得部门信息
	@RequestMapping("getDeptInfo.do")
	public String getDeptInfo(HttpSession session) {
		List<Department> list = departmentBusiness.getDeptinfo();
		session.setAttribute("deptinfo", list);
		return "employee/UpdateEmployee";
	}

	/*************************************** cq ************************************************/

	// 按id查询
	@RequestMapping("selectByid.do")
	public ModelAndView selectByPrimaryKey(HttpServletRequest request) {
		Integer did = Integer.valueOf(request.getParameter("id"));
		Department Department = departmentBusiness.selectByPrimaryKey(did);
		return new ModelAndView("employee/UpdateDepartment", "Department", Department);
	}
	
	// 修改
	@RequestMapping("update.do")
	public String update(@ModelAttribute("Department") Department Department) {
		departmentBusiness.update(Department);
		return "redirect:/empinfo/empmanagement.do";
	}

	// 删除
	@RequestMapping("delete.do")
	public String delete(HttpServletRequest request) {
		Integer did = Integer.valueOf(request.getParameter("id"));
		departmentBusiness.delete(did);
		System.out.println(did);
		return "employee/Employee_manager";
	}

	// 分页
	@RequestMapping(value = "pageselect.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String pageselect(HttpServletRequest request,
			HttpSession session) {
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		int num;
		if (pageNum == null || "NaN".equals(pageNum)) {
			num = 0;
		} else {
			num = Integer.parseInt(pageNum);
		}

		PageBean<Department> page = departmentBusiness.selectAllInfo(num);
		List<Department> Pers = page.getList();
		session.setAttribute("pages", page.getPages());
		JSONArray jsonArray = JSONArray.fromObject(Pers);
		return jsonArray.toString();
	}

}
