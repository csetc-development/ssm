package com.icss.dao;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.RolePerm;
import com.icss.util.PageBean;

public interface RolePermMapper {
    
	PageBean<Role> getAllRolepage(int pagenum);
	
	PageBean<Permission> getAllPermpage(int pagenum);
	
	Role getRoleInfoByrid(int rid);
	
	int updateRole(Role role);
	
	int deleteRolePerm(int rid);
	
	int insertRolePerm(RolePerm roleperm);
	
	PageBean<Role> getRoleByrdesc(String desc);
	
	PageBean<Permission> getPermBydesc(String desc);
}