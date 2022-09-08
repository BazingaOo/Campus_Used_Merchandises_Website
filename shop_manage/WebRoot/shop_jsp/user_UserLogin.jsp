<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
  <%--   <script type="text/javascript" src="js/admin/admin_login/admin_login.js"></script> --%>
    <link rel="stylesheet" href="css/shop/UserLogin.css" >
      <script type="text/javascript">
/*             $(function() {       
                $("#login-button").click(function() {  
                	alert("11"+"${sessionScope.loginuser}");
                	
                    if("${sessionScope.loginuser}"==null){
                    	alert("密码或用户名错误");              
                    }             		               
                });
            });
 */ 
/*  $("#login_button").click(function(){
        var username = document.getElementById("username").value();
       	var password = document.getElementById("password").value();
         if(username == ""){
             alert("请输入用户名");
             return false;
         }else if(password == ""){
             alert("请输入密码");
             return false;
         }
        //ajax去服务器端校验
         var data= {userName:username,userPassword:password};
         
         $.ajax({
             type:"POST",
             url:"user_login.do",
             data:data,
             dataType:'json',
            	success:function(msg){
                 //alert(msg);
                 if(msg == "success"){
					alert("登录ccc，请重试!");
                 }else{
                     alert("登录失败，请重试!");
                }
            }
         }); */
});          
        </script>
  </head>
  
  <body>

<div align="center" class="pic">
              <img  src="image/shop/userone.png" width="154" height="120" />
</div>
            <div class="wrapper">
                <div class="container">
                    <h1>Welcome</h1>
                    <s:form class="form" action="user_login" method="post">
                        <input type="text" placeholder="Username" name="userName" autocomplete="off" id="username">
                        <input type="password" placeholder="Password" name="userPassword" id="password">
                        <a href="shop_jsp/user_Registe.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="shop_jsp/user_Registe.jsp">忘记密码</a><br/>
                        <button type="submit" id="login-button" >Login</button>
                    </s:form>
                </div>

            </div>




</body>
</html>
