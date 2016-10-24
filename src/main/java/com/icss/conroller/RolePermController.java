/**
 * @date 2016/10/20
 * @author 王梓
 */
package com.icss.conroller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.RolePerm;
import com.icss.business.RolePermBusiness;
import com.icss.business.UserBusiness;
import com.icss.util.PageBean;



@Controller
@RequestMapping("roleperm")
public class RolePermController {	
	
	@Resource(name="rolepermBusiness")
	private RolePermBusiness rolepermBusiness = null;

	public void setRolePermBusiness(
			RolePermBusiness rolepermBusiness) {
		this.rolepermBusiness = rolepermBusiness;
	}

	@Resource(name="userBusiness")
	private UserBusiness userBusiness = null;

	public void setUserBusiness(
			UserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}

	/**  
     * 显示所有角色信息(显示第一页)
     * @param  HttpSession session
     * @param  无
     * @return String
     */    
    @RequestMapping("/roleinfo.do")
    public String roleinfo(HttpSession session) {
    	PageBean<Role> page = rolepermBusiness.getAllRolepage(1);
    	List<Role> role = page.getList();
		//每个人角色的权限
		List<Permission> permlist = new ArrayList<Permission>();
		StringBuffer perms = new StringBuffer();
     	List<String> ridlist = new ArrayList<String>();
     	for(int i=0;i<role.size();i++){
     		if(i==0){
     			ridlist.add(0, role.get(i).getRid().toString());
     		}else{
     			ridlist.set(0, role.get(i).getRid().toString());
     		}
     		permlist = userBusiness.getallPermsByrid(ridlist); 
     		for(int j=0;j<permlist.size();j++){
     			perms.append(permlist.get(j).getDescription());
 				if(j<permlist.size()-1){
 					perms.append(",");
 				}
     		}
     		role.get(i).setPermlist(perms.toString());
     		perms.setLength(0);
     	}
		session.setAttribute("role", role);
		session.setAttribute("rolepages", page.getPages());	
		//权限的页数放入session(为了使其查看正常页码，从数据库取出提前放好，再到JS中ajax使用)
		PageBean<Permission> page2 = rolepermBusiness.getAllPermpage(1);
		session.setAttribute("permpages",page2.getPages());
        return "admin/roleperm";
    }
    
	/**  
     * 显示所有角色信息(用分页查看10条客户信息)
     * @param  HttpServletRequest request
     * @param  无
     * @return String
     */    
    @RequestMapping("/roleinfopage.do")
    public @ResponseBody String roleinfopage(HttpServletRequest request) {
    	int pagenum = Integer.valueOf(request.getParameter("pagenum"));
    	PageBean<Role> page = rolepermBusiness.getAllRolepage(pagenum);
    	List<Role> role = page.getList();
    	//每个人角色的权限
		List<Permission> permlist = new ArrayList<Permission>();
		StringBuffer perms = new StringBuffer();
     	List<String> ridlist = new ArrayList<String>();
     	for(int i=0;i<role.size();i++){
     		if(i==0){
     			ridlist.add(0, role.get(i).getRid().toString());
     		}else{
     			ridlist.set(0, role.get(i).getRid().toString());
     		}
     		permlist = userBusiness.getallPermsByrid(ridlist); 
     		for(int j=0;j<permlist.size();j++){
     			perms.append(permlist.get(j).getDescription());
 				if(j<permlist.size()-1){
 					perms.append(",");
 				}
     		}
     		role.get(i).setPermlist(perms.toString());
     		perms.setLength(0);
     	}
    	JSONArray jsonArray = JSONArray.fromObject(role);
        return jsonArray.toString();
    }
    
    
	/**  
     * 显示所有权限信息(用分页查看10条客户信息)
     * @param  HttpServletRequest request
     * @param  无
     * @return String
     */    
    @RequestMapping("/perminfopage.do")
    public @ResponseBody String perminfopage(HttpServletRequest request) {
    	int pagenum = Integer.valueOf(request.getParameter("pagenum"));
    	PageBean<Permission> page = rolepermBusiness.getAllPermpage(pagenum);
    	JSONArray jsonArray = JSONArray.fromObject(page); 
        return jsonArray.toString();
    }
    
    /**
 	 * 跳转到角色信息修改页面
 	 * @param  HttpSession session
     * @param  HttpServletRequest request
     * @return String
 	 */
     @RequestMapping("/editrole_info.do")
     public String editrole_info(HttpSession session,HttpServletRequest request) {	
     	String rid = request.getParameter("rid");
     	Role role = rolepermBusiness.getRoleInfoByrid(Integer.parseInt(rid));
     	session.setAttribute("role", role);
     	List<Permission> perms = userBusiness.getAllPerms();
     	session.setAttribute("perms", perms);
     	List<String> ridlist = new ArrayList<String>();
     	ridlist.add(0, rid);;
    	List<Permission> permlist = userBusiness.getallPermsByrid(ridlist); 
    	session.setAttribute("permlist", permlist);
         return "/admin/role_updateinfo";
     }
	   
     
     /**
 	 * 修改角色-更新数据库
 	 * @param  @ModelAttribute("user") User user
      * @param  HttpSession session
      * @return String
 	 */
     @RequestMapping("/updateroleInfo.do")
     public String updateroleInfo(@ModelAttribute("role") Role role,@ModelAttribute("roleperm") RolePerm roleperm) {
    	 	try {
    	 		rolepermBusiness.updateRole(role);
         		rolepermBusiness.deleteRolePerm(role.getRid());
         		rolepermBusiness.insertRolePerm(roleperm);
             	return "/public/access";
			} catch (Exception e) {
				// TODO: handle exception
				return "/public/fail";
			}
     }
     
     /**
  	 * 跳转到权限信息修改页面
  	 * @param  HttpSession session
      * @param  HttpServletRequest request
      * @return String
  	 */
      @RequestMapping("/editperm_info.do")
      public String editperm_info(HttpSession session,HttpServletRequest request) {
       	String pid = request.getParameter("pid");
      	Permission perm = rolepermBusiness.getPermInfoBypid(Integer.parseInt(pid));
      	session.setAttribute("perm", perm);
          return "/admin/perm_updateinfo";
      }
 	   
      
      /**
  	 * 修改权限-更新数据库
  	 * @param  @ModelAttribute("user") User user
       * @param  HttpSession session
       * @return String
  	 */
      @RequestMapping("/updatepermInfo.do")
      public String updatepermInfo(@ModelAttribute("perm") Permission perm) {
     	 	try {
     	 		rolepermBusiness.updatePerm(perm);
              	return "/public/access";
 			} catch (Exception e) {
 				// TODO: handle exception
 				return "/public/fail";
 			}
      }
     
	    /**
		 * 根据员描述搜索角色、权限
		 * @param  无
	     * @param  HttpServletRequest request
	     * @return String
		 */
	    @RequestMapping("/getByname.do")
	    public @ResponseBody String getByname(HttpServletRequest request) {
	    	//实例化
	    	JSONArray jsonArray = new JSONArray();
	    	List<Role> list = new ArrayList<Role>();
	    	PageBean<Role> page = new PageBean<Role>(list);
	    	List<Permission> permlist_1 = new ArrayList<Permission>();
	    	PageBean<Permission> permpage = new PageBean<Permission>(permlist_1);
	    	
	    	String desc = request.getParameter("serchName");
	    	int searchetype = Integer.parseInt(request.getParameter("searchetype"));
	    	//角色搜索
	    	if(searchetype==1){
	    		page = rolepermBusiness.getRoleByrdesc(desc); 
	        	List<Role> role = page.getList();
	    		//每个人角色的权限
	    		List<Permission> permlist = new ArrayList<Permission>();
	    		StringBuffer perms = new StringBuffer();
	         	List<String> ridlist = new ArrayList<String>();
	         	for(int i=0;i<role.size();i++){
	         		if(i==0){
	         			ridlist.add(0, role.get(i).getRid().toString());
	         		}else{
	         			ridlist.set(0, role.get(i).getRid().toString());
	         		}
	         		permlist = userBusiness.getallPermsByrid(ridlist); 
	         		for(int j=0;j<permlist.size();j++){
	         			perms.append(permlist.get(j).getDescription());
	     				if(j<permlist.size()-1){
	     					perms.append(",");
	     				}
	         		}
	         		role.get(i).setPermlist(perms.toString());
	         		perms.setLength(0);
	         	}
		    	page.setList(role);
		    	jsonArray = JSONArray.fromObject(page); 
		    //权限搜索
	    	}else if(searchetype==0){
	    		permpage = rolepermBusiness.getPermBydesc(desc); 
		    	jsonArray = JSONArray.fromObject(permpage); 
	    	}
	    	System.out.println(jsonArray.toString());
	        return jsonArray.toString();
	    }
	    
}

