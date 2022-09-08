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
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/shop/test.js"></script>
	<link rel="stylesheet" href="css/shop/UserPublish.css">
  </head>
  
  <body>
  <div class="top">
    <div id="site-nav">
        <ul class="sn-quick-menu">
            <li><a href="shop_toShowHome.action">首页</a></li>
            <li><a href="#">消息</a></li>
            <li><a href="#">购物车</a></li>
            <li>个人中心</li>
            <li><a href="shop_jsp/user_UserLogin.jsp">退出登录</a></li>
            <li>欢迎您:${sessionScope.loginuser.userName}</li> 
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
    <div class="nav-shop"> <a href="${pageContext.request.contextPath}/shop_findUpAllGood.action?findByuserid=${sessionScope.loginuser.userId}&goodState=yishangjia">
    <img src="image/shop/shoplogo.png" /></a></div>
  </div>
</div>


<div class="shenhe_bottom">
<div class="shenhe_left fl">
<div class="head"><img src="${sessionScope.loginuser.userImage}" width="80" height="80"></div>
 <div class="name"><h3 id="name11">${sessionScope.loginuser.userName}</h3></div><%-- {loginuser.userName} --%>

<%-- <%
    String s=session.getAttribute("userName").toString();
    session.setAttribute("userName",s);

%> --%>

<div class="chuli">
    <ul class="left_menu">
    		<li><img src="image/user/index3.png"/><a href="${pageContext.request.contextPath}/shop_jsp/user_UpdateUser.jsp">编辑</a></li>
            <li><img src="image/user/index4.png"><a href="">消息</a></li>
            <li><img src="image/user/index5.png"><a href="">收藏</a></li>
            <li><img src="image/user/index3.png"><a href="">我买入的</a></li>
            <li><img src="image/user/index4.png"><a href="">我卖出的</a></li>
            <li><img src="image/user/index5.png"><a href="${pageContext.request.contextPath}/shop_findUpAllGood.action?findByuserid=${sessionScope.loginuser.userId}&goodState=yishangjia">我发布的</a></li>
            <li><img src="image/user/index3.png"><a href="">我的足迹</a></li>
            <li><img src="image/user/index4.png"><a href="${pageContext.request.contextPath}/shop_jsp/user_UserFeedback.jsp"">信息反馈</a></li>
        </ul>
   </div>
</div>

<div class="shenhe_right fr">
        <div class="myWallet fl">
            <ul>
                <li>我的钱包</li>
                <li>${sessionScope.loginuser.userWallet}</li>
                <li>
                    <input type="button" value="充值" class="" onclick="javascript:OpenDiv();">
                </li>
            </ul>
        </div>
        <div class="myAddress fr">
            <ul>
                <li>我的地址</li>
                <li>
                    <table class="Addtable">
                        <tr>
                            <td>收货人</td>
                            <td>地址</td>
                            <td>手机</td>
                            <td>学校</td>
                            <td>邮编</td>
                            <td>操作</td>
                        </tr>
                        <tr>
                            <td>${sessionScope.loginuser.userConsignee}</td>
                            <td>${sessionScope.loginuser.userAdress}</td>
                            <td>${sessionScope.loginuser.userPhone}</td>
                            <td>${sessionScope.loginuser.userSchool}</td>
                            <td>${sessionScope.loginuser.userCode}</td>
                            <td><input type="button" value="编辑" onclick="" class="">
                                <input type="button" value="删除" onclick="" class="">
                            </td>
                        </tr>
                    </table>
                </li>
                <li>
                    <input type="button" value="新增收货地址" onclick="" class="">
                </li>
            </ul>
        </div>
		<div class="deleteUser fl">
		<form action="user_deleteUser.action?finduserid=${sessionScope.loginuser.userId}" method="post">
	<input type="submit" value="删除用户" >
	</form>
</div>
</div>
</div>

<div id="addmoney">
<%--    user_addMoney--%>
<form action="user_addMoney.action?finduserid=${sessionScope.loginuser.userId}" method="post">
    <p class="addword">充值</p>
    <input type="text" value="" class="addtext" name="userWallet" id="userWallet">
    <input type="submit" value="充值" class="addbtn" id="btnAdd" onclick="javascript:CloseDiv();">
    <input type="button" value="取消" class="addbtn" onclick="javascript:CloseDiv();">
    </form>
</div>
<script>
    function OpenDiv()
    {
        document.getElementById("addmoney").style.display="block";
        // document.getElementsByClassName("edit").style.display="none";
    }
    function CloseDiv()
    {

        document.getElementById("addmoney").style.display="none";
        // document.getElementById("cancelAdd").style.display="block";
    }
</script>
    
   
  </body>
</html>
