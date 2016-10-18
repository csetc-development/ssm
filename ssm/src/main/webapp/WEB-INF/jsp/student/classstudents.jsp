<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-班级学生</title>
    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="http://v3.bootcss.com/favicon.ico">
	<!-- Bootstrap core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="<%=basePath%>js/ie-emulation-modes-warning.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.js"></script>
    <script src="<%=basePath%>myjs/classstudent.js"></script>

  </head>
  
  <body>
  <jsp:include page="../public/navheader.jsp"></jsp:include>
    <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> --%>
					<li><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li class="active"><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/management.do">宿舍管理</a></li>
					<%-- <li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li>
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li> --%>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
					<!-- <li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> -->
					<!-- <li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li> -->
					<li><a href="">中文</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">班级学员</h1>
				<a href="<%=basePath %>student/addstudents.do?etcid=${etcid}">新增</a>
				<div class="container-fluid">
					<div class="row-fluid">
					<c:forEach items="${stulist }" var="student">
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							<div class="panel panel-default">
							  <div class="panel-heading">${student.crname }</div>
							  <div class="panel-body">
							  		学号：<span>${student.sid }</span><br>
							  		紧急联系人电话：${student.surgenttel }<br>
							  		身份证号码：${student.cdcaidid }<br>
							  		学历：${student.cdeducation }<br>
							  		qq：${student.sqq }<br>
							  		电子邮箱：${student.semail }<br>
							  		<c:if test="${!empty student.schoolprincipal}">
							  		学校负责人：${student.schoolprincipal }<br>
							  		负责人电话：${student.sptel }<br>
							  		</c:if>
							  		
							  </div>
							 <div class="panel-footer text-right"><input type="button" class="btn btn-warning btn-sm" value="修改"> &nbsp;<input type="button" class="btn btn-danger btn-sm" value="删除"></div> 
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
	</div>
     <%@ include file="../public/footer.jsp" %>
  </body>
</html>
