/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.RolePerm;
import com.icss.dao.RolePermMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class RolePermMapperImpl extends BasicSqlSupport implements RolePermMapper{

	//每页10条数据
	public static final int PAGESIZE = 10;
	
	@Override
	public PageBean<Role> getAllRolepage(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<Role> list = this.session.selectList("com.icss.dao.UserMapper.getAllRole");
		return new PageBean<Role>(list);
	}
	@Override
	public PageBean<Permission> getAllPermpage(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<Permission> list = this.session.selectList("com.icss.dao.UserMapper.getAllPerms");
		return new PageBean<Permission>(list);
	}
	
	@Override
	public Role getRoleInfoByrid(int rid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.RoleMapper.selectByPrimaryKey",rid);
	}
	
	@Override
	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.RoleMapper.updateByPrimaryKeySelective",role);
	}
	
	
	@Override
	public int deleteRolePerm(int rid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.RolePermMapper.deleteRolePermByrid",rid);
	}
	
	@Override
	public int insertRolePerm(RolePerm roleperm) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.RolePermMapper.insertSelective",roleperm);
	}
	
	@Override
	public  PageBean<Role> getRoleByrdesc(String description) {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, PAGESIZE);
		List<Role> list = this.session.selectList("com.icss.dao.RoleMapper.selectRoleByDescription",description);
		return new PageBean<Role>(list);
	}
	
	@Override
	public  PageBean<Permission> getPermBydesc(String description) {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, PAGESIZE);
		List<Permission> list = this.session.selectList("com.icss.dao.PermissionMapper.selectPermByDescription",description);
		return new PageBean<Permission>(list);
	}
}