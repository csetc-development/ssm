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
	
	<title>ETC-添加客户信息</title>
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
	<script type="text/javascript" src="<%=basePath%>myjs/users.js"></script>
  </head>
  
  <body>
  	<jsp:include page="../public/navheader.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
		<jsp:include page="../public/navleft.jsp"></jsp:include>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2>添加用户信息</h2>
				<div class="panel panel-info panel-body">
					<p>（只能选择角色）</p>
					<p>默认账号：员工姓名+出生年份</p>
					<p>默认密码：123456</p>
					 <form id="userform" class="form-horizontal" action="<%=basePath%>user/insermoretInfo.do" method="post">
					<input type="hidden" name="eid" value="${eidlist }">
					<input type="hidden" name="ebrithday" value="${birthlist }">
						<div class="form-group">
					      <label for="crname" class="col-md-2 control-label">姓名</label>
					      <div class="col-md-2">
					        <textarea rows="5" cols="10" name="ename" readonly="readonly" style="resize:none;">${namelist }</textarea>
					      </div>
					      <label  class="col-md-2 control-label"></label>
					      <div class="col-md-2">
						  </div>
					    </div>
					      <div class="form-group">
					      <label for="ejob" class="col-md-2 control-label">角色</label>
					      <div class="col-md-7" >
					          <c:forEach items="${userroles }" var="roles">
					          	<input type="checkbox" name="roles" id="roles${roles.rid }" value="${roles.rid }"><label for="roles${roles.rid }">${roles.description }</label> &nbsp;&nbsp; &nbsp;&nbsp;
					          </c:forEach>	      
					      </div>
					       <input type="hidden" id="ridlist" name="ridlist" required="required" value="0">
					      <label  class="col-md-2 control-label"></label>
					      <div class="col-md-2">
					      </div>
					    </div>
						   
					   <div class="form-group">
					      <label class="col-md-2 control-label">角色所拥有权限</label>
					     <div class="col-md-2">
					      	 <textarea rows="3" cols="5" id="permissions_des" readonly="readonly" style="height:150px;width:400px;resize:none;">没有相关权限</textarea>
					      </div>
					   </div>
					    <div class="col-md-2 col-md-offset-3">
					        <button type="submit" class="btn btn-success btn-block" >添加</button>
					    </div>
					  </form>
					</div>
				</div>
			</div>
		</div>
			

	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="<%=basePath %>js/sfmz.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	<script src="<%=basePath%>myjs/customer_register.js"></script>
  </body>
</html>
											      