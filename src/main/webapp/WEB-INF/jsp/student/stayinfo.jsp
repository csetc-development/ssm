<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-住宿管理</title>
    
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
  </head>
  
  <body>
  	<jsp:include page="../public/navheader.jsp"></jsp:include>
  	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> --%>
					<li><a href="<%=basePath %>etcclass/management.do">班级管理</a></li>
					<li><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li class="active"><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li>
					
					<%-- <li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li> --%>
					
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
					<li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
					<!-- <li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">住宿管理</h1>
				<div class="container-fluid">
					<div class="row-fluid">
						<div><a data-toggle="modal" data-target="#addstay">新增</a></div>
						 <form class="navbar-form navbar-right" role="search">
					        <div class="form-group">
					          <input class="form-control input-sm" placeholder="请输入宿舍名字" type="text" id="stuName" name="">
					        </div>
					        <a class="btn btn-default btn-sm" onclick="stuByName()">搜索</a>
					      </form>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
							<div class="panel panel-default">
							  <div class="panel-heading"><a href="student/stustay.do">麓谷工业园</a></div>
							  <div class="panel-body">
							  		房间号：<span>601</span><br>
							  		入住人数：<span>15</span><br>
							  </div>
							  <div class="panel-footer text-right">
							  	<a data-toggle="modal" data-target="#updateclass" class="btn btn-warning btn-sm" >修改</a> &nbsp;
							  	<a class="btn btn-danger btn-sm">删除</a> &nbsp;
							  </div> 
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="addstay" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">新增宿舍信息</h3> 
                   </div>  
                   <div class="modal-body">  
                   	<div class="row">
                   		<form class="form-horizontal" role="form" action="etcclass/updateclass.do" method="post">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" 
											   href="#collapseOne">
												新增新的宿舍
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label for="firstname" class="col-sm-3 control-label">地址</label>
												<div class="col-sm-2">
													<input type="text" maxlength="20" name="etcname" id="etcname" value="">
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-3 control-label">房间号</label>
												<div class="col-sm-2">
													<input type="text" id="etcnum" value="" name="etcnum" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" 
											   href="#collapseTwo">
												在现有地址新增房间
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="form-group">
												<label for="firstname" class="col-sm-3 control-label">地址</label>
												<div class="col-sm-4">
													<select>
														<option>麓谷工业园</option>
														<option>观沙岭</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="lastname" class="col-sm-3 control-label">房间号</label>
												<div class="col-sm-2">
													<input type="text" id="etcnum" value="" name="etcnum" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
							<p align="center">  
								<button type="submit" class="btn btn-default">确定 </button> 
							</p>
	                       <input type="hidden" name="etcid"/>
						</form>
                   	</div>
                   </div>  
               </div>  
           </div>  
       </div>
    <%@ include file="../public/footer.jsp" %>
    <script src="<%=basePath%>js/bootstrap.js"></script>
  </body>
</html>
							