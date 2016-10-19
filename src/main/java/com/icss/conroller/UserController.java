/**
 * @date 2016/10/17
 * @author 王梓
 */
package com.icss.conroller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.bean.Permission;
import com.icss.bean.Role;
import com.icss.bean.User;
import com.icss.bean.UserRole;
import com.icss.bean.ViewUserEmpallinfo;
import com.icss.business.UserBusiness;
import com.icss.util.PageBean;



@Controller
@RequestMapping("user")
public class UserController {	
	
	@Resource(name="userBusiness")
	private UserBusiness userBusiness = null;

	public void setUserBusiness(
			UserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}


	 /** 
	  * 用户登录操作
	  * @param  String username
      * @param  String password
      * @param  ModelMap model
      * @param  HttpSession session
      * @return String
	  */  
	 @RequestMapping(value = "login.do")  
	 public String login(String username, String password,ModelMap model,HttpSession session) {  
	    Subject subject = SecurityUtils.getSubject();
	    //如果已经登录则直接返还到首页
	    if(subject.isAuthenticated()){
	        return "redirect:/emp/adminindex.do";
	    }else{
	    	//加密前密码
	    	System.out.println("password（未加密）:"+password);
	    	password = UserBusiness.md5(password);
	    	//加密后密码
	    	System.out.println("password（加密）:"+password);
	        UsernamePasswordToken token = new UsernamePasswordToken(username, password);  
	        String error = null;
	      try {  
	          subject.login(token);  
	          session.setAttribute("logged", 1);
		      //登录时设置eid到session中
	    	  User tempuser = userBusiness.getByUsername((String) subject.getPrincipal());
	    	  tempuser.setPassword("");
	    	  session.setAttribute("tempuser", tempuser);
	    	  System.out.println(tempuser);
	         // subject.logout();
	      } catch (UnknownAccountException e) {  
	          error = "用户名不存在";  
	      } catch (IncorrectCredentialsException e) {  
	          error = "密码不正确";  
	      } catch (AuthenticationException e) {  
	          //其他错误，比如锁定，如果想单独处理请单独catch处理  
	          error = "其他错误：" + e.getMessage();  
	      } 
	      //返还错误信息到客户端
	      model.addAttribute("msg", error);
	      System.out.println("用户认证状态："+subject.isAuthenticated());
	       	      
	      if(subject.isAuthenticated()){
	        return "redirect:/emp/adminindex.do"; 
	      }else{
	        return "redirect:/login.jsp"; 
	      }      
	      
	    }
	 }

	 
    /**
	 * 用户登出操作
	 * @param  HttpServletRequest request
     * @param  无
     * @return String
	 */	 
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request) {
    	Subject subject = SecurityUtils.getSubject();
    	if (subject.isAuthenticated()) {
    		 subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
     		System.out.println("用户登出操作");
    		 return "redirect:/login.jsp";
    	}else{
    		System.out.println("用户尚未登录，不能做登出操作");
            return "redirect:/login.jsp";	
    	}
    }   

    
    /**
	 * 跳转到修改页面
	 * @param  HttpSession session
     * @param  无
     * @return String
	 */
    @RequestMapping("/edit_pwd.do")
    public String edit_pwd(HttpSession session) {	
        return "/public/edit_pwd";
    }
    
    
	/**
	 * 修改密码钱，检测老密码比对是否输入正确
	 * @param  HttpServletRequest request
     * @param  无
     * @return String
	 */
    @RequestMapping(value = "/editPwd.do", produces = "text/plain;charset=UTF-8" )
    public @ResponseBody String editPwd(HttpServletRequest request) {
		int eid = Integer.valueOf(request.getParameter("eid"));
		String pwd = request.getParameter("oldPwd");
		return userBusiness.getPwd( eid , pwd );
    }

	/**
	 * 修改密码--更新数据库
	 * @param  @ModelAttribute("user") User user
     * @param  HttpSession session
     * @return String
	 */
    @RequestMapping("/updatePwd.do")
    public String updatePwd(@ModelAttribute("user") User user,HttpSession session) {
		if(userBusiness.updatePwd(user)==1){
			System.out.println("修改密码成功");
			session.setAttribute("updatetemp", "修改密码成功");
			return "redirect:/user/logout.do";
		}else{
			System.out.println("修改密码失败");
			session.setAttribute("updatetemp", "修改密码失败");
			return "redirect:/user/edit_pwd.do";
		}
    }
    
	/**  
     * 只显示有用户的员工信息(显示第一页)
     * @param  HttpSession session
     * @param  无
     * @return String
     */    
    @RequestMapping("/haveuserinfo.do")
    public String haveuserinfo(HttpSession session) {
		//调用自写函数，根据传进去的页面、是否显示所有员工，来进行数据处理返回
    	PageBean<ViewUserEmpallinfo> page = getUserEmpinfo(1,true);
    	List<ViewUserEmpallinfo> viewUserEmpallinfo = page.getList();
		session.setAttribute("viewUserEmpallinfo", viewUserEmpallinfo);
		session.setAttribute("pages", page.getPages());	
		//没有用户的员工页数放入session
		PageBean<ViewUserEmpallinfo> page2 = getUserEmpinfo(1,false);
		session.setAttribute("nullpages",page2.getPages());
        return "admin/users";
    }
    
	/**  
     * 只显示有用户的员工信息(用分页查看10条客户信息)
     * @param  HttpServletRequest request
     * @param  无
     * @return String
     */    
    @RequestMapping("/haveuserinfopage.do")
    public @ResponseBody String haveuserinfopage(HttpServletRequest request) {
    	int pagenum = Integer.valueOf(request.getParameter("pagenum"));
		//调用自写函数，根据传进去的页面、是否显示所有员工，来进行数据处理返回
    	PageBean<ViewUserEmpallinfo> page = getUserEmpinfo(pagenum,true);
    	List<ViewUserEmpallinfo> viewUserEmpallinfo = page.getList();
    	JSONArray jsonArray = JSONArray.fromObject(viewUserEmpallinfo);
        return jsonArray.toString();
    }
    
    
	/**  
     * 只显示没有用户的员工信息(用分页查看10条客户信息)
     * @param  HttpServletRequest request
     * @param  无
     * @return String
     */    
    @RequestMapping("/nulluserinfopage.do")
    public @ResponseBody String nulluserinfopage(HttpServletRequest request) {
    	int pagenum = Integer.valueOf(request.getParameter("pagenum"));
		//调用自写函数，根据传进去的页面、是否显示所有员工，来进行数据处理返回
    	PageBean<ViewUserEmpallinfo> page = getUserEmpinfo(pagenum, false);
    	JSONArray jsonArray = JSONArray.fromObject(page); 
        return jsonArray.toString();
    }
    
    
	/**  
     * 显示用户的员工信息函数
     * @param  int pagenum
     * @param  boolean haveUser(为真---显示没有用户的员工;为假---显示有用户的员工)
     * @return PageBean<ViewUserEmpallinfo>
     */  
    public PageBean<ViewUserEmpallinfo> getUserEmpinfo(int pagenum,boolean haveUser){
    	int i = 1;
    	int j = 1;
    	StringBuffer strbuff_perms = new StringBuffer();
    	StringBuffer strbuff_roles = new StringBuffer();
    	List<ViewUserEmpallinfo> list = new ArrayList<ViewUserEmpallinfo>();
    	PageBean<ViewUserEmpallinfo> page = new PageBean<ViewUserEmpallinfo>(list);
    	//从后台取出PageBean类型数据，再做数据处理
    	if(!haveUser){
    		page = userBusiness.nulluserinfo(pagenum);
    	}else{
    		//如果是有用户的员工，需要把权限List放入PageBean中，需要以下操作
    		page = userBusiness.haveuserinfo(pagenum);
	    	//进行显示由用户的员工信息操作，对得到的所有用户员工视图进行遍历，从而得到每一个的username
	    	for(ViewUserEmpallinfo useremp:page.getList()){
	    		//进行用户的到权限内容的操作，对的到的权限逐个取出其描述内容放入StringBuffer
	    		for(Permission perms:userBusiness.getPermissions(useremp.getUsername())){			
	    			//i用于控制权限第一个不加逗号
	    			if(i==1){
	    				strbuff_perms.append(perms.getDescription());
	    			}else{
	    				strbuff_perms.append(",");
	    				strbuff_perms.append(perms.getDescription());
	    			}
	    			i++;
	    		}
	    		//进行用户的到角色内容的操作，对的到的权限逐个取出其描述内容放入StringBuffer
	    		for(Role role:userBusiness.getRoles(useremp.getUsername())){			
	    			//i用于控制权限第一个不加逗号
	    			if(j==1){
	    				strbuff_roles.append(role.getDescription());
	    			}else{
	    				strbuff_roles.append(",");
	    				strbuff_roles.append(role.getDescription());
	    			}
	    			j++;
	    		}
	    		//将以上得到的StringBuffer内容(即为每个用户的所有的权限)放入每个用户员工视图中
	    		useremp.setPdescription(strbuff_perms.toString());
	    		useremp.setRdescription(strbuff_roles.toString());
	    		list.add(useremp);
	    		strbuff_perms.setLength(0);  
	    		strbuff_roles.setLength(0); 
	    		i = 1;
	    		j = 1;
	    	}
	    	page.setList(list);
    	}
    	return page;
    }
  
    /**
	 * 得到一个所选择角色的权限内容到用户信息修改页面-----------------（这个是单用户多权限版本，暂时用不上）
	 * @param  无
     * @param  HttpServletRequest request
     * @return String
	 */
    /*@RequestMapping("/getPermsByrid.do")
    public @ResponseBody String getPermsByrid(HttpServletRequest request) {	
    	int rid = Integer.parseInt(request.getParameter("rid"));
    	List<Permission> permlist = userBusiness.getPermsByrid(rid); 
    	JSONArray jsonArray = JSONArray.fromObject(permlist); 
    	System.out.println(jsonArray.toString());
        return jsonArray.toString();
    }
    */
    
    /**
	 * 得到所选择角色的权限内容到用户信息修改页面----------------（这个是多用户多权限版本）
	 * @param  无
     * @param  HttpServletRequest request
     * @return String
	 */
    @RequestMapping("/getallPermsByrid.do")
    public @ResponseBody String getallPermsByrid(HttpServletRequest request) {
    	//----员工rid
    	String ridstring = request.getParameter("ridlist");
    	//把传过来的string类型根据逗号分割放入list 
    	List<String> ridlist=Arrays.asList(ridstring.split(","));
    	List<Permission> permlist = userBusiness.getallPermsByrid(ridlist); 
    	JSONArray jsonArray = JSONArray.fromObject(permlist); 
        return jsonArray.toString();
    }
    
    
    /**
	 * 跳转到用户信息修改页面
	 * @param  HttpSession session
     * @param  HttpServletRequest request
     * @return String
	 */
    @RequestMapping("/edit_info.do")
    public String edit_info(HttpSession session,HttpServletRequest request) {	
    	int eid = Integer.parseInt(request.getParameter("eid"));
    	ViewUserEmpallinfo viewuser = userBusiness.getInfoByEid(eid);
    	session.setAttribute("viewuser", viewuser);
    	List<Role> roles = userBusiness.getAllRole();
    	session.setAttribute("userroles", roles);
        return "/admin/user_updateinfo";
    }
    
    
	/**
	 * 修改用户-更新数据库
	 * @param  @ModelAttribute("user") User user
     * @param  HttpSession session
     * @return String
	 */
    @RequestMapping("/updateInfo.do")
    public String updateInfo(@ModelAttribute("user") User user,@ModelAttribute("userrole") UserRole userrole) {
    	try {
    		userBusiness.deleteUserRole(user.getEid());
        	userBusiness.insertUserRole(userrole);
        	return "/public/access";
		} catch (Exception e) {
			// TODO: handle exception
			return "/public/fail";
		}
    }
    
    /**
	 * 跳转到单个或者多个用户信息增加页面
	 * @param  HttpSession session
     * @param  HttpServletRequest request
     * @return String
	 */
    @RequestMapping("/add_info.do")
    public String add_info(HttpSession session,HttpServletRequest request) {	
    	boolean addone = Boolean.parseBoolean(request.getParameter("addone"));
    	//添加一个用户
    	if(addone){
    		int eid = Integer.parseInt(request.getParameter("eid"));
	    	ViewUserEmpallinfo viewuser = userBusiness.getNullInfoByEid(eid);
	    	session.setAttribute("viewuser", viewuser);
	    	//取出所有的角色和权限
	    	List<Role> roles = userBusiness.getAllRole();
	    	session.setAttribute("userroles", roles);
	        return "/admin/user_addoneinfo";
    	//添加多个用户
    	}else{
    		String list = request.getParameter("eidlist");
        	//把传过来的string类型根据逗号分割放入list
        	List<String> eidlist=Arrays.asList(list.split(","));
        	//取出选择了的员工姓名,出生日期
        	List<String> namelist = userBusiness.getNameByEidlist(eidlist).get("namelist");
        	List<String> birthlist = userBusiness.getNameByEidlist(eidlist).get("birthlist");
        	session.setAttribute("eidlist", eidlist);
        	session.setAttribute("namelist", namelist);
        	session.setAttribute("birthlist", birthlist);
        	//取出所有的角色和权限
        	List<Role> roles = userBusiness.getAllRole();
        	session.setAttribute("userroles", roles);
            return "/admin/user_addmoreinfo";
    	}
    }
    
	/**
	 * 添加一个用户-更新数据库
	 * @param  HttpServletRequest request
     * @param  HttpSession session
     * @return String
	 */
    @RequestMapping("/insertInfo.do")
    public String insertInfo(@ModelAttribute("user") User user,@ModelAttribute("userrole") UserRole userrole) {
    	try {
    		userBusiness.insertUser(user);
        	userBusiness.insertUserRole(userrole);
        	return "/public/access";
		} catch (Exception e) {
			// TODO: handle exception
			return "/public/fail";
		}
    }
    
	/**
	 * 添加多个用户-更新数据库
	 * @param  HttpServletRequest request
     * @param  HttpSession session
     * @return String
	 */
    @RequestMapping("/insermoretInfo.do")
    public String insermoretInfo(HttpSession session,HttpServletRequest request) {
    	List<User> userlist = new ArrayList<User>();
    	List<UserRole> userrolelist = new ArrayList<UserRole>();
    	//用户角色表参数设定
    	String ridlist = request.getParameter("ridlist");
    	//----员工id
    	String eidstring_ = request.getParameter("eid");
    	//去除掉传过来的中括号:[]  下同
		String eidstring =eidstring_.substring(1,(eidstring_.length()-1));
    	//把传过来的string类型根据逗号分割放入list  下同
    	List<String> eidlist=Arrays.asList(eidstring.split(","));
    	//----出生日期----目前用户名为员工姓名，用不到日期
		/*String birthstring_ = request.getParameter("ebrithday");
		String birthstring =birthstring_.substring(1,(birthstring_.length()-1));
    	List<String> birthlist=Arrays.asList(birthstring.split(","));*/
		//----员工名
		String namestring_ = request.getParameter("ename");
		String namestring =namestring_.substring(1,(namestring_.length()-1));
		List<String> namelist=Arrays.asList(namestring.split(","));
		//把每条信息以User的形式放入list
		for(int i=0;i<eidlist.size();i++){
			User user = new User();
			UserRole userrole = new UserRole();
			user.setEid(Integer.parseInt(eidlist.get(i).trim()));
			user.setPassword("123456");
			//user.setRid(rid);
			user.setUsername(namelist.get(i).trim());
			userlist.add(user);
			userrole.setEid(Integer.parseInt(eidlist.get(i).trim()));
			userrole.setRidlist(ridlist);
			userrolelist.add(userrole);
		}
		//把每条User新增入数据库
		try {
			for(int m=0;m<userlist.size();m++){
				userBusiness.insertUser(userlist.get(m));
			}
			for(int n=0;n<userlist.size();n++){
				userBusiness.insertUserRole(userrolelist.get(n));
			}
			return "/public/access";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("添加多个用户失败");
			return "/public/fail";
		}
    }
    
    
    /**
   	 * 用户信息删除
   	 * @param  无
     * @param  HttpServletRequest request
     * @return String
   	 */
		@RequestMapping("/deleteUser.do")
		public String deleteUser(HttpServletRequest request) {
		String eidstring_ = request.getParameter("eidstring");
		//eidstring_的内容为：a,b,c,d,  所以要取0到length-1位
		String eidstring =eidstring_.substring(0,(eidstring_.length()-1));
		List<String> eidlist=Arrays.asList(eidstring.split(","));
		try {
			for(int i=0;i<eidlist.size();i++){
				userBusiness.deleteUserRole(Integer.parseInt(eidlist.get(i)));
				userBusiness.deleteUser(Integer.parseInt(eidlist.get(i)));
			}
			return "redirect:/user/haveuserinfo.do";
		} catch (Exception e) {
			// TODO: handle exception
		System.out.println("删除失败！");
		return "redirect:/user/haveuserinfo.do";
		
		}
	}
       
    
	    /**
		 * 根据员工姓名搜索员工信息
		 * @param  无
	     * @param  HttpServletRequest request
	     * @return String
		 */
	    @RequestMapping("/getByname.do")
	    public @ResponseBody String getByname(HttpServletRequest request) {
	    	int i = 1;
	    	StringBuffer strbuff = new StringBuffer();
	    	List<ViewUserEmpallinfo> list = new ArrayList<ViewUserEmpallinfo>();
	    	PageBean<ViewUserEmpallinfo> page = new PageBean<ViewUserEmpallinfo>(list);
	    	String ename = request.getParameter("serchName");
	    	int haveUser = Integer.parseInt(request.getParameter("searchetype"));
	    	if(haveUser==1){
	    		page = userBusiness.getHaveByrname(ename); 
	    		//进行显示由用户的员工信息操作，对得到的所有用户员工视图进行遍历，从而得到每一个的username
		    	for(ViewUserEmpallinfo useremp:page.getList()){
		    		//进行用户的到权限内容的操作，对的到的权限逐个取出其描述内容放入StringBuffer
		    		for(Permission perms:userBusiness.getPermissions(useremp.getUsername())){			
		    			//i用于控制权限第一个不加逗号
		    			if(i==1){
		    				strbuff.append(perms.getDescription());
		    			}else{
		    				strbuff.append(",");
		    				strbuff.append(perms.getDescription());
		    			}
		    			i++;
		    		}
		    		//将以上得到的StringBuffer内容(即为每个用户的所有的权限)放入每个用户员工视图中
		    		useremp.setPdescription(strbuff.toString());
		    		list.add(useremp);
		    		strbuff.setLength(0);    		
		    		i = 1;
		    	}
		    	page.setList(list);
	    	}else if(haveUser==0){
	    		page = userBusiness.getNotHaveByrname(ename); 
	    	}
	    	JSONArray jsonArray = JSONArray.fromObject(page); 
	    	System.out.println(jsonArray.toString());
	        return jsonArray.toString();
	    }
	    
	   
}

