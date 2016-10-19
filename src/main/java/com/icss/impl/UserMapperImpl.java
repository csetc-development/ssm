/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.User;
import com.icss.bean.UserRole;
import com.icss.bean.ViewUserEmpallinfo;
import com.icss.dao.UserMapper;
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class UserMapperImpl extends BasicSqlSupport implements UserMapper{

	//每页10条数据
	public static final int PAGESIZE = 10;
	
	@Override
	public int deleteByPrimaryKey(String username) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public User selectByPrimaryKey(String username) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.UserMapper.selectByPrimaryKey",username);
	}
	
	@Override
	public List<Role> getRoles(String username) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getRoles",username);
	}
	
	@Override
	public List<Permission> getPermissions(String username) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getPermissions",username);
	}

	@Override
	public String getPwd(Integer eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.UserMapper.getPwd",eid);
	}

	@Override
	public int updatePwd(User user) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.UserMapper.updatePwd", user);
	}

	@Override
	public PageBean<ViewUserEmpallinfo> getOnlyHaveUser(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<ViewUserEmpallinfo> list = this.session.selectList("com.icss.dao.ViewUserEmpallinfoMapper.getOnlyHaveUser");
		return new PageBean<ViewUserEmpallinfo>(list);
	}

	@Override
	public PageBean<ViewUserEmpallinfo> getNullUser(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, PAGESIZE);
		List<ViewUserEmpallinfo> list = this.session.selectList("com.icss.dao.ViewUserEmpallinfoMapper.getNullUser");
		return new PageBean<ViewUserEmpallinfo>(list);
	}

   
	@Override
	public ViewUserEmpallinfo getInfoByEid(int eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.ViewUserEmpallinfoMapper.getInfoByEid",eid);
	}
	
	
	@Override
	public ViewUserEmpallinfo getNullInfoByEid(int eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.ViewUserEmpallinfoMapper.getNullInfoByEid",eid);
	}

	@Override
	public List<Role> getAllRole() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getAllRole");
	}

	@Override
	public List<Permission> getAllPerms() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getAllPerms");
	}

	@Override
	public List<Permission> getPermsByrid(int rid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserMapper.getPermsByrid",rid);
	}
	
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.UserMapper.updateByPrimaryKeySelective", user);
	}
	
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.UserMapper.insertSelective", user);
	}

	@Override
	public int insertUserRole(UserRole userrole) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.UserRoleMapper.insertSelective", userrole);
	}
	
	@Override
	public List<UserRole> checkUserRole(UserRole userrole) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.UserRoleMapper.checkUserRole",userrole);
	}
	
	@Override
	public int deleteUser(int eid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.UserMapper.deleteUserByEid", eid);
	}
	
	@Override
	public int deleteUserRole(int eid) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.UserRoleMapper.deleteByPrimaryKey", eid);
	}
	
	@Override
	public int getuidByeid(int eid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.UserMapper.getuidByeid", eid);
	}
	
	
	@Override
	public PageBean<ViewUserEmpallinfo> getHaveByrname(String ename) {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, PAGESIZE);
		List<ViewUserEmpallinfo> list = this.session.selectList("com.icss.dao.ViewUserEmpallinfoMapper.getHaveByrname", ename);
		return new PageBean<ViewUserEmpallinfo>(list);
	}
	
	@Override
	public PageBean<ViewUserEmpallinfo> getNotHaveByrname(String ename) {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, PAGESIZE);
		List<ViewUserEmpallinfo> list = this.session.selectList("com.icss.dao.ViewUserEmpallinfoMapper.getNotHaveByrname", ename);
		return new PageBean<ViewUserEmpallinfo>(list);
	}
}