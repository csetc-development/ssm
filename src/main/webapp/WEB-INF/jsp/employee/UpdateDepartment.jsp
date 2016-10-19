<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改部门信息</title>
<link href="<%=basePath %>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath %>css/add_stu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.autotextarea.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.tab.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
		$("#back").hide();
		$("#add_stu").hide();
		
	})
</script>
<body>
<div id="dcMain">
   	<!-- 当前位置 -->
		<div id="urHere">长沙ETC客户关系管理中心<b>></b><strong>业务管理</strong></div>   
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
	    	<h3>修改部门信息</h3>
		    
	<div style="text-align: right; cursor: default; height: 40px;"></div>
		<form action="../dept/update.do" method="post">
			<input type="hidden" name="did" value="${Department.did}" />
 			<table width="60%" border="0" cellpadding="8" cellspacing="0" class="tableBasic" align="center">
 				
 				<tr>
 					<td>部门名称:</td>
 					<td><input type="text" name="dName" value="${Department.dName}" /></td>
 				</tr>
 				<tr>
 					<td>部门地址:</td>
 					<td><input type="text" name="dAddress" value="${Department.dAddress}" /></td>
 				</tr>
 				<tr>
 					<td>部门描述:</td>
 					<td><input type="text" name="dRemark"  value="${Department.dRemark}"/></td>
 				</tr>
 				<tr>
 					<td colspan="2" align="center">
						<input type="submit" class="btn" value="确定">
					</td>
 				</tr>
 			</table>
 		</form>		
	</div>	
</div>
</body>
</html>