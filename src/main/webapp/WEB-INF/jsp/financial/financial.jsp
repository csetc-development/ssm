<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
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
<script type="text/javascript" src="<%=basePath%>myjs/financial.js"></script>
</head>

<body>
	<jsp:include page="../public/navheader.jsp"></jsp:include>
	<input value="${pages }" id="pagecount" type="hidden">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>emp/adminindex.do">首页<span class="sr-only">(current)</span></a></li>
					<li><a href="<%=basePath%>signed/signedinfo.do">签单客户</a></li>
					<li class="active"><a href="<%=basePath%>signed/firstincomepay.do">收入支出</a></li>
					
					<%-- <li class="active"><a href="<%=basePath%>customer/manager.do">客户管理</a></li>
					<li><a href="<%=basePath%>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath%>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath%>paycode/Codes.do">业务管理</a></li>
					<li><a href="<%=basePath%>paycode/reports.do">数据统计</a></li> --%>
					
				</ul>
				
				<%-- <ul class="nav nav-sidebar">
					<li><a href="<%=basePath%>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
					<li><a href="<%=basePath%>admin/manager.do">管理员</a></li>
				</ul> --%>
				<div id="tree"></div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				
				<div class="container" style="height:20px;"></div>
		
				<div class="container">
					<div class="row">
					</div>
				</div>
					<table class="table table-striped table-hover table-responsive table-bordered" id="signstautusinfotable">
						<thead>
							<tr>
								<td colspan="14">
									<select id="">
										<option value="1">待收款</option>
										<option value="2">已收款</option>
										<option value="3">待返款</option>
										<option value="4">待退款</option>
									</select>
									
								</td>
							</tr>
							<tr>
								<td colspan="14">
									<div class="btn-group">
										<button id="btn_edit" type="button" class="btn btn-xs btn-success" onclick="showModel()">
											<span class="glyphicon glyphicon-arrow-down" aria-hidden="true">收款</span>
										</button>
										<button id="btn_delete" type="button" class="btn btn-xs btn-warning" >
											<span class="glyphicon glyphicon-arrow-up" aria-hidden="true">返/退款</span>
										</button>
									</div>
								</td>
							</tr>
							<tr>
							  <th>&nbsp;&nbsp;<input type="checkbox" value="all" id="csign"></th>
							  <th>签单编号</th>
							  <th>签单时间</th>
							  <th>业务类型</th>
							  <th>销售</th>
							  <th>部门</th>
							  <th>客户姓名</th>
							  <th>学费</th>
							  <th>住宿费</th>
							  <th>补贴</th>
							  <th>定金</th>
							  <th>小计</th>
							  <th>区域</th>
							  <th>实缴费用</th>
							</tr>
						  </thead>
						  <tbody>
						 	<c:forEach items="${financial }" var="signed">
						 	<tr>
							  <td>&nbsp;&nbsp;<input type="checkbox" value="${signed.sid}" name="sign_checkbox"></td>
							  <td>${signed.sid}</td>
							  <td>${signed.stime}</td>
							  <td>${signed.sbusinesstype}</td>
							  <td>${signed.sale}</td>
							  <td>${signed.dept}</td>
							  <td>${signed.scustomername}</td>
							  <td>${signed.studyfee}</td>
							  <td>${signed.spacefee}</td>
							  <td>${signed.backfee}</td>
							  <td>${signed.depositfee}</td>
							  <td>${signed.studyfee+signed.spacefee}</td>
							  <td>${signed.sarea}</td>
							  <td>${signed.condition}<c:if test="${empty signed.condition }">0</c:if></td>
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
		</div>
	</div>

<div class="modal" id="incomeinfo" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><b>收款</b></h4>
      </div>
      <form action="" onsubmit="return checkdata()">
      	<input type="hidden" name="sid" value="">
      	<input type="hidden" name="stateid" value="">
	      <div class="modal-body">
		      <div class="panel panel-default">
				  <div class="panel-heading">
				  	<span>日期：</span><input name="time" type="text" style="border-style:none">&nbsp;
	      			<span>经手人：</span><input name="handler" type="text" style="border-style:none">
	      		  </div>
				  <div class="panel-body">
				    <div class="container">
			      		<div class="row">
			      			<div class="col-md-2">订单编号：<span></span></div>
			      			<div class="col-md-8">客户姓名：<span></span></div>
			      		</div>
			      		<div class="row">
			      			<div class="col-md-2">销售：<span></span></div>
			      			<div class="col-md-8">应收金额：<label></label><span></span></div>
			      		</div>
			      		<div class="row">
			      			<div class="col-md-2">已交金额：<span></span></div>
							<div class="col-md-8">应返金额：<span></span></div>		      			
			      		</div>
			      	</div>
			      	<div class="container">
			      		<div class="row">
			      			<div class="col-md-2">本次收款金额：<input name="amount" type="text" list="receivePayment" onkeyup="this.value=this.value.replace(/\D/gi,'')" required>
			      			<datalist id="receivePayment">
							   <option value="12800">
							   <option value="13800">
							   <option value="15800">
							   <option value="19800">
							</datalist>
			      			</div>
			      		</div>
			      		<div class="row">
			      			<div class="col-md-2">备注：<textarea name="remark" rows="3" cols="" placeholder="填写本次所收款项，如学费+住宿费+补贴" required></textarea></div>
			      		</div>
			      	</div>
				  </div>
			  </div>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-primary">确定</button>
	      </div>
      </form>
    </div>
  </div>
</div>



	
	<%@ include file="../public/footer.jsp"%>
	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	<%-- <script type="text/javascript" src="<%=basePath%>myjs/customer.js"></script> --%>
	<script src="<%=basePath%>js/page.js"></script>
	<script src="<%=basePath%>js/move-model.js"></script>

</body>
</html>
						