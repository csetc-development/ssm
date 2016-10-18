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
    
    <title>ETC-客户签单</title>
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
					<li><a href="<%=basePath%>empinfo/showMe.do">个人中心</a></li>
<!-- 					<li><a href="<%=basePath%>admin/manager.do">管理员</a></li> -->
<!-- 					<li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">客户签单</h1>
				<div>
				  	<div class="panel panel-info panel-body">
						<div id="" class="container ">
							<form action="paycode/addonecode.do" class="form-horizontal" method="post">
							<input type="hidden" name="crid" value="${cusinfo.crid }">
							<input type="hidden" name="sale" value="${tempuser.eid }">
							<div class="form-group">
								<div class="col-md-2 text-right"> 姓名： </div>
								<div class="col-md-2 "> ${cusinfo.crname}</div>
								<div class="col-md-2 text-right"> 性别： </div>
								<div class="col-md-1 "> ${cusinfo.crsex}</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right"> 籍贯： </div>
								<div class="col-md-2 ">${cusinfo.cdhometown}</div>
								<div  class="col-md-2 text-right">* 手机： </div>
								<div class="col-md-2 "><input  type="text" name="crtel" value="${cusinfo.crtel }"></div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right"> 毕业院校： </div>
								<div class="col-md-2 "><input type="text" name="crschool" value="${cusinfo.crschool }"></div>
								<div class="col-md-2 text-right"> 毕业时间： </div>
								<div class="col-md-2 ">
									<div class='input-group date datetimepicker'>  
						                <input type='text' name="cdgraduationtime" value="${cusinfo.cdgraduationtime }" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
									<%-- <input type="text" name="cdgraduationtime" value="${cusinfo.cdgraduationtime }"> --%>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right"> 签单时间： </div>
								<div class="col-md-2">
									<div class='input-group date datetimepicker'>  
						                <input type='text' placeholder="默认为当前系统日期" name="ctime" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div><!-- <input type="text" value="" placeholder="不填默认为系统日期" name="ctime"> --></div>
								<div class="col-md-2 text-right"> 销售： </div>
								<div class="col-md-2 ">${tempuser.username}</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">* 业务类型： </div>
								<div class="col-md-2">
									<select id="ctype" name="ctype">
										<c:forEach var="bustype" items="${allbustype}">
											<option value="${bustype.btid }">${bustype.btname}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 text-right">* 地区： </div>
								<div class="col-md-2 ">
									<select id="carea" name="carea">
										<c:forEach var="area" items="${allareaname}">
											<option value="${area.aid }">${area.aname}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">* 学习方向： </div>
								<div class="col-md-2">
									<select id="cremark" name="cremark">
									<option value="0!">请选择</option>
										<c:forEach items="${studaycourse }" var="sc">
											<option value="${sc.syid }!${sc.stuition  }#${sc.studytime}">${sc.syname }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 text-right">* 学费：</div>
								<div id="xuefei" class="col-md-2">0</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">* 住宿地址： </div>
								<div class="col-md-2">
									<select id="spname" name="spname">
										<option value="0">不住宿</option>
										<c:forEach items="${space }" var="sp">
											<option value="${sp.price }">${sp.spname }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 text-right">* 住宿费：</div>
								<div id="zhusufei" class="col-md-2">0</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">* 应收款： </div>
								<div class="col-md-2"><input type="text" value="" name="creceivables" id="creceivables"> </div>
								<div class="col-md-2 text-right"> </div>
								<div class="col-md-2"></div>
							</div>
							<div class="form-group">
								<div class="col-md-2 text-right">* 已收款： </div>
								<div class="col-md-1">
									<label><input type="checkbox" value="" name="pay" id="tuition">学费 </label>
								</div>
								<div class="col-md-1">
									<label><input type="checkbox" value="" name="pay" id="accommodation">住宿费 </label>
								</div>
							</div>
							<div class="col-md-2 col-md-offset-3">
								<button type="submit" class="btn btn-success btn-block">确定签单信息</button>
							</div>
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
	<script src="<%=basePath%>myjs/add_code.js"></script>
  </body>
</html>
											