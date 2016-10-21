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
	
	<title>ETC-修改角色信息</title>
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
    <script type="text/javascript" src="<%=basePath%>myjs/roleperm.js"></script>
    
  </head>
  
  <body>
  	<jsp:include page="../public/navheader.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
	<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li ><a href="<%=basePath%>emp/adminindex.do">首页<span class="sr-only">(current)</span></a></li>
				<li ><a href="<%=basePath%>signed/signedinfo.do">签单客户</a></li>
				<li ><a href="<%=basePath%>signed/firstincomepay.do">收入支出</a></li>
				<%-- <li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
				<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
				<li><a href="<%=basePath%>empinfo/empmanagement.do">员工管理</a></li>
				<li><a href="<%=basePath%>paycode/Codes.do">业务管理</a></li>
				<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li> --%>
			</ul>
			<ul class="nav nav-sidebar">
				<%--<li><a href="<%=basePath%>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> --%>
				<li ><a href="<%=basePath%>user/haveuserinfo.do">用户管理</a></li>
				<li class="active"><a href="<%=basePath%>roleperm/roleinfo.do">角色权限管理</a></li>
			</ul>
			<div id="tree"></div>
		</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2>修改角色信息</h2>
				<div class="panel panel-info panel-body">
					<p>（只能修改描述、以及选择该角色所包含的权限）</p>
					 <form class="form-horizontal" action="<%=basePath%>roleperm/updateInfo.do" method="post">
						<div class="form-group">
					      <label for="crname" class="col-md-2 control-label">id</label>
					      <div class="col-md-2">
					        <input id="rid" name="rid" type="text"  readonly="readonly"  value="${role.rid }">
					      </div>
					      <label  class="col-md-2 control-label">字段</label>
					      <div class="col-md-2">
						      	<input id="name" name="name" type="text" value="${role.name }" readonly="readonly"  >
					      </div>
					    </div>
						<div class="form-group">
					      <label for="ebrithday" class="col-md-2 control-label">描述</label>
					      <div class="col-md-2">
					      	<input type="text" id="description" name="description"  value="${role.description }">
					      </div>
					      <div class="col-md-2">
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="ebrithday" class="col-md-2 control-label">目前所含权限</label>
					      <div class="col-md-2">
					      	 <textarea rows="3" cols="5" id="permissions_des" readonly="readonly"  style="height:150px;width:400px;resize:none;"><c:forEach items="${permlist }" var="permlist">${permlist.description },</c:forEach>
					      	</textarea>
					      </div>					     
					      <div class="col-md-2">
					      </div>
					    </div>
						
						<div class="form-group">
					      <div class="form-group">
					      <label for="ejob" class="col-md-2 control-label">权限</label>
					      <div class="col-md-7" >
					          <c:forEach items="${perms }" var="perms">
					          	<input type="checkbox" name="perms" id="perms${perms.pid }" value="${perms.pid }"><label for="perms${perms.pid }">${perms.description }</label> &nbsp;&nbsp; &nbsp;&nbsp;
					          </c:forEach>	      
					      </div>
					       <div class="col-md-2 col-md-offset-3">
					           <input type="hidden" id="pidlist" name="pidlist" required="required" value="0">
					        <button type="submit" class="btn btn-success btn-block" >保存</button>
					   	   </div>
					    </div>
					    
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
											      