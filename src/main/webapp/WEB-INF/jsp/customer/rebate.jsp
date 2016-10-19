<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ETC-核对收款信息</title>
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
</head>


	
  </head>
  
  <body>
  <jsp:include page="../public/navheader.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
<!-- 					<li><a href="<%=basePath%>student/management.do">学员管理</a></li> -->
<!-- 					<li><a href="<%=basePath%>empinfo/empmanagement.do">员工管理</a></li> -->
<!-- 					<li><a href="<%=basePath%>paycode/Codes.do">业务管理</a></li> -->
					<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
<!-- 					<li><a href="<%=basePath%>admin/manager.do"><i -->
<!-- 							class="manager"></i>管理员</a></li> -->
<!-- 					<li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div>
					<h1 class="page-header">核对退款信息</h1>
					<div class="panel panel-info panel-body">
						<div id="" class="container ">
							<form action="payrecord/addrecord.do" method="post" class="form-horizontal">
								<input type="hidden" id="cid" name="prpaycode" value="${sigpay.cid}"/>
								<input type="hidden" name="prhandler" value="${loginemp.eid }">
								<div class="form-group">
									<div class="col-md-2 text-right"> 姓名： </div>
									<div class="col-md-2 "> ${sigpay.crname}</div>
									<div class="col-md-2 text-right"> 性别： </div>
									<div class="col-md-1 "> ${sigpay.crsex}</div>
								</div>
								<div class="form-group">
									<div class="col-md-2 text-right"> 毕业院校： </div>
									<div class="col-md-2 ">${sigpay.crschool}</div>
									<div  class="col-md-2 text-right"> 专业： </div>
									<div class="col-md-2 ">${sigpay.crmajor }</div>
								</div>
								<div class="form-group">
									<div class="col-md-2 text-right"> 电话： </div>
									<div class="col-md-2 ">${sigpay.crtel }</div>
									<div class="col-md-2 text-right"> 签单时间： </div>
									<div class="col-md-2 ">${sigpay.ctime }</div>
								</div>
								<div class="form-group">
									<div class="col-md-2 text-right"> 学习方向： </div>
									<div class="col-md-2 ">${syname }</div>
									<div class="col-md-2 text-right"> 销售： </div>
									<div class="col-md-2 ">${loginemp.ename }</div>
								</div>
								<div class="form-group">
									<div class="col-md-2 text-right"> 应缴金额： </div>
									<div id="yingjiao" class="col-md-2 ">${sigpay.creceivables }</div>
									<div class="col-md-2 text-right"> 已交金额： </div>
									<div id="yijiao" class="col-md-2">${countmoney }</div>
								</div>
								<div class="form-group hd">
									<div class="col-md-2 text-right"> 收款时间： </div>
									<div class="col-md-2 "><input type="text" placeholder="不填默认为系统日期" name="prtime"  value=""></div>
									<div class="col-md-2 text-right"> 经手人： </div>
									<div class="col-md-2"> ${loginemp.ename } </div>
								</div>
								<div class="form-group hd">
									<div class="col-md-2 text-right"> 此次退费类型： </div>
									<div class="col-md-2 ">
										<select name="prpaytype" id="prpaytype">
										<c:forEach var="type" items="${paytype }">
											<option value="${type.ptid}">${type.ptname }</option>
										</c:forEach>
										</select>
									</div>
									<div class="col-md-2 text-right"> 金额： </div>
									<div class="col-md-2"><input type="text" id="prpaymoney" name="prpaymoney" required onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/></div>
								</div>
								<div class="col-md-2 col-md-offset-3 hd"><input type="submit" class="btn btn-success" value="确定"/> </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../public/footer.jsp" %>

	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="<%=basePath%>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="<%=basePath%>myjs/customer.js"></script>
  </body>
</html>
