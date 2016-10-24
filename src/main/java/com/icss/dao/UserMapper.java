/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.dao;

import java.util.List;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.User;
import com.icss.bean.UserRole;
import com.icss.bean.ViewUserEmpallinfo;
import com.icss.util.PageBean;

public interface UserMapper {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<Permission> getPermissions(String username);

	List<Role> getRoles(String username);
	
	List<Role> getAllRole();
	
	List<Permission> getAllPerms();
	
	List<Permission> getPermsByrid(int rid);
	
	String getPwd(Integer eid);
	
	int updatePwd(User user);
	
	int updateUser(User user);
	
	int insertUser(User user);
	
	int insertUserRole(UserRole userrole);

	List<UserRole> checkUserRole(UserRole userrole);
	
	int deleteUser(int eid);
	
	int deleteUserRole(int eid);
	
	int getuidByeid(int eid);
	
	PageBean<ViewUserEmpallinfo> getHaveByrname(String ename);
	
	PageBean<ViewUserEmpallinfo> getNotHaveByrname(String ename);
	
	PageBean<ViewUserEmpallinfo> getOnlyHaveUser(int pagenum);
	
	PageBean<ViewUserEmpallinfo> getNullUser(int pagenum);

	ViewUserEmpallinfo getInfoByEid(int eid);
	
	ViewUserEmpallinfo getNullInfoByEid(int eid);
	

}