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
    
    <title>ETC-新增学员</title>
    
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
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
  </head>
  
  <body>
  <jsp:include page="../public/navheader.jsp"></jsp:include>
    <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>emp/adminindex.do">管理首页<span class="sr-only">(current)</span></a></li>
					<%-- <li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> --%>
					<li class="active"><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li>
<!-- 					<li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li> -->
<!-- 					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li> -->
					
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
					<li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li>
<!-- 					<li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li> -->
<!-- 					<li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">新增学员</h1>
				<div ></div>
				<div class="container-fluid">
					<div class="row-fluid">
					<c:choose>
						<c:when test="${empty students }">
							没有符合入学的客户
						</c:when>
						<c:otherwise>
							<form action="student/addstu.do" method="post" onsubmit="return pinyin()" class="form-horizontal">
								<input value="" name="sid" type="hidden">
								<input value="" name="etcid" type="hidden">
								<input value="0" name="sphonetic" id="sphonetic" type="hidden">
								<div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
							      <label>姓名：</label>
							        <select name="crid" id="crname" required>
							        	<option value="0">请选择</option>
							        	<c:forEach items="${students}" var="student">
							        		<option value="${student.crid}">${student.crname}</option>
							        	</c:forEach>
							        </select>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3"> 
							      	<label>选择班级名称：</label> 
							      	<select id="etcid" required>
							        	<option value="0">请选择</option>
							        	<c:forEach items="${classname}" var="cname">
							        		<option value="${cname.etcid}!${cname.count}">${cname.etcname}</option>
							        	</c:forEach>
							        </select>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2"> <label>学号：</label><span id="studentid">还没有选择班级</span></div>
							     </div>
								<div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							      <label>qq：</label>
							        <input type="text" name="sqq" required>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"> <label>电子邮箱：</label> <input name="semail" type="text" required > </div>
							    </div>
							    <div class="form-group">
							    	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"> 
							    		<label>学习方向：</label> 
							    		<select name="styledirection"> 
							    			<c:forEach items="${studire}" var="sty">
							    				<option value="${sty.syid }">${sty.syname }</option>
							    			</c:forEach>
							    		</select>
							    	</div>
							    	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"> <label>紧急联系人号码：</label> <input name="surgenttel" type="text" requried> </div>
							    </div>
							     <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"> 
							      <label>学历性质：</label>
							      <select name="seducationbackground">
							      		<option value="统招">统招</option>
							      		<option value="自考">自考</option>
							      		<option value="成人">成人</option>
							      		<option value="函授">函授</option>
							      </select>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>目前状态：</label> 
							       <select name="status">
							      		<option value="在读">在读</option>
							      		<option value="应届">应届</option>
							      		<option value="非应届">非应届</option>
							      		<option value="在职">在职</option>
							      		<option value="待业">待业</option>
							      </select>
							      </div>
							     </div>
							      <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>英语级别：</label> 
							       <select name="senglishlevel">
							      		<option value="4级">4级</option>
							      		<option value="6级">6级</option>
							      		<option value="专四">专四</option>
							      		<option value="专八">专八</option>
							      		<option value="无">无</option>
							      	</select>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
							       <label>工作经历：</label> 
							      	<span><input type="radio" name="sworkingexperience" checked="checked" value="1">有软件开发经验</span>
							      	<span><input type="radio" name="sworkingexperience" value="0">无软件开发经验</span>
							      </div>
							      </div>
							      <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>学校负责人：</label> 
							      	<input type="text" name="schoolprincipal"  value="">
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>负责人电话：</label> 
							      	<input type="text" name="sptel"  value="">
							      </div>
							     </div>
							      <div class="form-group">
							      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							       <label>其他家庭成员：</label> 
							       <input type="checkbox" name="family" value="父亲">父亲
							       <input type="checkbox" name="family" value="母亲">母亲
							       <input type="checkbox" name="family" value="姐姐">姐姐
							       <input type="checkbox" name="family" value="妹妹">妹妹
							       <input type="checkbox" name="family" value="哥哥">哥哥
							       <input type="checkbox" name="family" value="弟弟">弟弟
							      </div>
							     </div>
							      <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>父母社会背景：</label> 
							      	<select name="solcialbackground">
							      		<option value="务农">务农</option>
							      		<option value="经商">经商</option>
							      		<option value="个体">个体</option>
							      		<option value="教师">教师</option>
							      		<option value="公务员">公务员</option>
							      		<option value="工人">工人</option>
							      		<option value="退休">退休</option>
							      		<option value="无业">无业</option>
							      		<option value="其他">其他</option>
							      	</select>
							      </div>
							     </div>
							      <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>学习过哪些编程语言：</label> 
							      	<select name="slanguage">
							      		<c:forEach items="${langusges }" var="langusge">
							      			<option value="${langusge.lid }">${langusge.lname }</option>
							      		</c:forEach>
							      	</select>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
							       <label>意向就业城市：</label> 
							      	<select name="sjobcity">
							      		<c:forEach items="${citys }" var="city">
							      			<option value="${city.lid }">${city.lname }</option>
							      		</c:forEach>
							      	</select>
							      </div>
							     </div>
							    <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>是否中软学员介绍：</label> 
							       <input type="radio" name="sintroduce" value="1">是
							       <input type="radio" name="sintroduce" checked="checked" value="0">否
							     </div>
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>缴费方式：</label> 
							       <select name="spayment">
							       	<option value="现金">现金</option>
							       	<option value="转账">转账</option>
							       	<option value="支票">支票</option>
							       	<option value="贷款">贷款</option>
							       </select>
							     </div>
							     </div>
							    <div class="form-group">
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>后续费用情况：</label> 
							       <input type="text" name="slatecharges" value="">
							     </div>
							    </div>
							    <div class="form-group">
							     <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>预报名费：</label> 
							       <input type="text" name="sentryfee">
							     </div>
							      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
							       <label>经办人：</label> 
							       <input type="text" name="sagent">
							     </div>
							    </div>
							    <div class="form-group">
							      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							       <label>获奖经历：</label> 
							       <textarea name="sprizeexperience" rows="3" cols=""></textarea>
							      </div>
							      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
							       <label>兴趣爱好：</label> 
							       <textarea name="hobby" rows="3" cols=""></textarea>
							     </div>
							    </div>
							    <div class="">
							      <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
								      <label>入学日期：</label> 
								      <div class='input-group date datetimepicker'>  
						                <input type="text" placeholder="不填默认为系统日期" name="sdate" class="form-control input-sm" />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
								      <!-- <input name="sdate" type="text" placeholder="不填默认为系统日期" > -->
							      </div>
							    </div>
							     <div class="col-md-2 col-md-offset-3">
							     	 <button type="submit" class="btn btn-success ">确定</button>
							     </div>
							</form>
						</c:otherwise>
					</c:choose>
					
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div style="height: 40px;"></div>
     <%@ include file="../public/footer.jsp" %>
     <script type="text/javascript" src="<%=basePath%>myjs/addstudents.js"></script>
  </body>
</html>
					       