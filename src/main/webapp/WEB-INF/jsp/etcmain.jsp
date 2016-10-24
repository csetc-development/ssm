<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'etcmain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 
  <frameset rows="40px,*,15px" border=0>
	  <frame src="frame_top.jsp" noresize="noresize" />
	  <frameset cols="180px,*" >
	  	<frame src="frame_left.jsp" noresize="noresize" />
	  	<frame src="frame_main.jsp" noresize="noresize" name="main" scrolling="no"/>
	  </frameset>
	  <frame src="frame_foot.jsp" noresize="noresize" />
  </frameset>
</html>
