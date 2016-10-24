/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.business;



import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.RolePerm;
import com.icss.bean.ViewUserEmpallinfo;
import com.icss.dao.RolePermMapper;
import com.icss.util.PageBean;

public class RolePermBusiness {

	/*********************************************Mapper配置*******************************************/
	private RolePermMapper rolepermDao;	
	
	public RolePermMapper getRolepermDao() {
		return rolepermDao;
	}


	public void setRolepermDao(RolePermMapper rolepermDao) {
		this.rolepermDao = rolepermDao;
	}
	
	

	/*********************************************Business函数*******************************************/	
	
	
	/**  
     * 得到所有的角色信息，同时分页
     * @param  无
     * @param  无
     * @return PageBean<Role>
     */ 
	public PageBean<Role> getAllRolepage(int pagenum) {
		return rolepermDao.getAllRolepage(pagenum);
	} 	
	
	
	/**  
     * 得到所有的权限信息，同时分页
     * @param  无
     * @param  无
     * @return PageBean<Permission>
     */ 
	public PageBean<Permission> getAllPermpage(int pagenum) {
		return rolepermDao.getAllPermpage(pagenum);
	} 
	
	/**  
     * 根据rid得到角色信息
     * @param  int rid
     * @param  无
     * @return Role
     */ 
	public Role getRoleInfoByrid(int rid){
		return rolepermDao.getRoleInfoByrid(rid);
	}
	
	/**  
     * 更新角色的描述
     * @param  Role role
     * @param  无
     * @return int
     */ 
	public int updateRole(Role role){
		return rolepermDao.updateRole(role);
	}
	
	/**  
     * 根据pid得到角色信息
     * @param  int pid
     * @param  无
     * @return Role
     */ 
	public Permission getPermInfoBypid(int pid){
		return rolepermDao.getPermInfoBypid(pid);
	}
	
	/**  
     * 更新权限的描述
     * @param  Permission perm
     * @param  无
     * @return int
     */ 
	public int updatePerm(Permission perm){
		return rolepermDao.updatePerm(perm);
	}
	
	/**  
	 * 删除角色的权限-更新数据库
     * @param  int rid
     * @param  无
     * @return int 
     */ 
	public int deleteRolePerm(int rid){
		return rolepermDao.deleteRolePerm(rid);
	}
   
	/**  
     * 新增角色的权限
     * @param  RolePerm roleperm
     * @param  无
     * @return int
     */ 
	public int insertRolePerm(RolePerm roleperm){
		List<String> pidlist =new ArrayList<String>();
		try {
			pidlist = Arrays.asList(roleperm.getPidlist().split(","));
			for(int i=0;i<pidlist.size();i++){
				roleperm.setPid(Integer.parseInt(pidlist.get(i).trim()));
				rolepermDao.insertRolePerm(roleperm);
			}
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	/**  
     * 根据description得到角色信息
     * @param  String desc
     * @param  无
     * @return PageBean<Role>
     */ 
	public  PageBean<Role> getRoleByrdesc(String desc){
		return rolepermDao.getRoleByrdesc(desc);
	}
	
	/**  
     * 根据description得到权限信息
     * @param  String desc
     * @param  无
     * @return Role
     */ 
	public  PageBean<Permission> getPermBydesc(String desc){
		return rolepermDao.getPermBydesc(desc);
	}
}
