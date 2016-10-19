<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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
					<li class="active"><a href="<%=basePath%>etcclass/management.do">班级管理</a></li>
					<li><a href="<%=basePath %>student/management.do">学员管理</a></li>
					<li><a href="<%=basePath %>student/management.do">宿舍管理</a></li>
					<%-- <li><a href="<%=basePath %>empinfo/empmanagement.do">员工管理</a></li>
					<li><a href="<%=basePath %>paycode/Codes.do">业务管理</a></li>
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li> --%>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li>
					<!-- <li><a href="empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> -->
					<li><a href="admin/manager.do"><i class="manager"></i>管理员</a></li>
					<!-- <li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">修改学员</h1>
				<div ></div>
				<div class="container-fluid">
					<div class="row-fluid">
					<form action="student/editstu.do" method="post" class="form-horizontal">
						<input type="hidden" name="sid" value="${stumanage_one.sid }">
						<div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
					      <label>姓名：${stuinfo_one.crname }</label>
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2"> <label>学号：${stumanage_one.sid }</label> 
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3"><label>班级编号：<a>${stumanage_one.etcid }</a></label> 
					      <input name="etcid" type="hidden" value="1"> </div>
					     </div>
						<div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					      <label>qq：</label>
					        <input type="text" name="sqq" value="${stumanage_one.sqq}">
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"> <label>电子邮箱：</label> 
					      <input name="semail" type="text" value="${stumanage_one.semail}"> </div>
					    </div>
					    <div class="form-group">
					    	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"> 
					    		<label>学习方向：
					    			<c:forEach items="${studire}" var="sty">
					      				<c:if test="${stumanage_one.styledirection == sty.syid }"> 
					      				${sty.syname }
						      			</c:if>
					    			</c:forEach>
					    		</label> 
					    	</div>
					    	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"> <label>紧急联系人号码：</label> 
					    	<input name="surgenttel" type="text" value="${stumanage_one.surgenttel}"> </div>
					    </div>
					     <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4"> 
					      <label>学历性质：</label>
					      <select name="seducationbackground">
					      		<option <c:if test="${stumanage_one.seducationbackground == '统招'}">selected="selected"</c:if> value="统招">统招</option>
					      		<option <c:if test="${stumanage_one.seducationbackground == '自考'}">selected="selected"</c:if> value="自考">自考</option>
					      		<option <c:if test="${stumanage_one.seducationbackground == '成人'}">selected="selected"</c:if> value="成人">成人</option>
					      		<option <c:if test="${stumanage_one.seducationbackground == '函授'}">selected="selected"</c:if> value="函授">函授</option>
					      </select>
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>目前状态：</label> 
					       <select name="status">
					      		<option <c:if test="${stumanage_one.status == '在读'}">selected="selected"</c:if> value="在读">在读</option>
					      		<option <c:if test="${stumanage_one.status == '应届'}">selected="selected"</c:if> value="应届">应届</option>
					      		<option <c:if test="${stumanage_one.status == '非应届'}">selected="selected"</c:if> value="非应届">非应届</option>
					      		<option <c:if test="${stumanage_one.status == '在职'}">selected="selected"</c:if> value="在职">在职</option>
					      		<option <c:if test="${stumanage_one.status == '待业'}">selected="selected"</c:if> value="待业">待业</option>
					      </select>
					      </div>
					     </div>
					      <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>英语级别：</label> 
					       <select name="senglishlevel">
					      		<option <c:if test="${stumanage_one.senglishlevel == '4级'}">selected="selected"</c:if> value="4级">4级</option>
					      		<option <c:if test="${stumanage_one.senglishlevel == '6级'}">selected="selected"</c:if> value="6级">6级</option>
					      		<option <c:if test="${stumanage_one.senglishlevel == '专四'}">selected="selected"</c:if> value="专四">专四</option>
					      		<option <c:if test="${stumanage_one.senglishlevel == '专八'}">selected="selected"</c:if> value="专八">专八</option>
					      		<option <c:if test="${stumanage_one.senglishlevel == '无'}">selected="selected"</c:if> value="无">无</option>
					      	</select>
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					       <label>工作经历：</label> 
					       	<c:choose>
					       		<c:when test="${stumanage_one.sworkingexperience ==1 }">
					       		<span><input type="radio" name="sworkingexperience" checked="checked" value="1">有软件开发经验</span>
					      		<span><input type="radio" name="sworkingexperience" value="0">无软件开发经验</span>
					       		</c:when>
					       		<c:otherwise>
					       		<span><input type="radio" name="sworkingexperience"  value="1">有软件开发经验</span>
					      		<span><input type="radio" name="sworkingexperience" checked="checked" value="0">无软件开发经验</span>
					       		</c:otherwise>
					       	</c:choose>
					      	
					      </div>
					      </div>
					      <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <c:if test="${! empty stumanage_one.schoolprincipal}">
					       <label>学校负责人：</label> 
					       <input type="text" name="schoolprincipal" value="${stumanage_one.schoolprincipal}">
					       </c:if>
					      	
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <c:if test="${! empty stumanage_one.sptel }">
					       	<label>负责人电话：</label> 
					      	<input type="text" name="sptel"  value="${stumanage_one.sptel}">
					       </c:if>
					      </div>
					     </div>
					      <div class="form-group">
					      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					       <label>其他家庭成员：</label> 
					       <input id="fq" <c:if test="${fn:contains(stumanage_one.family, '父亲')}">checked="checked"</c:if> type="checkbox" name="family" value="父亲"><label for="fq">父亲</label>&nbsp;&nbsp;
					       <input id="mq" <c:if test="${fn:contains(stumanage_one.family, '母亲')}">checked="checked"</c:if> type="checkbox" name="family" value="母亲"><label for="mq">母亲</label>&nbsp;&nbsp;
					       <input id="jj" <c:if test="${fn:contains(stumanage_one.family, '姐姐')}">checked="checked"</c:if> type="checkbox" name="family" value="姐姐"><label for="jj">姐姐</label>&nbsp;&nbsp;
					       <input id="mm"<c:if test="${fn:contains(stumanage_one.family, '妹妹')}">checked="checked"</c:if> type="checkbox" name="family" value="妹妹"><label for="mm">妹妹</label>&nbsp;&nbsp;
					       <input id="gg"<c:if test="${fn:contains(stumanage_one.family, '哥哥')}">checked="checked"</c:if> type="checkbox" name="family" value="哥哥"><label for="gg">哥哥</label>&nbsp;&nbsp;
					       <input id="dd"<c:if test="${fn:contains(stumanage_one.family, '弟弟')}">checked="checked"</c:if> type="checkbox" name="family" value="弟弟"><label for="dd">弟弟</label>&nbsp;&nbsp;
					      </div>
					     </div>
					      <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>父母社会背景：</label> 
					      	<select name="solcialbackground">
					      		<option value="务农" <c:if test="${stumanage_one.solcialbackground == '务农'}">selected="selected"</c:if>>务农</option>
					      		<option value="经商" <c:if test="${stumanage_one.solcialbackground == '经商'}">selected="selected"</c:if>>经商</option>
					      		<option value="个体" <c:if test="${stumanage_one.solcialbackground == '个体'}">selected="selected"</c:if>>个体</option>
					      		<option value="教师" <c:if test="${stumanage_one.solcialbackground == '教师'}">selected="selected"</c:if>>教师</option>
					      		<option value="公务员" <c:if test="${stumanage_one.solcialbackground == '公务员'}">selected="selected"</c:if>>公务员</option>
					      		<option value="工人" <c:if test="${stumanage_one.solcialbackground == '工人'}">selected="selected"</c:if>>工人</option>
					      		<option value="退休" <c:if test="${stumanage_one.solcialbackground == '退休'}">selected="selected"</c:if>>退休</option>
					      		<option value="无业" <c:if test="${stumanage_one.solcialbackground == '无业'}">selected="selected"</c:if>>无业</option>
					      		<option value="其他" <c:if test="${stumanage_one.solcialbackground == '其他'}">selected="selected"</c:if>>其他</option>
					      	</select>
					      </div>
					     </div>
					      <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>学习过哪些编程语言：</label> 
					      	<select name="slanguage">
					      		<c:forEach items="${langusges }" var="langusge">
					      			<c:choose>
					      				<c:when test="${stumanage_one.slanguage == langusge.lid }"> 
					      				<option value="${langusge.lid }" selected="selected">${langusge.lname }</option>
						      			</c:when>
						      			<c:otherwise>
						      			<option value="${langusge.lid }">${langusge.lname }</option>
						      			</c:otherwise>
					      			</c:choose>
					      		</c:forEach>
					      	</select>
					      </div>
					      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					       <label>意向就业城市：</label> 
					      	<select name="sjobcity">
					      		<c:forEach items="${citys }" var="city">
					      			<c:choose>
					      				<c:when test="${stumanage_one.sjobcity == city.lid}"> 
					      				<option value="${city.lid }" selected="selected">${city.lname }</option>
						      			</c:when>
						      			<c:otherwise>
						      			<option value="${city.lid }">${city.lname }</option>
						      			</c:otherwise>
					      			</c:choose>
					      		</c:forEach>
					      	</select>
					      </div>
					     </div>
					    <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>是否中软学员介绍：</label> 
					       <c:choose>
					       	<c:when test="${stumanage_one.sintroduce } ==1"></c:when>
					       	<c:otherwise>
					       	<input type="radio" name="sintroduce" value="1">是
					       	<input type="radio" name="sintroduce" checked="checked" value="0">否
					       	</c:otherwise>
					       </c:choose>
					       
					     </div>
					      <!-- <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>缴费方式：</label> 
					       <select name="spayment">
					       	<option value="现金">现金</option>
					       	<option value="转账">转账</option>
					       	<option value="支票">支票</option>
					       	<option value="贷款">贷款</option>
					       </select>
					     </div> -->
					     </div>
					    <%-- <div class="form-group">
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>后续费用情况：</label> 
					       <input type="text" name="slatecharges" value="${stumanage_one.slatecharges}">
					     </div>
					      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
					       <label>预报名费：</label> 
					       <input type="text" name="sentryfee" value="${stumanage_one.sentryfee}">
					     </div>
					     </div> --%>
					     <div class="col-md-2 col-md-offset-3">
					     	 <button type="submit" class="btn btn-success ">确定</button>
					     </div>
					</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
     <%@ include file="../public/footer.jsp" %>
  </body>
</html>
					       