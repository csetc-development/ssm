<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
	<script type="text/javascript" src="<%=basePath%>myjs/navleft.js"></script>
 </head>
 <body>
 <div class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar">
			<li id="emp"><a href="<%=basePath%>emp/adminindex.do">首页<span class="sr-only">(current)</span></a></li>
			<li id="signed1"><a href="<%=basePath%>signed/signedinfo.do">签单客户</a></li>
			<li id="signed2"><a href="<%=basePath%>signed/firstincomepay.do">收入支出</a></li>
			<%-- <li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
			<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
			<li><a href="<%=basePath%>empinfo/empmanagement.do">员工管理</a></li>
			<li><a href="<%=basePath%>paycode/Codes.do">业务管理</a></li>
			<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li> --%>
		</ul>
		 <ul class="nav nav-sidebar">
			<%--<li><a href="<%=basePath%>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> --%>
			<li id="user" onclick="return user()"><a href="<%=basePath%>user/haveuserinfo.do">用户管理</a></li>
		</ul>
		<div id="tree"></div>
	</div>
	</body>
 </html>
		