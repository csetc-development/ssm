<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  </head>
  
  <body>
    <jsp:include page="../public/navheader.jsp"></jsp:include>
    <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> --%>
					<li class="active"><a href="<%=basePath %>student/stumanagement.do">学员管理</a></li>
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
				<h1 class="page-header">学员管理</h1>
				<div class="text-right">
						 <form class="navbar-form navbar-right" role="search">
					        <div class="form-group">
					          <input class="form-control input-sm" placeholder="请输入学员姓名" type="text" id="cusName" name="">
					        </div>
					        <button type="button" class="btn btn-default btn-sm" onclick="customerByName()">搜索</button>
					      </form>
					</div>
				<ul class="nav nav-pills">
					<li class="active"><a href="#allstudent" data-toggle="tab">全部学员</a></li>
					<li><a href="#checkstudent" data-toggle="tab">学员考核</a></li>
					<li><a href="#graduatestudent" data-toggle="tab">待结业学员</a></li>
					<li><a href="#workedstudent" data-toggle="tab">已结业学员</a></li>
				</ul>
				<div class="container" style="height:20px;"></div>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="allstudent">
						<table class="table table-striped table-hover table-responsive table-bordered ">
							<thead>
								<tr>
								  <th>&nbsp;&nbsp;<input type="checkbox" value="allstudent" id="students"></th>
								  <th>学号</th>
								  <th>姓名</th>
								  <th>性别</th>
								  <th>出生年月</th>
								  <th>班级名称</th>
								  <th>助教</th>
								  <th>学习方向</th>
								  <th>手机</th>
								  <th>qq</th>
								  <th>邮箱</th>
								</tr>
							  </thead>
							  <tbody>
							  <!-- 显示全部学员的信息 -->							  	
							  	<tr>
							  	  <th></th>
							  	  <th>${stumanage_one.sid}</th>
							  	  <th>${stumanage_one.crname}</th>
								  <th>${stumanage_one.crsex}</th>
								  <th>${stumanage_one.cdbrithday}</th>
								  <th>${stumanage_one.etcname}</th>								  
								  <th>${stumanage_one.ename}</th>
								  <th>${stumanage_one.syname}</th>
								  <th>${stumanage_one.crtel}</th>
								  <th>${stumanage_one.sqq}</th>
								  <th>${stumanage_one.semail}</th>
							  	</tr>
							    	<tr>
							 		<td colspan="12">
							 			<div class="btn-group">
											 <button id="btn_add" type="button" class="btn btn-sm btn-primary" onclick="">
												<span class="glyphicon glyphicon-plus" aria-hidden="true">新增</span>
											</button>
											<button id="btn_edit" type="button" class="btn btn-sm btn-success" onclick="">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span>
											</button>
											<button id="btn_delete" type="button" class="btn btn-sm btn-warning" onclick="">
												<span class="glyphicon glyphicon-remove" aria-hidden="true">删除</span>
											</button>
										</div>
							 		</td>
							 	</tr>
							  </tbody>
						</table>
					暂时没有相关数据
					</div>
					<div class="tab-pane fade" id="checkstudent">暂时没有相关数据</div>
					<div class="tab-pane fade" id="graduatestudent">暂时没有相关数据</div>
					<div class="tab-pane fade" id="workedstudent">暂时没有相关数据</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mystudents" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">期望薪资</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select>
				          <option value="0-2k">0-2k</option>
				          <option value="2k-3k">2k-3k</option>
				          <option value="3k-4k">3k-4k</option>
				          <option value="4k-5k">4k-5k</option>
				          <option value="5k-6k">5k-6k</option>
				          <option value="6k-8k">6k-8k</option>
				          <option value="8k-10k">8k-10k</option>
				          <option value="10k-15k">10k-15k</option>
				          <option value="15k-20k">15k-20k</option>
				          <option value="20k以上">20k以上</option>
				        </select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>
    <%@ include file="../public/footer.jsp" %>
  </body>
</html>
