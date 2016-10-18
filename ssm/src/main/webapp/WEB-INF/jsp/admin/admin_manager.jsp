<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_manager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href=" <%=basePath %>css/public.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.tab.js"></script>
	<script type="text/javascript" src="<%=basePath %>myjs/add_stu.js"></script>
	<script type="text/javascript" src="<%=basePath %>myjs/manager.js"></script>

  </head>
  	
  <body>
  	<input type="hidden" name="msg" id="msg" value="${msg }">
  	
  	<div id="dcMain">
		<div id="urHere">长沙ETC客户关系管理中心<b>></b><strong>管理员管理</strong></div> 
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
	    	<h3>管理员管理</h3>
		    <script type="text/javascript">
		     	$(function(){ 
		     		$(".idTabs").idTabs();
		     		
		     	});
		    </script>
			<div class="idTabs">
					<ul class="tab">
						<li>
							<a href="#add_sale" onclick="loadDepartmentInfo()">新增员工</a>
						</li>
						<li>
							<a href="#add_dept">新增部门</a>
						</li>
						<!-- <li>
							<a href="#add_user">添加角色</a>
						</li> -->
					</ul>
					<div class="add_sale">
						<form action="admin/add.do" method="post" onsubmit="return check_addSale()">
							<div id="add_sale">
								<table width="100%" border="0" cellpadding="8" cellspacing="0"
									class="tableBasic">
									<tr>
					 					<td>员工姓名:</td>
					 					<td><input type="text" name="ename" id="ename" maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9"/ required autofocus></td>
					 					<td>性别:</td>
					 					<td>
					 						<input type="radio" name="esex" id="pSex" value="男" checked="checked"/>男
					 						&nbsp;&nbsp;
					 						<input type="radio" name="esex" id="pSex" value="女" />女
					 					</td>
					 				</tr>

					 				<tr>
					 					<td>所属部门:</td>
					 					<td>
						 					<select name="did" id="pDepartment" onchange="superp()">
						 					</select>
						 				</td>
						 				<td>直属上级：</td>
					 					<td>
					 						<select name="superiorid" id="superiorid" >
					 							<option value="1">boss</option>
					 						</select>
					 					</td>
						 				
					 				</tr>

					 				<tr>
					 					<td>入职时间:</td>
					 					<td><input type="text" name="entrytime" id="datePicker" class="date_picker" placeholder="日期格式为2016-02-10" /></td>
					 					<td>卡号:</td>
					 					<td><input type="text" name="ecard" id="ecard" maxlength="21" onkeyup="" required autofocus /></td>
					 				</tr>

					 				<tr>
					 					<td>联系电话:</td>
					 					<td><input type="text" name="etel" id="etel" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" required autofocus /></td>
					 					<td>工作邮箱:</td>
					 					<td><input type="text" name="email" id="email" maxlength="20" required autofocus /></td>
					 				</tr>
					 				<tr>
					 				</tr>
					 				<tr>
					 					<td>身份证号码:</td>
					 					<td><input type="text" name="ecardid" maxlength="18" id="ecardid" required autofocus /></td>
					 					<td>生日:</td>
					 					<td><input type="text" name="ebrithday" id="ebrithday" maxlength="11" onkeyup="" required autofocus /></td>
					 				</tr>

					 				<tr>
					 					<td>职务:</td>
					 					<td><input type="text" name="ejob" maxlength="18" id="ejob" required autofocus /></td>
					 					<td>婚姻:</td>
					 					<td><input type="text" name="emariage" maxlength="18" id="emariage" required autofocus /></td>
					 				</tr>
					 			
					 				<tr>
					 					<td>住址:</td>
					 					<td><input type="text" name="address" maxlength="18" id="address"  autofocus /></td>
					 					<td>学历:</td>
					 					<td><input type="text" name="education" maxlength="18" id="education" required autofocus /></td>
					 				</tr>
								</table>
								<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
									<tr>
										<td><input type="hidden" name="token" value="24760807" />
											<input name="submit" class="btn" type="submit" value="确定" />
											<input name="cancle" class="btn" type="reset" value="取消" />
										</td>
									</tr>
								</table>
							</div>
						</form>
						<form action="dept/add.do" method="post" onsubmit="return check_addDept()">
							<div id="add_dept">
								<table width="100%" border="0" cellpadding="8" cellspacing="0"
									class="tableBasic">
									<tr>
										<td>部门名称</td>
										<td><input type="text" name="dName" id="dName" onfocus="checkDeptname()" maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9" required autofocus /></td>
									</tr>
									<tr>
										<td>部门地址</td>
										<td><input type="text" name="dAddress" id="dAddress" onfocus="checkDeptname()" maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9" required autofocus /></td>
									</tr>
									<tr>
										<td>部门描述</td>
										<td><textarea rows="4" cols="" name="dRemark" id="dRemark" onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9"></textarea></td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
									<tr>
										
										<td><input type="hidden" name="token" value="24760807" />
											<input name="submit" class="btn" type="submit" value="确定" />
											<input name="cancle" class="btn" type="reset" value="取消" />
										</td>
									</tr>
								</table>
							</div>
							</form>
							<!--<form action="sale/user.do" method="post" onsubmit="return checkPerName()">
							<div id="add_user">
								 <table width="100%" border="0" cellpadding="8" cellspacing="0"
									class="tableBasic">
									<tr>
										<td>姓名</td>
										<td><input type="text" name="name" id="name" required autofocus/></td>
									</tr>
									<tr>
										<td>密码</td>
										<td><input type="text" name="pwd" id="pwd" autofocus placeholder="初始密码为123456"/></td>
									</tr>
									<tr>
										<td>角色</td>
										<td>
											<input type="radio" name="role" value="1" checked="checked"/>销售
											&nbsp;&nbsp;
											<input type="radio" name="role" value="2" />经理
										</td>
									</tr>
								</table>
								<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
									<tr>
										
										<td><input type="hidden" name="token" value="24760807" />
											<input name="submit" class="btn" type="submit" value="确定" />
											<input name="cancle" class="btn" type="reset" value="取消" />
										</td>
									</tr>
								</table>
							</div>
						</form> -->
					</div>
				</div>
	  	</div>
  	</div>
  </body>
</html>