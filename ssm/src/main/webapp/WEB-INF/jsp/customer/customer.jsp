<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>ETC-客户管理</title>
<!-- Bootstrap core CSS -->
<link href=" <%=basePath%>css/add_stu.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<!-- page CSS -->
<link href="<%=basePath%>css/page.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">


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
<script type="text/javascript" src="<%=basePath%>myjs/add_stu.js"></script>
</head>

<body>
	<jsp:include page="../public/navheader.jsp"></jsp:include>
	<input value="${pages }" id="pagecount" type="hidden">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
					<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
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
					<h1 class="page-header">客户管理</h1>
					<div class="text-right">
						 <form class="navbar-form navbar-right" role="search">
					        <div class="form-group">
					          <input class="form-control input-sm" placeholder="请输入客户姓名" type="text" id="cusName" name="">
					        </div>
					        <button type="button" class="btn btn-default btn-sm" onclick="customerByName()">搜索</button>
					      </form>
					</div>
				</div>
				
				<ul class="nav nav-pills">
					<li class="active"><a href="#allcustomer" data-toggle="tab">全部客户</a></li>
					<li><a href="#potentialcustomer" data-toggle="tab">潜在客户</a></li>
					<li><a href="#welcomecustomer" data-toggle="tab">上门客户</a></li>
					<li><a href="#paycodecustomer" data-toggle="tab">签约客户</a></li>
					<li><a href="#comecustomer" data-toggle="tab">入学客户</a></li>
					<li><a href="#other" data-toggle="tab">其他</a></li>
				</ul>
				<div class="container" style="height:20px;"></div>
				<div class="tab-content" id="customerTabContent">
					<div class="tab-pane fade in active" id="allcustomer">
						<!--  -->
						<div class="btn-group">
							<button id="btn_add" type="button" class="btn btn-sm btn-primary" onclick="ShowDiv('MyDiv','fade')">
								<span class="glyphicon glyphicon-plus" aria-hidden="true">新增</span>
							</button>
							<button id="btn_edit" type="button" class="btn btn-sm btn-success" onclick="updatacustomerinfo()">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span>
							</button>
							<button id="btn_delete" type="button" class="btn btn-sm btn-warning" onclick="delectcustomerinfo()">
								<span class="glyphicon glyphicon-remove" aria-hidden="true">删除</span>
							</button>
						</div>
						<table class="table table-striped table-hover table-responsive table-bordered" id="customerinfotable">
							<thead>
								<tr>
								  <th>&nbsp;&nbsp;<input type="checkbox" value="all" id="complete"></th>
								  <th>姓名</th>
								  <th>性别</th>
								  <th>出生年月</th>
								  <th>籍贯</th>
								  <th>民族</th>
								  <th>政治面貌</th>
								  <th>最高学历</th>
								  <th>毕业院校</th>
								  <th>专业</th>
								  <th>手机</th>
								  <th>客户状态</th>
								</tr>
							  </thead>
							  <tbody>
							 	<c:forEach items="${allCostomerInfo }" var="CostomerInfo">
							 	<tr>
								  <td>&nbsp;&nbsp;<input type="checkbox" value="${CostomerInfo.crid}" name="complete_checkbox"></td>
								  <td><a href="customer/updatecustrunonjsp.do?crid=${CostomerInfo.crid}">${CostomerInfo.crname}</a></td>
								  <td>${CostomerInfo.crsex}</td>
								  <td>${CostomerInfo.cdbrithday}</td>
								  <td>${CostomerInfo.cdhometown}</td>
								  <td>${CostomerInfo.cdnation}</td>
								  <td>${CostomerInfo.cdlandscape}</td>
								  <td>${CostomerInfo.cdeducation}</td>
								  <td>${CostomerInfo.crschool}</td>
								  <td>${CostomerInfo.crmajor}</td>
								  <td>${CostomerInfo.crtel}</td>
								  <td>${CostomerInfo.csname}</td>
								</tr>
							 	</c:forEach>
							</tbody>
						</table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					
					<div class="tab-pane fade" id="potentialcustomer">
						<table class="table table-striped table-hover table-responsive table-bordered" id="potentialtable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="welcomecustomer">
						<table class="table table-striped table-hover table-responsive table-bordered" id="welcometable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="paycodecustomer">
						<table class="table table-striped table-hover table-responsive table-bordered" id="paycodetable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="comecustomer">
						<table class="table table-striped table-hover table-responsive table-bordered" id="cometable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="other">
						<table class="table table-striped table-hover table-responsive table-bordered" id="othertable"><tr><td>没有相关数据</td></tr></table>
						<!-- 分页按钮  -->
						<div class="container">
							<div class="row">
								<div class="tcdPageCode col-xs-12 col-sm-6 col-md-8 col-lg-6 col-sm-offset-3 col-md-offset-2 col-lg-offset-3"> </div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<!--弹出层时背景层DIV-->
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">

		<form id="payment" action="customer/addCustomer.do" method="post" onsubmit="return checkCoutomer()">
			<%-- <input type="hidden" name="pid" value="${loginper.pid }"> --%>
			<div style="text-align: right; cursor: default;">
				<span onclick="CloseDiv('MyDiv','fade')">×</span>
			</div>
			<fieldset>
				<legend>客户详细资料</legend>
				<ol>
					<li>
						<label for="uname">*&nbsp;客户姓名：</label>
						<input id="uname" name="crname" type="text" placeholder="请输入客户名"
							required autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="crsex">*&nbsp;性别：</label>
						<input id="man" name="crsex" type="radio" checked="checked" value="男">男
						&nbsp;&nbsp;<input id="woman" name="crsex" type="radio" value="女">女
					</li>
					<li>
						<label for="crsex">*&nbsp;批量客户：</label>
						<input id="onlyone" name="cronline" type="radio" value="0">是
						&nbsp;&nbsp;<input id="notone" name="cronline" type="radio" checked="checked" value="1">否
					</li>
					<li>
						<label for="utel">*&nbsp;电话：</label>
						<input id="utel" name="crtel" maxlength="11" autofocus onkeyup="value=value.replace(/[^\d]/g,'')"  type="tel" required>
					</li>
					<li>
						<label for="provinces">籍贯：</label>
						<select id="provinces" name="cdhometown"></select>
					</li>
					<li>
						<label for="politics">政治面貌：</label>
						<select id="politics" name="cdlandscape"></select>
					</li>
					<li>
						<label for="national">民族：</label>
						<select id="national" name="cdnation"></select>
					</li>
					<li>
						<label for="cbrithday">出生年月：</label>
						<div class='input-group date datetimepicker'>  
			                <span class="input-group-addon input-sm">  
			                    <span class="glyphicon glyphicon-calendar"></span>  
			                </span>  
			                <input type='text' name="cdbrithday" class="form-control input-sm" autofocus maxlength="10" required/> 
			            </div>
						<!-- <input id="cbrithday" name="cdbrithday" autofocus maxlength="10"> -->
					</li>
					<li>
						<label for="uschool">学校院系：</label>
						<input id="uschool" name="crschool" autofocus type="text" placeholder="请输入学校院系名称"
							required autofocus maxlength="30" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="umajor">专业：</label>
						<input id="umajor" name="crmajor" type="text" autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="qualifications">最高学历：</label>
						<select id="qualifications" name="cdeducation"></select>
					</li>
				</ol>
			</fieldset>
			<div id="customerbtn">
				<button type="submit">确定</button>
			</div>
			<script type="text/javascript" src="<%=basePath %>js/sfmz.js"></script>
		</form>
	</div>
	<div class="clear"></div>
	<%@ include file="../public/footer.jsp"%>
	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="<%=basePath%>myjs/customer.js"></script>
	<script src="<%=basePath%>js/page.js"></script>
</body>
</html>
						