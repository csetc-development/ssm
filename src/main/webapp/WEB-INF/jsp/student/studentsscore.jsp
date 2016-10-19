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
    
    <title>ETC-学员成绩</title>
<!--     <link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css"> -->
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
				<h1 class="page-header">学生成绩信息</h1>
				<div class="container-fluid">
					<div class="row-fluid">
						
					</div>
				</div>
				<div class="col-sm-8">
					<table class="table table-striped table-hover table-responsive table-bordered" id="stuscoretable">
						<thead>
							<tr>
								<th>班级编号</th>
								<th>班级名称</th>
								<th>阶段</th>
								<th>学号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>学习方向</th>
								<th>成绩</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stuscore }" var="stu">
								<tr>
									<td>${stu.etcid }</td>
									<td>${stu.crgrade }</td>
									<td>${stu.status }</td>
									<td>${stu.sid }</td>
									<td>${stu.crname }</td>
									<td>${stu.cdmariage }</td>
									<td>${stu.hobby }</td>
									<td><a data-toggle="modal" data-target="#updatescore">${stu.sagent }</a></td>
								</tr>
							</c:forEach> 
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
	<div class="modal fade" id="updatescore" role="dialog">  
          <div class="modal-dialog">  
              <div class="modal-content">  
                  <div class="modal-header">  
                      <button type="button" class="close" data-dismiss="modal">  
                          <span>×</span>  
                      </button>  
                      <h3 class="modal-title">更改成绩</h3> 
                  </div>  
                  <div class="modal-body">  
                  		<form class="form-horizontal" role="form" action="student/updatestuscore.do" method="post">
                  			
                  			<div class="form-group">
								<label class="col-sm-3 control-label">学号：</label>
								<input type="text" name="sid" onfocus="this.blur()" style="border: none;">
							</div>
                  			<div class="form-group">
								<label class="col-sm-3 control-label">姓名：</label>
								<input type="text" onfocus=this.blur() style="border: none;">
							</div>
                  			<div class="form-group">
								<label class="col-sm-3 control-label">阶段：</label>
								<input type="text" name="stage" onfocus=this.blur() style="border: none;">
							</div>
                  			<div class="form-group">
								<label class="col-sm-3 control-label">成绩：</label>
								<div class="col-sm-3">
									<select name="score">
										<option value="合格">合格</option>
										<option value="不合格">不合格</option>
									</select>
								</div>
							</div>
                  			<p align="center">  
								<button type="submit" class="btn btn-default">确定 </button>
								<input type="hidden" name="etcid"> 
							</p>
							
                  		</form>
                  </div>  
              </div>  
          </div>  
      </div>
	<%@ include file="../public/footer.jsp" %>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>myjs/appraise.js"></script>
	<script src="<%=basePath%>myjs/studentsscore.js"></script>
  </body>
</html>
							