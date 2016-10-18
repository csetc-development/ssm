<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>员工管理</title>
<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath%>css/add_stu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pageGroup.css"/>

<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.tab.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/add_stu.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/manager.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/pageGroupByEmp.js"></script>

<script type="text/javascript">
	$(function() {
		$(".idTabs").idTabs();
	});
</script>

</head>
<body>
	<input type="hidden" id="pagecount" value="${pages}">
	<input type="hidden" id="part" value="${loginemp.eid }">
	<div id="dcMain">
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>员工管理</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>员工管理</h3>
			<div class="idTabs">
				<ul class="tab">
					<li><a href="#customer_info">员工信息</a></li>
					<li><a href="#customer_status">部门信息</a></li>
					<li><a href="#queryDiv">查询</a></li>
				</ul>
				<div class="customer_info">
					<div id="customer_info">
						<table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic" id="empInfo">
							<tr>
								<th>员工姓名</th>
								<th>入职时间</th>
								<th>员工部门</th>
								<th>员工职业</th>
								<th>员工手机</th>
								<th>员工邮箱</th>
								<th>直属上级</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${EmpInfo}" var="Emp" varStatus="status">
							<tr>
								<td>${Emp.ename }</td>
								<td>${Emp.entrytime }</td>
								<td>${Emp.dname }</td>
								<td>${Emp.ejob}</td>
								<td>${Emp.etel }</td>
								<td>${Emp.email }</td>
								<td>${Emp.dremark }</td>
								<td><a href="<%=basePath%>emp/selectByid.do?eid=${Emp.eid}" >修改</a>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					<div id="customer_status">
						<table align="center" width="100%" border="0" cellpadding="8"
							cellspacing="0" class="tableBasic" id="Departmentinfo">
							<tr>
								<th>部门编号</th>
								<th>部门名称</th>
								<th>部门描述</th>
								<th>部门备注</th>
								<th>操作</th>
							</tr>
							<tr>
								<c:forEach items="${Department}" var="Dep">
									<tr>
										<td>${Dep.did }</td>
										<td>${Dep.dName }</td>
										<td>${Dep.dAddress }</td>
										<td>${Dep.dRemark}</td>
										<td><a href="<%=basePath%>dept/selectByid.do?id=${Dep.did}">编辑</a>
										</td>
									</tr>
								</c:forEach>
							</tr>
						</table>
					</div>
					<div id="queryDiv">
						<table width="100%" border="0" cellpadding="8" cellspacing="0"
									class="tableBasic" id="selectemptable">
						</table>
						<div>
							<input type="text" id="textInput" placeholder="请输入员工姓名"><input type="button" class="btn" onclick="selectempinfo()" value="查询">
						</div>
				
					</div>
				</div>	
			</div>
			
			<!-- 分页显示 -->

			<div>
				<div id="pageGro" class="cb">
					<div class="pageUp">上一页</div>
					<div class="pageList">
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
						</ul>
					</div>
					<div class="pageDown">下一页</div>
				</div>
			</div>
			
		</div>
	</div>


</body>
</html>
