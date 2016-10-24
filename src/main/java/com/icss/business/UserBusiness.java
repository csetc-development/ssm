/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.business;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Md5Hash;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.User;
import com.icss.bean.UserRole;
import com.icss.bean.ViewUserEmpallinfo;
import com.icss.dao.UserMapper;
import com.icss.util.PageBean;

public class UserBusiness {
	/*********************************************Mapper配置*******************************************/
	private UserMapper userDao;	
	
	public UserMapper getUserDao() {
		return userDao;
	}

	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}
	

	/*********************************************Business函数*******************************************/	
	
	/**  
     * 得到用户名
     * @param  String username
     * @param  无
     * @return User
     */ 
	public User getByUsername(String username){
		return userDao.selectByPrimaryKey(username);
	}
	
	/**  
     * 得到用户角色
     * @param  String username
     * @param  无
     * @return List<Role>
     */ 
	public List<Role> getRoles(String username){	
		return userDao.getRoles(username);
	}
	
	/**  
     * 得到用户权限
     * @param  String username
     * @param  无
     * @return List<Permission>
     */ 
	public List<Permission> getPermissions(String username){		
		return userDao.getPermissions(username);
	}
	
	/**  
     * 得到所有的角色信息
     * @param  无
     * @param  无
     * @return List<Role>
     */ 
	public List<Role> getAllRole() {
		return userDao.getAllRole();
	} 
	
	
	
	/**  
     * 得到所有的权限信息
     * @param  无
     * @param  无
     * @return List<Permission>
     */ 
	public List<Permission> getAllPerms() {
		return userDao.getAllPerms();
	} 

	
	/**  
     * 根据角色ID得到该角色的权限信息
     * @param  List<String> ridlist
     * @param  无
     * @return List<Permission>
     */ 
	public List<Permission> getallPermsByrid(List<String> ridlist) {
		List<Permission> permlist = new ArrayList<Permission>();
		for(int i = 0;i<ridlist.size();i++){
			if(i==0){
				permlist.addAll(userDao.getPermsByrid(Integer.parseInt(ridlist.get(i).trim())));
			}else{
				permlist.addAll(userDao.getPermsByrid(Integer.parseInt(ridlist.get(i).trim())));
				permlist = removeDuplicate(permlist);
			}
		}
		return permlist;
	}
	
	/**  
     * 修改密码钱，检测老密码比对是否输入正确
     * @param  int eid
     * @param  String password
     * @return String
     */ 
	public String getPwd(Integer eid,String password){
		System.out.println("password:"+password);
		String oldpwd =md5(password);
		System.out.println("oldpwd:"+oldpwd);
		System.out.println(userDao.getPwd(eid));
		if(oldpwd.equals(userDao.getPwd(eid))){
			//老密码比对正确
			System.out.println("比对成功");
			return "yes";
		}else{
			System.out.println("比对失败");
			return "密码不正确！";
		}
	}
	
	/**
	 * 修改密码--更新数据库
     * @param  User user
     * @param  无
     * @return int
     */ 
	public int updatePwd(User user){
		System.out.println("username:"+user.getUsername());
		String password = user.getPassword();
		System.out.println("password:"+password);
		String newPwd =md5(password);
		user.setPassword(newPwd);
/*		System.out.println("newPwd（MD5后）:"+newPwd);
		System.out.println("class:"+user.getClass());
		System.out.println("eid:"+user.getEid());
		System.out.println("rid:"+user.getRid());*/
		return userDao.updatePwd(user);
	}

	/**  
     * 只显示有用户的员工信息
     * @param  int pagenum
     * @param  无
     * @return PageBean<ViewUserEmpallinfo>
     */ 
	public PageBean<ViewUserEmpallinfo> haveuserinfo(int pagenum){
		return userDao.getOnlyHaveUser(pagenum);
	}
	
	/**  
     * 只显示没有用户的员工信息(没有用户名、角色、权限)
     * @param  int pagenum
     * @param  无
     * @return PageBean<ViewUserEmpallinfo>
     */ 
	public PageBean<ViewUserEmpallinfo> nulluserinfo(int pagenum){
		return userDao.getNullUser(pagenum);
	}
	
	/**  
     * 根据eid得到某个有用户员工的信息
     * @param  int eid
     * @param  无
     * @return ViewUserEmpallinfo
     */ 
	public ViewUserEmpallinfo getInfoByEid(int eid){
		return userDao.getInfoByEid(eid);
	}
	
	/**  
     * 根据eid得到某个没有用户员工的信息
     * @param  int eid
     * @param  无
     * @return ViewUserEmpallinfo
     */ 
	public ViewUserEmpallinfo getNullInfoByEid(int eid){
		return userDao.getNullInfoByEid(eid);
	}
	
	
	/**  
     * 根据eidlist得到多个没有用户员工的姓名
     * @param  List<String> list
     * @param  无
     * @return List<String>
     */ 
	public Map<String, List<String>> getNameByEidlist(List<String> list){
		List<String> namelist = new ArrayList<String>();
		List<String> birthlist = new ArrayList<String>();
		//根据每个员工eid查出每个员工名ename，返还姓名组
		for(int i = 0;i<list.size();i++){
			int eid = Integer.parseInt(list.get(i));
			namelist.add(userDao.getNullInfoByEid(eid).getEname());
			birthlist.add(userDao.getNullInfoByEid(eid).getEbrithday());
		}
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("namelist",namelist);
		map.put("birthlist",birthlist);
		return map;
	}
	
	/**  
     * 修改用户-更新数据库
     * @param  User user
     * @param  无
     * @return int
     */ 
	public int updateUser(User user){
		System.out.println("username:"+user.getUsername());
		String password = user.getPassword();
		System.out.println("password:"+password);
		String newPwd =md5(password);
		user.setPassword(newPwd);
		return userDao.updateUser(user);
	}
	
	/**  
	 * 添加用户-更新数据库
     * @param  User user
     * @param  无
     * @return int
     */ 
	public int insertUser(User user){
		System.out.println("username:"+user.getUsername());
		String password = user.getPassword();
		System.out.println("password:"+password);
		String newPwd =md5(password);
		user.setPassword(newPwd);
		return userDao.insertUser(user);
	}
	
	/**  
	 * 添加用户角色-更新数据库
     * @param  UserRole userrole
     * @param  无
     * @return int
     */ 
	public int insertUserRole(UserRole userrole){
		List<String> rolelist =new ArrayList<String>();
		try {
			rolelist = Arrays.asList(userrole.getRidlist().split(","));
			for(int i=0;i<rolelist.size();i++){
				userrole.setRid(Integer.parseInt(rolelist.get(i).trim()));
				//如果检测到数据库中是否存在该用户一样的角色，不存在则添加
				if(checkUserRole(userrole)==1){
					userDao.insertUserRole(userrole);
				}else{
					//存在则不添加
				}
			}
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	 /**
	 * 判断新增角色中，所传数据是否有重复，有则删除
	 * @param  UserRole userrole
     * @param  无
     * @return int
	 */
	public int checkUserRole(UserRole userrole){
		int judge = 1;
		List<UserRole> userrolelist =new ArrayList<UserRole>();
		userrolelist = userDao.checkUserRole(userrole);
		for(int i=0;i<userrolelist.size();i++){
			//如果查询的UserRole-list里的ID等于空，则
			if(userrolelist.get(i).getId()==null){	
				//judge参数不变，值为1
			}else{
				//否则只要在list里存在ID，即该用户有相同的角色，judge参数变为0
				judge = 0;
			}
		}
		return judge;
	}

	/**  
	 * 删除用户-更新数据库
     * @param  int eid
     * @param  无
     * @return int 
     */ 
	public int deleteUser(int eid){
		return userDao.deleteUser(eid);
	}
	
	
	/**  
	 * 删除用户角色-更新数据库
     * @param  int eid
     * @param  无
     * @return int 
     */ 
	public int deleteUserRole(int eid){
		return userDao.deleteUserRole(eid);
	}
	
	/**  
	 * 根据员工姓名搜索有用户的员工信息
     * @param  User user
     * @param  无
     * @return int
     */ 
	public PageBean<ViewUserEmpallinfo> getHaveByrname(String ename){
		return userDao.getHaveByrname(ename);
	}
	
	/**  
	 * 根据员工eid搜索用户uid
     * @param  int eid
     * @param  无
     * @return int
     */ 
	public int getuidByeid(int eid){
		return userDao.getuidByeid(eid);
	}
	
	
	/**  
	 * 根据员工姓名搜索没有用户的员工信息
     * @param  User user
     * @param  无
     * @return int
     */ 
	public PageBean<ViewUserEmpallinfo> getNotHaveByrname(String ename){
		return userDao.getNotHaveByrname(ename);
	}
	
	
	/**
	 * 加密函数
	 */
    public static String md5(String str){
    	//加密盐
		String salt = "zhongruanguojietc";
	    return new Md5Hash(str,salt).toString() ;
	 }
	 
    
    /**
	 * 去除重复权限函数
	 */
    public static List<Permission> removeDuplicate(List<Permission> permlist)  {     
    	if(permlist.size()>1){
    		for(int i=0;i<permlist.size()-1;i++){    
    	       for(int j=permlist.size()-1;j>i;j--)  {     
				  if(permlist.get(j).getPid()== permlist.get(i).getPid()){     
				     permlist.remove(j);     
				  }      
    	       }      
	    	}  
    	}
     return permlist;     
    } 
    
   
}
