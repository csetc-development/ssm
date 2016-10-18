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
    
    <title>ETC-班级管理</title>
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
	<script type="text/javascript" src="<%=basePath%>myjs/etcclass.js"></script>
  </head>
  
  <body>
   	<jsp:include page="../public/navheader.jsp"></jsp:include>
   	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath%>customer/manager.do">客户管理</a></li> --%>
					<li class="active"><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li>
					
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li>
					<li><a href="<%=basePath%>empinfo/showMe.do">个人中心</a></li>
<!-- 					<li><a href="<%=basePath%>admin/manager.do">管理员</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">班级管理</h1>
				<a data-toggle="modal" data-target="#addclass">新建</a>
				 <form class="navbar-form navbar-right" role="search">
			        <div class="form-group">
			          <input class="form-control input-sm" placeholder="请输入班级名字" type="text" id="stuName" name="">
			        </div>
			        <a class="btn btn-default btn-sm" onclick="stuByName()">搜索</a>
			      </form>
				<div class="container-fluid">
					<div class="row-fluid">
					<c:forEach items="${allclassinfo }" var="cla">
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
							<div class="panel panel-default">
							  <div class="panel-heading">${cla.etcname }</div>
							  <div class="panel-body">
							  		班级编号：<span>${cla.etcid }</span><br>
							  		 班主任：<span>${cla.ename }</span><br>
							  		原定人数：<span>${cla.etcnum }</span><br>
							  		实际人数：<span>${cla.count }</span><br>
							  		 开班日期：<span>${cla.startdate }</span><br>
							  		 结业日期：<span>${cla.enddate }</span>
							  </div>
							  <div class="panel-footer text-right">
							  	<a data-toggle="modal" data-target="#updateclass" class="btn btn-warning btn-sm" >修改</a> &nbsp;
							  	<a class="btn btn-danger btn-sm">删除</a> &nbsp;
							  	<a name="kaohe" class="btn btn-default btn-sm">考核</a>
							  </div> 
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
   	<%@ include file="../public/footer.jsp" %>
<div class="modal fade" id="addclass" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">新增班级</h3> 
                   </div>  
                   <div class="modal-body">  
                   	<div class="row">
                   		<form class="form-horizontal" role="form" action="etcclass/addclass.do" method="post">
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">班级名字</label>
								<div class="col-sm-2">
									<input type="text" name="etcname" id="etcname" placeholder="格式为‘专业-开班时间-类型’" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">班级人数</label>
								<div class="col-sm-2">
									<input type="text" id="etcnum" placeholder="只能输入正整数" name="etcnum" required="required" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">班主任</label>
								<div class="col-sm-2">
									<select id="eid" name="eid">
									<c:forEach items="${empinfos }" var="empinfo">
										<option value="${empinfo.eid }">${empinfo.ename }</option>
									</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">开班日期</label>
								<div class="col-sm-5">
									<div class='input-group date datetimepicker'>  
						                <input type='text' placeholder="不填默认为当前系统日期" name="startdate" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
									<!-- <input type="text" name="startdate" placeholder="不填为当前系统时间" id="startdate" > -->
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">结业日期</label>
								<div class="col-sm-5">
									<div class='input-group date datetimepicker'>  
						                <input type='text' placeholder="不填为开班四个月后日期" name="enddate" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
									<!-- <input type="text" name="enddate" placeholder="不填为开班四个月后日期" id="enddate"> -->
								</div>
							</div>
							<p align="center">  
								<button type="submit" class="btn btn-default">确定 </button> 
							</p> 
						</form>
                   	</div>
                   </div>  
                   
               </div>  
           </div>  
       </div>
<div class="modal fade" id="updateclass" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">修改班级信息</h3> 
                   </div>  
                   <div class="modal-body">  
                   	<div class="row">
                   		<form class="form-horizontal" role="form" action="etcclass/updateclass.do" method="post">
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">班级名字</label>
								<div class="col-sm-2">
									<input type="text" maxlength="20" name="etcname" id="etcname" value="">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">班级最多人数</label>
								<div class="col-sm-2">
									<input type="text" id="etcnum" value="" name="etcnum" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">班主任</label>
								<div class="col-sm-2">
									<select id="eid" name="eid">
									<c:forEach items="${empinfos }" var="empinfo">
										<option value="${empinfo.eid }">${empinfo.ename }</option>
									</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">开班日期</label>
								<div class="col-sm-5">
									<div class='input-group date datetimepicker'>  
						                <input type='text' name="startdate" id="startdate" class="form-control input-sm" required/>  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
									<!-- <input type="text" name="startdate" value="" id="startdate"  >-->
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-sm-3 control-label">结业日期</label>
								<div class="col-sm-5">
									<div class='input-group date datetimepicker'>  
						                <input type='text' name="enddate" id="enddate" class="form-control input-sm" required/>  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
									<!-- <input type="text" name="enddate" value="" id="enddate"> -->
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
      
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
						