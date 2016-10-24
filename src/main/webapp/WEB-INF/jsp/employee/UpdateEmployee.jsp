<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改员工信息</title>
<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/add_stu.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/add_stu.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/manager.js"></script>

</head>
<body>
	<div id="dcMain">
			<div id="urHere">
				长沙ETC客户关系管理中心<b>></b><strong>员工管理</strong>
			</div>
			<div class="mainBox"
				style="height:auto!important;height:550px;min-height:550px;">
				<h3>修改员工信息</h3>
				<form action="../emp/updataemoinfo.do" method="post" >
				<input type="hidden" name="eid" value="${EmpInfo.eid }">
				<table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
					<tr>
	 					<td>员工姓名:</td>
	 					<td>${EmpInfo.ename }</td>
	 					<td>性别:</td>
	 					<td>${EmpInfo.esex}</td>
	 				</tr>
	 				<tr>
	 					<td>所属部门:</td>
	 					<td>
		 					<select name="did" id="deptselect" onchange="supera()">
		 					<c:forEach var="dept" items="${deptinfo }">
			 					<c:choose>
			 						<c:when test="${dept.did eq EmpInfo.did }"> 
			 							<option selected value="${dept.did}">  ${dept.dName }</option>
			 						</c:when>
			 						<c:otherwise>
			 							<option value="${dept.did}"> ${dept.dName }</option>
			 						</c:otherwise>
			 					</c:choose>
		 					</c:forEach>
		 					</select>
		 				</td>
		 				<td>直属上级：</td>
	 					<td>
	 						<select name="superiorid" id="superio" >
	 							<option value="${empsuper.eid }"> ${empsuper.ename }</option>
	 						</select>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>入职时间:</td>
	 					<td><input value="${EmpInfo.entrytime }" type="text" name="entrytime" id="datePicker" class="date_picker" placeholder="点击选择日期" /></td>
	 					<td>卡号:</td>
	 					<td><input value="${EmpInfo.ecard }" type="text" name="ecard" id="ecard" maxlength="21" onkeyup="" required autofocus /></td>
	 				</tr>
	 				<tr>
	 					<td>联系电话:</td>
	 					<td><input value="${EmpInfo.etel }" type="text" name="etel" id="etel" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" required autofocus /></td>
	 					<td>工作邮箱:</td>
	 					<td><input value="${EmpInfo.email }" type="text" name="email" id="email" maxlength="20" required autofocus /></td>
	 				</tr>
	 				<tr>
	 				</tr>
	 				<tr>
	 					<td>身份证号码:</td>
	 					<td><input value="${EmpInfo.ecardid }" type="text" name="ecardid" maxlength="18" id="ecardid" required autofocus /></td>
	 					<td>生日:</td>
	 					<td><input value="${EmpInfo.ebrithday }" type="text" name="ebrithday" id="ebrithday" maxlength="11" onkeyup="" required autofocus /></td>
	 				</tr>
	 				<tr>
	 					<td>职务:</td>
	 					<td><input value="${EmpInfo.ejob }" type="text" name="ejob" maxlength="18" id="ejob" required autofocus /></td>
	 					<td>婚姻:</td>
	 					<td><input value="${EmpInfo.emariage }" type="text" name="emariage" maxlength="18" id="emariage" required autofocus /></td>
	 				</tr>
	 			
	 				<tr>
	 					<td>住址:</td>
	 					<td><input value="${EmpInfo.eaddress }" type="text" name="eaddress" id="address"  autofocus /></td>
	 					<td>学历:</td>
	 					<td><input value="${EmpInfo.education }" type="text" name="education" id="education" required autofocus /></td>
	 				</tr>
				</table>
				<table width="100%" border="0" cellpadding="8" cellspacing="0"
				class="tableBasic">
					<tr>
						<td>
							<input name="submit" class="btn" type="submit" value="确定" />
						</td>
					</tr>
				</table>
			</form>
			</div>
	</div>


</body>
</html>