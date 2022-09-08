<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div class="adminSignup">

 <s:form action="user_registe" method="post"> 
<div id="adminLogin_top" class="adminLogin_top" >
<img src="image/shop/userone.png" width="154" height="100" />
</div>

<div id="adminSignup_center"   class="adminSignup_center">
<h3>
昵  称:&nbsp;&nbsp;<input type="text" name="userName"/><br><br>
密  码:&nbsp;&nbsp;<input type="password" name="userPassword"/><br><br>
学  校:&nbsp;&nbsp;<input type="text" name="userSchool"/><br><br>
头  像:&nbsp;&nbsp;<input type="file" name="upload"/><br><br>
手机号:&nbsp;&nbsp;<input type="text" name="userPhone"/><br><br>
收件人:&nbsp;&nbsp;<input type="text" name="userConsignee"/><br><br>
地  址:&nbsp;&nbsp;<input type="text" name="userAdress"/><br><br>
邮  编:&nbsp;&nbsp;<input type="text" name="userCode"/><br><br>
</h3>
<input name="agree" type="checkbox" value="">同意并阅读<a href="shop_jsp/user_XianYu.jsp">《咸鱼条款》</a><br>
<input type="submit" value="注册" />
</div>
</s:form>
</div>
  </body>
</html>
