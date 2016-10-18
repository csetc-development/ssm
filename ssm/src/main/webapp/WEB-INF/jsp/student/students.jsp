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
    
    <title>ETC-学员管理</title>
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
	<link href="<%=basePath%>css/jquery-ui.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
	<link href="<%=basePath%>css/page.css" rel="stylesheet">
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="<%=basePath%>js/ie-emulation-modes-warning.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/page.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/students.js"></script>

  </head>
  
  <body>
    <jsp:include page="../public/navheader.jsp"></jsp:include>
    <input type="hidden" value="${stupages }" id="stupages">
    <input type="hidden" value="${deletemsg }" id="deletemsg">
        <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> --%>
					<li><a href="<%=basePath %>etcclass/management.do">班级管理</a></li>
					<li class="active"><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li>
					<%-- <li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li> --%>
					
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
					<li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
					<!-- <li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li> -->
					<!-- <li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">学员管理</h1>
				<div class="text-right">
					 <form class="navbar-form navbar-right" role="search">
				        <div class="form-group">
				          <input class="form-control input-sm" placeholder="请输入学员姓名" type="text" id="stuName" name="">
				        </div>
				        <a class="btn btn-default btn-sm" onclick="stuByName()">搜索</a>
				      </form>
				</div>
				<ul class="nav nav-pills">
					<li class="active"><a href="#allstudent" data-toggle="tab">全部学员</a></li>
					<li><a href="#checkstudent" data-toggle="tab">学员考核</a></li>
					<li><a href="#graduatestudent" data-toggle="tab">待结业学员</a></li>
					<li><a href="#workedstudent" data-toggle="tab">已结业学员</a></li>
					<li><a href="#outofschool" data-toggle="tab">已退学学员</a></li>
					<li><a href="#selectstudent" data-toggle="tab">查询结果</a></li>
				</ul>
				<div class="container" style="height:20px;"></div>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="allstudent">
						<div class="btn-group">
							<a id="btn_add" type="button" class="btn btn-sm btn-primary" href="student/addstudents2.do">
								<span class="glyphicon glyphicon-plus" aria-hidden="true">新增</span>
							</a>
							<button id="btn_edit" type="button" class="btn btn-sm btn-success" onclick="updatestuinfo()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span>
							</button>
							<button id="btn_delete" type="button" class="btn btn-sm btn-warning" onclick="delectstudentsinfo()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true">退学</span>
							</button>
						</div>
						<span id="errortext">删除学员失败，确定要删除就先<a href="student/deletestayinfo.do?str=${deletemsg }">删除住宿信息</a></span>
						<table class="table table-striped table-hover table-responsive table-bordered ">
							<thead>
								<tr>
								  <th><input type="checkbox" id="allstu"></th>
								  <th>姓名</th>
								  <th>性别</th>
								  <th>出生年月</th>
								  <th>班级名称</th>
								  <th>学号</th>
								  <th>助教</th>
								  <th>学习方向</th>
								  <th>手机</th>
								  <th>qq</th>
								  <th>邮箱</th>
								  <th>状态</th>
								</tr>
							  </thead>
							  <tbody>
							  	<c:if test="${empty stusinfo }">
							  		暂时没有相关数据
							  	</c:if>
							  	<c:forEach items="${stusinfo }" var="student">
							  		<tr>
							  			<td><input type="checkbox" name="allstu_checkbox" value="${student.sid }"></td>
							  			<td>${student.crname }</td>
							  			<td>${student.crmajor }</td>
							  			<td>${student.cdbrithday }</td>
							  			<td>${student.crgrade }</td>
							  			<td>${student.sid }</td>
							  			<td>${student.sremark }</td>
							  			<td>${student.hobby }</td>
							  			<td>${student.crtel }</td>
							  			<td>${student.sqq }</td>
							  			<td>${student.semail }</td>
							  			<td>${student.status }</td>
							  		</tr>
							  	</c:forEach>
							  </tbody>
						</table>
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="checkstudent">
						<div class="col-sm-9">
						<table class="table table-striped table-hover table-responsive table-bordered ">
							<thead>
								<tr>
									<th>班级</th>
									<th>学号</th>
									<th>姓名</th>
									<th>第一阶段</th>
									<th>第二阶段</th>
									<th>第三阶段</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>java-20160301-jy</td>
									<td>2016030101</td>
									<td>谭超军</td>
									<td>合格</td>
									<td>合格</td>
									<td>未进行</td>
									<td><a>提前结业</a>&nbsp;<a>换班重修</a></td>
								</tr>
								<tr>
									<td>java-20160301-jy</td>
									<td>2016030101</td>
									<td>高楚戈</td>
									<td>合格</td>
									<td>合格</td>
									<td>未进行</td>
									<td>
										[<a data-toggle="modal" data-target="#completion">提前结业</a>]&nbsp;
										[<a data-toggle="modal" data-target="#updateclassforstu" >换班重修</a>]
									</td>
								</tr>
								<tr>
									<td>Java-20160105-jy</td>
									<td>2016010501</td>
									<td>葛丽</td>
									<td>合格</td>
									<td>合格</td>
									<td>合格</td>
									<td><a>提前结业</a>&nbsp;<a>换班重修</a></td>
								</tr>
							</tbody>
						</table>
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
						</div>
					</div>
					<div class="tab-pane fade" id="graduatestudent">
						<div class="col-sm-8">
							<table class="table table-striped table-hover table-responsive table-bordered ">
							<thead>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>学历</th>
									<th>意向就业城市</th>
									<th>期望薪资</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2016010501</td>
									<td>葛丽</td>
									<td>女</td>
									<td>22</td>
									<td>本科</td>
									<td>深圳</td>
									<td>6000</td>
									<td><a data-toggle="modal" data-target="#completion">结业</a></td>
								</tr>
							</tbody>
							</table>
							<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
						</div>
					</div>
					<div class="tab-pane fade" id="workedstudent">
						<div class="col-sm-12">
							<table class="table table-striped table-hover table-responsive table-bordered ">
							<thead>
								<tr>
									<th>学号</th>
									<th>班级</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>电话</th>
									<th>公司名称</th>
									<th>公司地址</th>
									<th>薪水</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2015110301</td>
									<td>Java-20151103-jy</td>
									<td>魏小军</td>
									<td>男</td>
									<td>22</td>
									<td>13512635416</td>
									<td>深圳有成软件开发公司</td>
									<td>深圳</td>
									<td>6000</td>
									
								</tr>
							</tbody>
							</table>
							<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
						</div>
					</div>
					<div class="tab-pane fade" id="outofschool">暂时没有相关数据</div>
					<div class="tab-pane fade" id="selectstudent">
						<table class="table table-striped table-hover table-responsive table-bordered" id="selectstudenttable"><tr><td>没有相关数据</td></tr></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="updateclassforstu" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">换班重修</h3> 
                   </div>  
                   <div class="modal-body">  
                   	<div class="row">
                   		<form class="form-horizontal" role="form" action="" method="post">
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">更换的班级名称</label>
								<div class="col-sm-3" >
									<select>
										<option value="1">java-20160301-jy</option>
										<option value="2">java-20160105-jy</option>
									</select>
								</div>
							</div>
							<p align="center">  
								<button type="button" class="btn btn-default">确定 </button> 
							</p>
						</form>
                   	</div>
                   </div>  
               </div>  
           </div>  
       </div>
	<div class="modal fade" id="completion" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">学员结业</h3> 
                   </div>  
                   <div class="modal-body">  
                   		<form class="form-horizontal" role="form" action="" method="post">
							<div class="form-group">
									<label class="col-sm-3 control-label">班级</label>
									<div class="col-sm-3">
									</div>
							</div>
							<div class="form-group">
									<label class="col-sm-3 control-label">学号</label>
									<div class="col-sm-3">
									</div>
							</div>
							<div class="form-group">
									<label class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-3">
									</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">公司名称</label>
								<div class="col-sm-3">
									<input type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">城市</label>
								<div class="col-sm-3">
									<input type="text" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">薪水</label>
								<div class="col-sm-3">
									<input type="text" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">结业时间</label>
								<div class="col-sm-3">
									<input type="text" value="">
								</div>
							</div>
							<p align="center">  
								<button type="button" class="btn btn-default">确定 </button> 
							</p>
						</form>
                   </div>  
               </div>  
           </div>  
       </div>
    <%@ include file="../public/footer.jsp" %>
  </body>
</html>
					        		