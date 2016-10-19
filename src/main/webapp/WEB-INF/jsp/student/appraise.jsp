<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-学员考核</title>
    <link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
	<script type="text/javascript" src="<%=basePath%>js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>

  </head>
  
  <body>
    <jsp:include page="../public/navheader.jsp"></jsp:include>
   	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath%>customer/manager.do">客户管理</a></li> --%>
					<li><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li class="active"><a href="<%=basePath%>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li>
				</ul>
				<ul class="nav nav-sidebar">
				<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li>
					<li><a href="<%=basePath%>empinfo/showMe.do">个人中心</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">${fn:substringBefore(etcname,"#") }学生考核信息录入</h1>
				<input type="hidden" name="etcid" value="${fn:substringAfter(etcname,'#') }">
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="col-sm-2 col-sm-offset-8 text-right">
							<div class='input-group date datetimepicker'> 
				                <input type='text' placeholder="考核时间" name="appraisedate" class="form-control input-sm"/>  
				                <span class="input-group-addon input-sm">  
				                    <span class="glyphicon glyphicon-calendar"></span>  
				                </span>  
				            </div>
						</div>
						<div class="col-sm-2 text-right">
							阶段：
							<select>
								<option value="第一阶段">第一阶段</option>
								<option value="第二阶段">第二阶段</option>
								<option value="第三阶段">第三阶段</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<table class="table table-striped table-hover table-responsive table-bordered">
						<thead>
							<tr>
								<th>学号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>学习方向</th>
								<th>成绩</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stukaohe }" var="stu">
								<tr>
								<td>${stu.sid }</td>
								<td>${stu.crname }</td>
								<td>${stu.crmajor }</td>
								<td>${stu.hobby }</td>
								<td>
									<input value="合格" name="${stu.sid }" type="radio" checked="checked"> 合格
									<input value="不合格" name="${stu.sid }" type="radio"> 不合格
								</td>
							</tr>
							</c:forEach> 
						</tbody>
					</table>
					<p align="center">  
						<button type="submit" class="btn btn-default" onclick="checkinAppraise()">确定 </button> 
					</p> 
				</div>
				
			</div>
		</div>
	</div>
	<%@ include file="../public/footer.jsp" %>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>myjs/appraise.js"></script>
  </body>
</html>
							