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
	
	<title>ETC-修改客户信息</title>
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
	<script type="text/javascript">
		$(function () {  
		    $('.datetimepicker').datetimepicker({  
		        format: 'YYYY-MM-DD',  
		        locale: moment.locale('zh-cn')  
		    });  
		});
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
				<h2>修改客户信息</h2>
				<div class="panel panel-info panel-body">
					<p></p>
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
				                <input type='text' name="cdgraduationtime" class="form-control input-sm" required value="${customer.cdgraduationtime }"/>  
				                <span class="input-group-addon input-sm">  
				                    <span class="glyphicon glyphicon-calendar"></span>  
				                </span>  
				            </div>
					        <%-- <input type="text" name="cdgraduationtime" id="cdgraduationtime" requried value="${customer.cdgraduationtime }"> --%>
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
				                <input type='text' name="cddate" class="form-control input-sm" required value="${customer.cddate }"/>  
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
<div class="modal fade" id="mycdsalary" role="dialog">  
           <div class="modal-dialog">  
               <div class="modal-content">  
                   <div class="modal-header">  
                       <button type="button" class="close" data-dismiss="modal">  
                           <span>×</span>  
                       </button>  
                       <h3 class="modal-title">期望薪资</h3>  
                   </div>  
                   <div class="modal-body">  
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
											      