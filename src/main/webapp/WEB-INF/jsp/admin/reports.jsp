<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reports.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
	<!-- 引入 ECharts 文件 -->
	<script type="text/javascript" src="<%=basePath%>js/echarts.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js" ></script>
  </head>
  	
  <body>
  	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>报表</strong>
		</div>
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
			<ul class="slides">
			    <input type="radio" name="radio-btn" id="img-1" checked />
			    <li class="slide-container">
					<div class="slide">
					  	<table cellpadding="10" cellspacing="10"  >
					  		<tr>
					  			<td width="40px"></td>
					  			<td><div id="typeRanking" style="width: 450px;height:500px;"></div></td>
					  			<td width="60px">
					  			<td><div id="Percentage" style="width: 450px;height:500px;"></div></td>
					  		</tr>
					  	</table>
			        </div>
					<div class="nav">
						<label for="img-5" class="prev">&#x2039;</label>
						<label for="img-2" class="next">&#x203a;</label>
					</div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-2" />
			    <li class="slide-container">
			        <div class="slide">
			          <table cellpadding="10" cellspacing="10"  >
					  		<tr>
					  			<td width="40px"></td>
					  			<td><div id="deptBar" style="width: 450px;height:500px;"></div></td>
					  			<td width="60px">
					  			<td><div id="deptPie" style="width: 450px;height:500px;"></div></td>
					  		</tr>
					  	</table>
			        </div>
					<div class="nav">
						<label for="img-1" class="prev">&#x2039;</label>
						<label for="img-3" class="next">&#x203a;</label>
					</div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-3" />
			    <li class="slide-container">
			        <div class="slide">
			          <table cellpadding="10" cellspacing="10"  >
					  		<tr>
					  			<td width="40px"></td>
					  			<td><div id="areaBar" style="width: 450px;height:500px;"></div></td>
					  			<td width="60px">
					  			<td><div id="areaPie" style="width: 450px;height:500px;"></div></td>
					  		</tr>
					  	</table>
			        </div>
					<div class="nav">
						<label for="img-2" class="prev">&#x2039;</label>
						<label for="img-4" class="next">&#x203a;</label>
					</div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-4" />
			    <li class="slide-container">
			        <div class="slide">
			          <table cellpadding="10" cellspacing="10"  >
					  		<tr>
					  			<td width="100px"></td>
					  			<td><div id="monthLine" style="width: 800px;height:500px;"></div></td>
					  		</tr>
					  	</table>
			        </div>
					<div class="nav">
						<label for="img-3" class="prev">&#x2039;</label>
						<label for="img-5" class="next">&#x203a;</label>
					</div>
			    </li>
								
			
				<input type="radio" name="radio-btn" id="img-5" />
			    <li class="slide-container">
			        <div class="slide">
			          <table cellpadding="10" cellspacing="10"  >
					  		<tr>
					  			<td width="100px">
					  			<td><div id="monthTyprBar" style="width: 980px;height:500px;"></div></td>
					  		</tr>
					  	</table>
			        </div>
					<div class="nav">
						<label for="img-4" class="prev">&#x2039;</label>
						<label for="img-1" class="next">&#x203a;</label>
					</div>
			    </li>
			    <li class="nav-dots">
			      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
			      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
			      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
			      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
			      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
			    </li>
			   </ul>
		</div>
    	<script type="text/javascript">
    		var typelist = <%=session.getAttribute("typelist") %>
    		var deptlist = <%=session.getAttribute("deptlist") %>
    		var arealist = <%=session.getAttribute("arealist") %>
    		var monthlist = <%=session.getAttribute("monthlist") %>
    		var monthtypelist = <%=session.getAttribute("monthtypelist") %>
    	</script>
    </div>
    <script type="text/javascript" src="<%=basePath%>myjs/reports.js"></script>
  </body>
</html>
