package com.icss.business;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import com.icss.bean.Department;
import com.icss.dao.DepartmentMapper;
import com.icss.util.PageBean;

public class DepartmentBusiness {
	private DepartmentMapper departmentDAO = null;

	public DepartmentMapper getDepartmentDAO() {
		return departmentDAO;
	}

	public void setDepartmentDAO(DepartmentMapper departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	public int insert(Department dept) {
		return departmentDAO.insertSelective(dept);
	}

	public StringBuilder select() {

		List<Department> list = departmentDAO.selectDeptInfo();
		StringBuilder sbHtml = new StringBuilder();

		for (Department department : list) {
			Integer did = department.getDid();
			String dname = department.getdName();
			sbHtml.append("<option value=\"");
			sbHtml.append(did);
			sbHtml.append("\">");
			sbHtml.append(dname);
			sbHtml.append("</option>");
		}
		System.out.println(sbHtml.toString());
		return sbHtml;
	}

	public String checkdeptno(String did) {

		List<Department> list = departmentDAO.selectDeptInfo();
		Iterator<Department> it = list.iterator();
		while (it.hasNext()) {
			if (it.next().getDid().toString().equals(did)) {
				return "已存在该编号";
			}
		}
		return null;

	}

	public String checkdeptname(String dname) {

		List<Department> list = departmentDAO.selectDeptInfo();
		Iterator<Department> it = list.iterator();
		while (it.hasNext()) {
			if (it.next().getdName().equals(dname)) {
				// System.out.println(dname);
				return "已存在该部门名称";
			}
		}
		return null;
	}

	public List<Department> getDeptinfo(){
		return departmentDAO.selectDeptInfo();
	}
	
	/*******************************************cq***********************************************/
	
	// 查询所有
	public List<Department> selectAll() {
		return departmentDAO.selectDeptInfo();
	}

	// 查询(按id来查询)
	public Department selectByPrimaryKey(Integer did) {
		if (did != 0) {
			return departmentDAO.selectByPrimaryKey(did);
		}

		return null;
	}

	// 删除
	public int delete(Integer did) {
		return departmentDAO.deleteByPrimaryKey(did);
	}

	// 修改
	public int update(Department record) {
		return departmentDAO.updateByPrimaryKeySelective(record);
	}

	public PageBean<Department> selectAllInfo(int pageNumber) {

		return departmentDAO.selectAll(pageNumber);
	}

}
