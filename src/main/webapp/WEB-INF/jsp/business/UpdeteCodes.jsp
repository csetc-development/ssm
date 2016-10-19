<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=basePath %>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath %>css/add_stu.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/add_stu.js"></script>
<title>业务管理</title>
</head>
<body>
	<div id="dcMain">
   	<!-- 当前位置 -->
		<div id="urHere">长沙ETC客户关系管理中心<b>></b><strong>业务管理</strong></div>   
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
	    	<h3>修改签单信息</h3>
		   
	<div style="text-align: right; cursor: default; height: 20px;"></div>	
			<form  action="../paycode/updatebyid.do" method="post" id="fm"> 
					<input type="hidden" name="cid" value="${code.cid}">
					<table width="60%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" align="center">	
								<tr>
									<td>客户姓名</td>
									<td>
										${crname}
									</td>
								</tr>							
								<tr>
									<td>签单时间</td>
									<td>
										<input type="text" maxlength="30"  name="ctime" id="cstime" value="${code.ctime}" >
									</td>
								</tr>
								<tr>
									<td>销售</td>
									<td>
										<select name="sale">
											<c:forEach items="${allemp}" var="emp" >	
												<c:choose>
						 						<c:when test="${emp.eid eq code.sale }"> 
						 							<option selected value="${emp.eid}">${emp.ename}</option>
						 						</c:when>
						 						<c:otherwise>
				 									<option  value="${emp.eid}" >${emp.ename}</option>	
				 								</c:otherwise>
				 							</c:choose>							
											</c:forEach>	
										</select>																		
									</td>
								</tr>
								<tr>
									<td>签单类型</td>
									<td>
									<select name="ctype">
										<c:forEach items="${allbustype}" var="type" >
											<c:choose>
						 						<c:when test="${type.btid eq code.ctype }"> 
						 							<option selected value="${type.btid}">${type.btname}</option>
						 						</c:when>
						 						<c:otherwise>
				 									<option  value="${type.btid}" >${type.btname}</option>
				 								</c:otherwise>
				 							</c:choose>	
			 							</c:forEach>
									</select>
									</td>
								</tr>
								<tr>
									<td>签单区域</td>
									<td>
									<select name="carea" >
										<c:forEach items="${allareaname}" var="area" >
											<c:choose>
						 						<c:when test="${area.aid eq code.carea }"> 
						 							<option selected value="${area.aid}">${area.aname}</option>
						 						</c:when>
					 						<c:otherwise>
			 									<option value="${area.aid}">${area.aname}</option>	
			 								</c:otherwise>
			 								</c:choose>
										</c:forEach>	
									</select>
									
									</td>
								</tr>
								<tr>
									<td>应缴费</td>
									<td>
										<input type="text" name="creceivables" id="cpay" value="${code.creceivables}">
									</td>
								</tr>
							
								<tr>
									<td>备注</td>
									<td>
										<input type="text" name="remark" id="carea" value="${code.cremark}"  >
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="submit" class="btn" value="确定">
									</td>
							</tr>						 
					</table>
				</form>
			</div>		
		</div>
</body>
</html>