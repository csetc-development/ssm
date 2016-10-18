<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>ETC-业务管理</title>
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

</head>
<body>
	<jsp:include page="../public/navheader.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<li><a href="<%=basePath %>customer/manager.do">客户管理</a></li>
					<li><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li class="active"><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li>
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
					<li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li>
					<li><a href="">中文</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">业务管理</h1>
			</div>
		</div>
	</div>
<%-- 	<input type="hidden" id="pagecount" value="${pages}">
	<input type="hidden" id="stausp" value="1">
	<input type="hidden" id="pagecount2" value="${cpages }">
	<div id="dcMain">
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>业务管理</h3>
			<script type="text/javascript">
				$(function() {
					$(".idTabs").idTabs();
				});
			</script>
			<div class="idTabs">
				<ul class="tab">
					<li><a href="#customer_info" onclick="chagestatus(1)">签单</a></li>
					<li><a href="#payment" onclick="chagestatus(2)">收款</a></li>
				</ul>
			</div>
			<div class="customer_info">
				<form action="/business_code.do" method="post"
					enctype="multipart/form-data">
					<div id="customer_info">
						<table width="100%" boder="0" cellpadding="8" cellspacing="0"
							class="tableBasic" id="customerInfo">
							<tr>
								<th>签单编号</th>
								<th>客户姓名</th>
								<th>签单时间</th>
								<th>销售</th>
								<th>签单类型</th>
								<th>签单区域</th>
								<th>应缴金额</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${codes}" var="code">
								<tr>
									<td>${code.cid }</td>
									<td>${code.crname }</td>
									<td>${code.ctime }</td>
									<td>${code.ename }</td>
									<td>${code.btname}</td>
									<td>${code.aname}</td>
									<td>${code.creceivables }</td>
									<td><a
										href="<%=basePath%>paycode/selectByPrimaryKey.do?cid=${code.cid}&crname=${code.crname }">编辑</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="payment">
						<table width="100%" boder="0" cellpadding="8" cellspacing="0"
							class="tableBasic" id="receivablestable">
							<tr>
								<th>客户姓名</th>
								<th>签单时间</th>
								<th>销售</th>
								<th>签单类型</th>
								<th>签单区域</th>
								<th>应缴金额</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${receivables}" var="receivable">
								<tr>
									<td>${receivable.crname }</td>
									<td>${receivable.ctime }</td>
									<td>${receivable.ename }</td>
									<td>${receivable.btname}</td>
									<td>${receivable.aname}</td>
									<td>${receivable.creceivables }</td>
									<td><a href="customer/cheques.do?cid=${receivable.cid }">核对收款</a>&nbsp;&nbsp;
										<a href="customer/rebate.do?cid=${receivable.cid }">退款</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>

				</form>
			</div>
			<script type="text/javascript"
				src="<%=basePath%>myjs/pageGroupByCodes.js"></script>
			<div id="pageGro" class="cb">
				<div class="pageUp">上一页</div>
				<div class="pageList">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
					</ul>
				</div>
				<div class="pageDown">下一页</div>
			</div>
		</div>
	</div --%>>
	<%@ include file="../public/footer.jsp" %>
</body>
</html>
