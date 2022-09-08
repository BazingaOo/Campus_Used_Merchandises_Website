<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改用户信息页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/shop/UserUpdate.css">
    <script src="js/jquery-1.6.2.js"></script>
    <script src="js/admin/admin_bianji/admin_bianji.js"></script>
  </head>
  
  <body>
   
   <div class="top">
    <div id="site-nav">
        <ul class="sn-quick-menu">
            <li><a href="shop_jsp/shop_HomePagelogin.jsp">首页</a></li>
            <li><a href="#">消息</a></li>
            <li><a href="#">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/user_findUser.action?finduserid=${sessionScope.loginuser.userId}">个人中心</a></li>
            <li><a href="#">欢迎您:${sessionScope.loginuser.userName}</a></li> 
            <li><a href="shop_jsp/shop_HomePage.jsp">退出登录</a></li>
        </ul>
  </div>
</div>
<div class="mid">
  <div class="cui_hd">
    <div class="ctriplogo"></div>
    <div class="ctripxiancai">咸菜</div>
    <div class="cui_search">
      <input type="text" placeholder="搜索" id="_allSearchKeyword" />
      <button type="button" id="search_button_global"></button>   
    </div>
    <div class="nav-shop"><a href="${pageContext.request.contextPath}/shop_findUpAllGood.action?findByuserid=${sessionScope.loginuser.userId}&goodState=yishangjia">
    <img src="image/shop/shoplogo.png" /></a> </div>
  </div>
</div> 
<%-- <s:property value="#session.loginuser.userImage"/> --%>
<div class="shenhe_bottom">
<div class="shenhe_left">
<div class="head"><img src="${sessionScope.loginuser.userImage}" width="80" height="80">
   </div>
   <div class="name"><h3>${sessionScope.loginuser.userName}</h3></div><%-- <s:property value="#session.finduser.userName"/> --%>
<div class="chuli">
    <ul class="left_menu">
            <li><a href="${pageContext.request.contextPath}/shop_jsp/user_UpdateUser.jsp">编辑</a></li>
            <li><a href="">消息</a></li>
            <li><a href="">收藏</a></li>
            <li><a href="">我买入的</a></li>
            <li><a href="">我卖出的</a></li>
            <li><a href="${pageContext.request.contextPath}/shop_findGood.action?findByuserid=${sessionScope.loginuser.userId}">我发布的</a></li>
           <%--  <li><a href="<s:url action=""/>">我发布的</a></li> --%>
            <li><a href="">我的足迹</a></li>
        </ul>
   </div>
</div>


<div class="shenhe_right">
<div class="bianji"><h2>用户管理</h2></div>

<div class="message">
<div class="main">
<form action="user_update.action?finduserid=${sessionScope.loginuser.userId}" method="post" enctype="multipart/form-data">
<h2>
昵  称:&nbsp;&nbsp;<input type="text" name="userName" value="${sessionScope.loginuser.userName}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userName}')this.value=''" /><br><br>
密  码:&nbsp;&nbsp;<input type="password" value="${sessionScope.loginuser.userPassword}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userPassword}')this.value=''"  name="userPassword"/><br><br>
学  校:&nbsp;&nbsp;<input type="text" name="userSchool"value="${sessionScope.loginuser.userSchool}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userSchool}')this.value=''" /><br><br>
头  像:&nbsp;&nbsp;<input type="file" name="upload" /><br><br>
手机号:&nbsp;&nbsp;<input type="text" name="userPhone" value="${sessionScope.loginuser.userPhone}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userPhone}')this.value=''" /><br><br>
收件人:&nbsp;&nbsp;<input type="text" name="userConsignee" value="${sessionScope.loginuser.userConsignee}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userConsignee}')this.value=''" /><br><br>
地  址:&nbsp;&nbsp;<input type="text"  name="userAdress" value="${sessionScope.loginuser.userAdress}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userAdress}')this.value=''" /><br><br>
邮  编:&nbsp;&nbsp;<input type="text"  name="userCode" value="${sessionScope.loginuser.userCode}" onfocus="javascript:if(this.value=='${sessionScope.loginuser.userCode}')this.value=''" /><br><br>
</h2>
<input type="submit" value="" class="sub" style="background:url(image/shop/image21.png)"/>
</form>
</div>
</div>

</div>
</div>

</body>

</html>
