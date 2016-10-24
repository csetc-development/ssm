package com.icss.util;

import java.util.Set;

import javax.annotation.Resource;

import com.icss.bean.User;  
import com.icss.dao.UserMapper;

import org.apache.shiro.authc.AuthenticationException;  
import org.apache.shiro.authc.AuthenticationInfo;  
import org.apache.shiro.authc.AuthenticationToken;  
import org.apache.shiro.authc.SimpleAuthenticationInfo;  
import org.apache.shiro.authz.AuthorizationInfo;  
import org.apache.shiro.authz.SimpleAuthorizationInfo;  
import org.apache.shiro.realm.AuthorizingRealm;  
import org.apache.shiro.subject.PrincipalCollection;  

public class MyRealm  extends AuthorizingRealm {
	
		@Resource
	    private UserMapper userMapper;	
		
	 // 为当前登陆成功的用户授予权限和角色，已经登陆成功了
		@Override
		protected AuthorizationInfo doGetAuthorizationInfo(
				PrincipalCollection principals) {
			String username = (String) principals.getPrimaryPrincipal(); //获取用户名
			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
			authorizationInfo.setRoles((Set<String>) userMapper.getRoles(username));//没有重复角色
			authorizationInfo.setStringPermissions((Set<String>) userMapper.getPermissions(username));//没有重复权限
			return authorizationInfo;
		}
	    // 验证当前登录的用户，获取认证信息
	    @Override
	    protected AuthenticationInfo doGetAuthenticationInfo(
	        AuthenticationToken token) throws AuthenticationException {
	        String username = (String) token.getPrincipal(); // 获取用户名
	        User user = userMapper.selectByPrimaryKey(username);
	        if(user != null) {
	        	//密码加密
	        	String password = user.getPassword();
	            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUsername(),password, "myRealm");
	            System.out.println(authcInfo);
	            return authcInfo;
	        } else {
	        	System.out.println("没有认证信息（没有用户名）");
	            return null;
	        }       
	    }
	  
}
