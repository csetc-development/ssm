<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-学员住宿</title>
    
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
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>myjs/accommodation.js"></script>

  </head>
  	<jsp:include page="../public/navheader.jsp"></jsp:include>
    <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<li><a href="<%=basePath %>customer/manager.do">客户管理</a></li>
					<li><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li class="active"><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li>
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
					<li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li>
					<li><a href="">中文</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">学员入住安排</h1>
				<div class="container-fluid">
					<div class="row-fluid">
						<form action="student/addstay.do" method="post" class="form-horizontal">
							<input type="hidden" name="sid" value="${stuaccopay.cremark}">
							<input type="hidden" name="eid" value="${loginemp.eid}">
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">学号：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">${stuaccopay.cremark}</div>
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">姓名：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">${stuaccopay.crname }</div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">年龄：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							    ${stuaccopay.aid}
							    	<c:if test="${empty stuaccopay.aid }">
							    		<input type="text" placeholder="只能输入数字" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
							    	</c:if>
							    </div>
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">性别：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">${stuaccopay.crsex }</div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">身份证号码：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">${stuaccopay.ecardid }</div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">已交住宿费：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">${stuaccopay.creceivables}</div>
							    <label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">安排日期：</label>
								<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
									<div class='input-group date datetimepicker'>  
						                <input type='text' placeholder="不填默认为当前系统日期" name="stdate" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
								</div>
								  
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">住宿地址：</label>
							    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							    	<select id="accoadd">
							    		<option value="0">---请选择---</option>
							    		<c:forEach items="${accoadd }" var="roomadd">
							    			<option value="${roomadd.spid }">${roomadd.spname }</option>
							    		</c:forEach>
							    	</select>
							    	<select name="spid" id="roomid" required>
							    	</select>
							    </div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">住宿时间：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							    	<div class='input-group date datetimepicker'>  
						                <input type='text' name="checkintime" required class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
							    </div>
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">到</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							    	<div class='input-group date datetimepicker'>  
						                <input type='text' name="checkouttime" required class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">押金：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							    	<input type="text" name="stcash">
							    </div>
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">减免金额：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
									<input type="text" name="stdeduction" > 
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right">备注：</label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							    	<textarea rows="3" cols="" name="stremark"></textarea>
							    </div>
								<label class="col-xs-12 col-sm-6 col-md-2 col-lg-2 text-right"></label>
							    <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
								</div>
							</div>
							<p align="center">  
	                           <button type="submit" class="btn btn-default" data-dismiss="modal">确定 </button>  
	                       </p> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
  <body>
  </body>
</html>
