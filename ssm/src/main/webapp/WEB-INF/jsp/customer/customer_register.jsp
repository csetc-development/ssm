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
	
	<title>ETC-客户登记</title>
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
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.datetimepicker').datetimepicker({  
		        format: 'YYYY-MM-DD',  
		        locale: moment.locale('zh-cn')  
		    });
		})
	</script>
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
					<li><a href="<%=basePath%>empinfo/showMe.do"><i
							class="manager"></i>个人中心</a></li>
<!-- 					<li><a href="<%=basePath%>admin/manager.do"><i -->
<!-- 							class="manager"></i>管理员</a></li> -->
<!-- 					<li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2>应聘人员登记</h2>
				<div class="text-right">
					<a href="<%=basePath%>customer/doorcustomer.do?crid=${customer.crid }"><span class="glyphicon glyphicon-ok"></span>确定为上门客户</a>
				</div>
				
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">基本信息</h3>
					</div>
				  	<div class="panel-body">
						<div id="editbasicinfo" class="container">
							<div class="row">
								<div class="col-md-9">
									<h4><a id="editbasicinfo"><span class="glyphicon glyphicon-pencil"></span>编辑</a></h4>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1 col-md-offset-1"> 姓名： </div>
								<div class="col-md-1 "> ${customer.crname}</div>
								<div class="col-md-1"> 性别： </div>
								<div class="col-md-1 "> ${customer.crsex} </div>
							</div>
							<div class="row">
								<div class="col-md-1 col-md-offset-1"> 籍贯： </div>
								<div class="col-md-1 "> ${customer.cdhometown} </div>
								<div class="col-md-1"> 民族： </div>
								<div class="col-md-1 "> ${customer.cdnation} </div>
							</div>
							<div class="row">
								<div class="col-md-1 col-md-offset-1"> 学历： </div>
								<div class="col-md-1 "> ${customer.cdeducation} </div>
								<div class="col-md-1"> 专业： </div>
								<div class="col-md-2 "> ${customer.crmajor} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 毕业院校： </div>
								<div class="col-md-3 "> ${customer.crschool} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 毕业时间： </div>
								<div class="col-md-3 "> ${customer.cdgraduationtime} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 身份证号码： </div>
								<div class="col-md-3 "> ${customer.cdcaidid} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 手机： </div>
								<div class="col-md-3 "> ${customer.crtel} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 政治面貌： </div>
								<div class="col-md-2 "> ${customer.cdlandscape} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 子女状况： </div>
								<div class="col-md-3 "> ${customer.cdchildren} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 应聘职位： </div>
								<div class="col-md-2 "> ${customer.cdwork} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 期望薪资： </div>
								<div class="col-md-3 "> ${customer.cdsalary} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 户口地址： </div>
								<div class="col-md-3 "> ${customer.cdaccountaddress} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 现住址： </div>
								<div class="col-md-3 "> ${customer.cdpresentaddress} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 应聘日期： </div>
								<div class="col-md-2 "> ${customer.cddate} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 到岗时间： </div>
								<div class="col-md-3 "> ${customer.cdtimeline} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 信息来源： </div>
								<div class="col-md-3 "> ${customer.cdinformationsources} </div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-1"> 公司熟人： </div>
								<div class="col-md-3 "> ${customer.acquaintance} </div>
							</div>
						</div>
						<div id="basicform">
					 <form class="form-horizontal" action="<%=basePath%>customer/basicinfo.do" method="post">
						<input type="hidden" name="crid" value="${customer.crid }">
						<div class="form-group">
					      <label for="crname" class="col-md-2 control-label">姓名</label>
					      <div class="col-md-2">
					        <input name="crname" type="text" id="crname" value="${customer.crname}">
					      </div>
					      <label  class="col-md-2 control-label">性别</label>
					      <div class="col-md-2">
					      <c:choose>
						      <c:when test="${customer.crsex =='男'}">
						      	<input name="crsex" checked="checked" value="男" id="cuswomen" type="radio"><label for="cuswomen">男</label>
						      	<input name="crsex" id="cusmen" value="女" type="radio"><label for="cusmen">女</label>
						      </c:when>
						      <c:otherwise>
						      	<input name="crsex" id="cuswomen" value="男" type="radio"><label for="cuswomen">男</label>
						        <input name="crsex" checked="checked" id="cusmen" value="女" type="radio"><label for="cusmen">女</label>
						      </c:otherwise>
					      </c:choose>
					      </div>
					    </div>
						<div class="form-group">
					      <label for="cdhometown" class="col-md-2 control-label">籍贯</label>
					      <div class="col-md-2">
					      	<input type="text" id="cdhometown" name="cdhometown" data-toggle="modal" data-target="#mycdhometown" value="${customer.cdhometown }">
					      </div>
					      <label for="cdnation" class="col-md-2 control-label">民族</label>
					      <div class="col-md-2">
					        <input type="text" id="cdnation" name="cdnation" data-toggle="modal" data-target="#mycdnation" value="${customer.cdnation }" >
					      </div>
					    </div>
						<div class="form-group">
					      <label for="cdeducation" class="col-md-2 control-label">学历</label>
					      <div class="col-md-2">
					        <input type="text" id="cdeducation" name="cdeducation" data-toggle="modal" data-target="#mycdeducation" value="${customer.cdeducation }">
					      </div>
					      <label for="crmajor" class="col-md-2 control-label">专业</label>
					      <div class="col-md-2">
					        <input type="text" id="crmajor" name="crmajor" value="${customer.crmajor}" >
					      </div>
					    </div>
						<div class="form-group">
					      <label for="crschool" class="col-md-2 control-label">毕业院校</label>
					      <div class="col-md-2">
					        <input type="text" name="crschool" id="crschool" value="${customer.crschool}" requried>
					      </div>
					      <label for="cdgraduationtime" class="col-md-2 control-label">毕业时间</label>
					      <div class="col-md-2">
					      	<div class='input-group date datetimepicker'>  
				                <input type='text' name="cdgraduationtime" class="form-control input-sm"  id="cdgraduationtime" requried value="${customer.cdgraduationtime }"/>  
				                <span class="input-group-addon input-sm">  
				                    <span class="glyphicon glyphicon-calendar"></span>  
				                </span>  
				            </div>
					       <%--  <input type="text" name="cdgraduationtime" id="cdgraduationtime" requried value="${customer.cdgraduationtime }"> --%>
					      </div>
					    </div>
						<div class="form-group">
					      <label for="cdcaidid" class="col-md-2 control-label">身份证</label>
					      <div class="col-md-2">
					        <input type="text" name="cdcaidid" id="cdcaidid" value="${customer.cdcaidid }" requried>
					      </div>
					      <label for="crtel" class="col-md-2 control-label">手机</label>
					      <div class="col-md-2">
					        <input type="text" name="crtel" id="crtel" value="${customer.crtel }" requried>
					      </div>
					    </div>
						<div class="form-group">
					      <label for="cdlandscape" class="col-md-2 control-label">政治面貌</label>
					      <div class="col-md-2">
					      	<input type="text" id="cdlandscape" name="cdlandscape" data-toggle="modal" data-target="#mycdlandscape" value="${customer.cdlandscape }">
					      </div>
					      <label for="cdchildren" class="col-md-2 control-label">子女状况</label>
					      <div class="col-md-2">
					      	<input type="text" value="${customer.cdchildren }"  data-toggle="modal" data-target="#mycdchildren"  name="cdchildren" id="cdchildren" >
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="inputEmail" class="col-md-2 control-label">应聘职位</label>
					      <div class="col-md-2">
					      	<input type="text" value="${customer.cdwork }" requried data-toggle="modal" data-target="#mycdwork"  name="cdwork" id="cdwork" >
					      </div>
					      <label for="inputPassword" class="col-md-2 control-label">期望薪资</label>
					      <div class="col-md-2">
					      <input type="text" value="${customer.cdsalary}" requried data-toggle="modal" data-target="#mycdsalary"  name="cdsalary" id="cdsalary" >
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="cdaccountaddress" class="col-md-2 control-label">户口地址</label>
					      <div class="col-md-2">
					        <textarea  name="cdaccountaddress" id="cdaccountaddress">${customer.cdaccountaddress }</textarea>
					      </div>
					      <label for="cdpresentaddress" class="col-md-2 control-label">现住址</label>
					      <div class="col-md-2">
					        <textarea name="cdpresentaddress" id="cdpresentaddress">${customer.cdpresentaddress }</textarea>
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="cddate" class="col-md-2 control-label" >应聘日期</label>
					      <div class="col-md-2">
					      	<div class='input-group date datetimepicker'>  
				                <input type='text' name="cddate" class="form-control input-sm"  id="cdgraduationtime" requried value="${customer.cddate }"/>  
				                <span class="input-group-addon input-sm">  
				                    <span class="glyphicon glyphicon-calendar"></span>  
				                </span>  
				            </div>
					        <%-- <input type="text" name="cddate" id="cddate" requried value="${customer.cddate }"> --%>
					      </div>
					      <label for="cdtimeline" class="col-md-2 control-label">到岗时间</label>
					      <div class="col-md-2">
					        <input type="text" name="cdtimeline" id="cdtimeline" value="${customer.cdtimeline }">
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="cdinformationsources" class="col-md-2 control-label">信息来源</label>
					      <div class="col-md-1">
					         <select id="cdinformationsources" name="cdinformationsources">
					          <option value="招聘网站">招聘网站</option>
					          <option value="报纸">报纸</option>
					          <option value="朋友介绍">朋友介绍</option>
					          <option value="内部推荐">内部推荐</option>
					          <option value="其他">其他</option>
					        </select>
					      </div>
					      <label for="select" class="col-md-2 control-label">在我们公司是否有熟人</label>
					      <div class="col-md-2">
					      	<input type="radio" name="acquaintanceradio" id="no" checked="checked"><label for="no" >否</label> 
					        <input type="radio" name="acquaintanceradio" id="yes"><label for="yes">是</label>
					      </div>
					      <div id="acquaintance">
					      	  <label for="select" class="col-md-1 control-label">姓名</label>
						      <div class="col-md-2">
						        <input type="text" name="acquaintance">
						  	  </div>
					      </div>
					    </div>
					    <div class="col-md-2 col-md-offset-3">
					        <button type="submit" class="btn btn-success btn-block">保存</button>
					    </div>
					  </form>
					</div>
				  	</div>
				</div>
				
				
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">工作经历 </h3>
					</div>
					<div class="panel-body">
						<div class="container" id="workinfo">
							<div class="row">
								<div class="col-md-9">
								<c:if test="${empty experiencelist }">
									<div class="col-md-2 text-danger"><strong>没有工作经历</strong></div>
								</c:if>
								<c:if test="${!empty experiencelist }">
										<c:forEach var="experience" items="${experiencelist }" varStatus="status">
										<div id="oneworkinfo${status.count }" onmouseover="showedit(${status.count})" onmouseout="hideedit(${status.count})">
											<div class="row">
												<div class="col-md-2" id="${status.count}">
													<a onclick="updatework(${status.count})"><span class="glyphicon glyphicon-pencil"></span>修改</a> &nbsp;&nbsp;
													<a onclick="return deletework()" href="customer/deleteworkexperience.do?weid=${experience.weid}&crid=${customer.crid}"><span class="glyphicon glyphicon-trash"></span>删除</a>	
												</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">起止时间：</div>
												<div class="col-md-4">${experience.westartime } - ${experience.wendtime }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">公司名称：</div>
												<div class="col-md-4">${experience.wecompanyname }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">薪金：</div>
												<div class="col-md-4">${experience.wesalary }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">证明人：</div>
												<div class="col-md-4">${experience.wewitness }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">电话：</div>
												<div class="col-md-4">${experience.wetel }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">离职原因：</div>
												<div class="col-md-4">${experience.weleavresons }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">所属行业：</div>
												<div class="col-md-4">${experience.weindustry }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">部门：</div>
												<div class="col-md-4">${experience.wedepartment }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">职务：</div>
												<div class="col-md-4">${experience.wepost }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">汇报对象：</div>
												<div class="col-md-4">${experience.weobject }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right">下属人数：</div>
												<div class="col-md-4">${experience.wepersonumber }</div>
											</div>
											<div class="row">
												<div class="col-md-3 text-right"> 工作职责：</div>
												<div class="col-md-4"> ${experience.weworkcontent }</div>
											</div>
										</div>
										<hr>
										<div id="updatework${status.count }">
											<form class="form-horizontal" action="customer/updateworkexperience.do" method="post">
												<input type="hidden" name="crid" value="${customer.crid }">
												<input type="hidden" name="weid" value="${experience.weid }">
											    <div class="form-group">
											      <label for="uwestartime" class="col-md-2 control-label">起止时间</label>
											      <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
											      	<div class='input-group date datetimepicker'>  
										                <input type='text' name="westartime" class="form-control input-sm"  id="cdgraduationtime" requried value="${experience.westartime }"/>  
										                <span class="input-group-addon input-sm">  
										                    <span class="glyphicon glyphicon-calendar"></span>  
										                </span>  
										            </div>
											        <%-- <input type="text" name="westartime" id="uwestartime" value="${experience.westartime }"> --%>
											      </div>
											      <label for="uwendtime" class="col-md-1 control-label">到</label>
											      <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
											      	<div class='input-group date datetimepicker'>  
										                <input type='text' name="wendtime" class="form-control input-sm"  id="cdgraduationtime" requried value="${experience.wendtime }"/>  
										                <span class="input-group-addon input-sm">  
										                    <span class="glyphicon glyphicon-calendar"></span>  
										                </span>  
										            </div>
											        <%-- <input type="text" name="wendtime" id="uwendtime" value="${experience.wendtime }"> --%>
											      </div>
											    </div>
												<div class="form-group">
											      <label for="wecompanyname" class="col-md-2 control-label">公司名称</label>
											      <div class="col-md-2"> 
											        <input type="text" name="wecompanyname" id="wecompanyname" value="${experience.wecompanyname }">
											      </div>
											      <label for="wesalary" class="col-md-2 control-label">薪金</label>
											      <div class="col-md-2">
											        <input type="text" name="wesalary" id="wesalary" value="${experience.wesalary }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="wewitness" class="col-md-2 control-label">证明人</label>
											      <div class="col-md-2">
											        <input type="text" name="wewitness" id="wewitness" value="${experience.wewitness }">
											      </div>
											      <label for="wetel" class="col-md-2 control-label">电话</label>
											      <div class="col-md-2">
											        <input type="text" name="wetel" id="wetel" value="${experience.wetel }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="weindustry" class="col-md-2 control-label">所属行业</label>
											      <div class="col-md-2">
											        <input type="text" name="weindustry" id="weindustry" value="${experience.weindustry }">
											      </div>
											      <label for="wedepartment" class="col-md-2 control-label">部门</label>
											      <div class="col-md-2">
											        <input type="text" name="wedepartment" id="wedepartment" value="${experience.wedepartment }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="wepost" class="col-md-2 control-label">职务</label>
											      <div class="col-md-2">
											        <input type="text" name="wepost" id="wepost" value="${experience.wepost }">
											      </div>
											      <label for="weobject" class="col-md-2 control-label">汇报对象</label>
											      <div class="col-md-2">
											        <input type="text" name="weobject" id="weobject" value="${experience.weobject }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="wepersonumber" class="col-md-2 control-label">下属人数</label>
											      <div class="col-md-2">
											        <input type="text" name="wepersonumber" id="wepersonumber" value="${experience.wepersonumber }">
											      </div>
											      <label for="weleavresons" class="col-md-2 control-label">离职原因</label>
											      <div class="col-md-2">
											        <input type="text" name="weleavresons" id="weleavresons" value="${experience.weleavresons }">
											      </div>
											    </div>
											    <div class="form-group">
											      <label for="weworkcontent" class="col-md-2 control-label">工作职责</label>
											      <div class="col-md-2">
											       	<textarea id="weworkcontent" name="weworkcontent" rows="3">${experience.weworkcontent }</textarea>
											      </div>
											      <div class="col-md-2 col-md-offset-3">
											        <button type="submit" class="btn btn-success btn-block">保存</button>
											      </div>
											    </div>
											  </form>
										</div>
										</c:forEach>
								</c:if>
								<a id="showworkexperience"><span class="glyphicon glyphicon-plus"></span>新增</a>
								</div>
							</div>
						</div>
						<div id="workexperienceform">
							<form class="form-horizontal" action="customer/addexperience.do" method="post">
								<input type="hidden" name="crid" value="${customer.crid }">
								<div class="form-group">
							      <label for="uwestartime" class="col-md-2 control-label">起止时间</label>
							      <div class="col-md-2">
							      	<div class='input-group date datetimepicker'>  
						                <input type='text' name="westartime" class="form-control input-sm"  id="cdgraduationtime" requried />  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
							        <!-- <input type="text" name="westartime" id="uwestartime"> -->
							      </div>
							      <label for="uwendtime" class="col-md-2 control-label">到</label>
							      <div class="col-md-2">
							      	<div class='input-group date datetimepicker'>  
						                <input type='text' name="wendtime" class="form-control input-sm"  id="cdgraduationtime" requried value="${experience.westartime }"/>  
						                <span class="input-group-addon input-sm">  
						                    <span class="glyphicon glyphicon-calendar"></span>  
						                </span>  
						            </div>
							        <!-- <input type="text" name="wendtime" id="uwendtime"> -->
							      </div>
							    </div>
								<div class="form-group">
							      <label for="uwecompanyname" class="col-md-2 control-label">公司名称</label>
							      <div class="col-md-2">
							        <input type="text" name="wecompanyname" id="uwecompanyname">
							      </div>
							      <label for="uwesalary" class="col-md-2 control-label">薪金</label>
							      <div class="col-md-2">
							        <input type="text" name="wesalary" id="uwesalary">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="uwewitness" class="col-md-2 control-label">证明人</label>
							      <div class="col-md-2">
							        <input type="text" name="wewitness" id="uwewitness">
							      </div>
							      <label for="uwetel" class="col-md-2 control-label">电话</label>
							      <div class="col-md-2">
							        <input type="text" name="wetel" id="uwetel">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="uweindustry" class="col-md-2 control-label">所属行业</label>
							      <div class="col-md-2">
							        <input type="text" name="weindustry" id="uweindustry">
							      </div>
							      <label for="uwedepartment" class="col-md-2 control-label">部门</label>
							      <div class="col-md-2">
							        <input type="text" name="wedepartment" id="uwedepartment">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="uwepost" class="col-md-2 control-label">职务</label>
							      <div class="col-md-2">
							        <input type="text" name="wepost" id="uwepost">
							      </div>
							      <label for="uweobject" class="col-md-2 control-label">汇报对象</label>
							      <div class="col-md-2">
							        <input type="text" name="weobject" id="uweobject">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="uwepersonumber" class="col-md-2 control-label">下属人数</label>
							      <div class="col-md-2">
							        <input type="text" name="wepersonumber" id="uwepersonumber">
							      </div>
							      <label for="uweleavresons" class="col-md-2 control-label">离职原因</label>
							      <div class="col-md-2">
							        <input type="text" name="weleavresons" id="uweleavresons">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="uweworkcontent" class="col-md-2 control-label">工作职责</label>
							      <div class="col-md-2">
							       	<textarea id="uweworkcontent" name="weworkcontent" rows="3"></textarea>
							      </div>
							      <div class="col-md-1 col-md-offset-2">
							        <button type="button" class="btn btn-block" onclick="cancelwork()">取消</button>
							      </div>
							      <div class="col-md-1">
							        <button type="submit" class="btn btn-success btn-block" onclick="addexperience()">保存</button>
							      </div>
							    </div>
							  </form>
						</div>
					</div>
				</div>
			   	<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">社会关系（家庭）</h3>
					</div>
					<div class="panel-body">
						<div id="socialinfo" class="container">
							<div class="row">
								<div class="col-md-9">
								<c:if test="${empty sociallist }">
									<div class="col-md-2 text-danger"><strong>没有相关数据</strong></div>
								</c:if>
								<c:if test="${!empty sociallist }">
									<c:forEach var="social" items="${sociallist }" varStatus="sta">
										<div id="onesocialinfo${sta.count }" onmouseover="showsocialedit(${sta.count})" onmouseout="hidesocialedit(${sta.count})">
											<div class="row">
												<div class="col-md-2" id="social${sta.count}">
													<a onclick="updatesocial(${sta.count})"><span class="glyphicon glyphicon-pencil"></span>修改</a> &nbsp;&nbsp;
													<a onclick="return deletework()" href="customer/deletesocial.do?srid=${social.srid}&crid=${customer.crid}"><span class="glyphicon glyphicon-trash"></span>删除</a>	
												</div>
												</div>
												<div class="row">
													<div class="col-md-3 text-right">姓名：</div>
													<div class="col-md-4">${social.srname }</div>
												</div>
												<div class="row">
													<div class="col-md-3 text-right">关系：</div>
													<div class="col-md-4">${social.srelations }</div>
												</div>
												<div class="row">
													<div class="col-md-3 text-right">工作单位：</div>
													<div class="col-md-4">${social.srworkcompany }</div>
												</div>
												<div class="row">
													<div class="col-md-3 text-right">职务：</div>
													<div class="col-md-4">${social.srpost }</div>
												</div>
												<div class="row">
													<div class="col-md-3 text-right">电话：</div>
													<div class="col-md-4">${social.srtel }</div>
												</div>
										</div>
										<hr>
										<div id="updatesocial${sta.count}">
											<form class="form-horizontal" action="customer/updatesocial.do" method="post">
												<input type="hidden" name="crid" value="${customer.crid }">
												<input type="hidden" name="srid" value="${social.srid }">
												<div class="form-group">
											      <label for="srnameu" class="col-md-2 control-label">姓名</label>
											      <div class="col-md-2">
											        <input type="text" name="srname" id="srnameu" value="${social.srname }">
											      </div>
											      <label for="srelationsu" class="col-md-2 control-label">关系</label>
											      <div class="col-md-2">
											        <input type="text" name="srelations" id="srelationsu" value="${social.srelations }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="srworkcompanyu" class="col-md-2 control-label">工作单位</label>
											      <div class="col-md-2">
											        <input type="text" name="srworkcompany" id="srworkcompanyu" value="${social.srworkcompany }">
											      </div>
											       <label for="srpostu" class="col-md-2 control-label">职务</label>
											      <div class="col-md-2">
											        <input type="text" name="srpost" id="srpostu" value="${social.srpost }">
											      </div>
											    </div>
												<div class="form-group">
											      <label for="srtelu" class="col-md-2 control-label">电话</label>
											      <div class="col-md-2">
											        <input type="text" name="srtel" id="srtelu" value="${social.srtel }">
											      </div>
											      <div class="col-md-2 col-md-offset-3">
											        <button type="submit" class="btn btn-success btn-block">保存</button>
											      </div>
											    </div>
											 </form>
										</div>
									</c:forEach>
								</c:if>	
								<a id="showsocialrelations"><span class="glyphicon glyphicon-plus"></span>新增</a>
								</div>
							</div>
						
						</div>
						<div id="socialform">
							<form class="form-horizontal" action="customer/insertsocial.do" method="post">
								<input type="hidden" name="crid" value="${customer.crid }">
								<div class="form-group">
							      <label for="srname" class="col-md-2 control-label">姓名</label>
							      <div class="col-md-2">
							        <input type="text" name="srname" id="srname">
							      </div>
							      <label for="srelations" class="col-md-2 control-label">关系</label>
							      <div class="col-md-2">
							        <input type="text" name="srelations" id="srelations">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="srworkcompany" class="col-md-2 control-label">工作单位</label>
							      <div class="col-md-2">
							        <input type="text" name="srworkcompany" id="srworkcompany">
							      </div>
							       <label for="srpost" class="col-md-2 control-label">职务</label>
							      <div class="col-md-2">
							        <input type="text" name="srpost" id="srpost">
							      </div>
							    </div>
								<div class="form-group">
							      <label for="srtel" class="col-md-2 control-label">电话</label>
							      <div class="col-md-2">
							        <input type="text" name="srtel" id="srtel">
							      </div>
							      <div class="col-md-1 col-md-offset-2">
							        <button type="button" class="btn  btn-block" onclick="cancelsocial()">取消</button>
							      </div>
							      <div class="col-md-1 ">
							        <button type="submit" class="btn btn-success btn-block">保存</button>
							      </div>
							    </div>
							 </form>
						</div>
					 
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
<div class="modal fade" id="mycdhometown" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title" id="myModalLabel"> 籍贯   </h3>  
                   </div>  
                   <div class="modal-body">  
                       <select id="provinces"></select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div> 
<div class="modal fade" id="mycdnation" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">民族</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select id="national" name="cdnation"></select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div> 
<div class="modal fade" id="mycdeducation" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">学历</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select id="qualifications"></select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>
<div class="modal fade" id="mycdlandscape" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">政治面貌</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select id="politics"></select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>
<div class="modal fade" id="mycdchildren" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">子女状况</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select>
				          <option value="无">无</option>
				          <option value="一子">一子</option>
				          <option value="一女">一女</option>
				          <option value="一子一女">一子一女</option>
				          <option value="二子">二子</option>
				          <option value="二女">二女</option>
				          <option value="二子一女">二子一女</option>
				          <option value="二女一子">二女一子</option>
				          <option value="其他">其他</option>
				        </select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>
<div class="modal fade" id="mycdwork" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">应聘职位</h3>  
                   </div>  
                   <div class="modal-body">  
                       <select>
				          <option value="java开发工程师">java开发工程师</option>
				          <option value="Android程序员">Android程序员</option>
				          <option value="嵌入式开发程序员">嵌入式开发程序员</option>
				          <option value="web前端工程师">web前端工程师</option>
				          <option value="软件测试工程师">软件测试工程师</option>
				        </select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>
<div class="modal fade" id="mycdsalary">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">期望薪资</h3>  
                   </div>  
                   <div class="modal-body text-center">  
                       <select>
				          <option value="0-2k">0-2k</option>
				          <option value="2k-3k">2k-3k</option>
				          <option value="3k-4k">3k-4k</option>
				          <option value="4k-5k">4k-5k</option>
				          <option value="5k-6k">5k-6k</option>
				          <option value="6k-8k">6k-8k</option>
				          <option value="8k-10k">8k-10k</option>
				          <option value="10k-15k">10k-15k</option>
				          <option value="15k-20k">15k-20k</option>
				          <option value="20k以上">20k以上</option>
				        </select>
                   </div>  
                   <div class="modal-footer">  
                       <p align="center">  
                           <button type="button" class="btn btn-default" data-dismiss="modal">确定 </button>  
                       </p>  
                   </div>  
               </div>  
           </div>  
       </div>



	<%@ include file="../public/footer.jsp"%>
	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="<%=basePath %>js/sfmz.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	<script src="<%=basePath%>myjs/customer_register.js"></script>
  </body>
</html>
											      