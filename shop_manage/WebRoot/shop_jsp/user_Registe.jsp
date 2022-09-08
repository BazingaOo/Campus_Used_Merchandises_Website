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
	<script src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/shop/registe.js"></script>
	<link rel="stylesheet" href="css/shop/UserRegiste.css">
<%-- 	<script src="js//shop/DownGood.js"></script> --%>
        <script type="text/javascript">
            $(function() {
                $("#wizard").scrollable({
                    onSeek: function(event, i) {
                        $("#status li").removeClass("active").eq(i).addClass("active");
                    },
                    onBeforeSeek: function(event, i) {
                        if (i == 1) {
                            var user = $("#user").val();
                            if (user == "") {
                                alert("请输入用户名！");
                                return false;
                            }
                            var pass = $("#pass").val();
                            var pass1 = $("#pass1").val();
                            if (pass == "") {
                                alert("请输入密码！");
                                return false;
                            }
                            if (pass1 != pass) {
                                alert("两次密码不一致！");
                                return false;
                            }
                        }
                    }
                });
                $("#sub").click(function() {
                    var data = $("form").serialize();
                      if($("#read").is(':checked')==false){
               			alert("请阅读《用户手册》");
               			return false;
               }
               
                });

            });
        </script>
  </head>
  
<body>
<div class="top">
 <img class="pic" src="image/shop/userone.png" width="154" height="120" />
<div class="item">
<a href="shop_jsp/shop_HomePage.jsp">进入首页</a>&nbsp;&nbsp;&nbsp;<a href="shop_jsp/user_XianYu.jsp">关于我们</a>
</div>
</div>





        <div class="main" >
                <h1 class="title" align="center">用户注册</h1>
                <s:form action="user_registe" method="post" enctype="multipart/form-data">
                    <div id="wizard">
                        <ul id="status">
                            <li class="active"><strong>1.</strong>创建账户</li>
                            <li><strong>2.</strong>填写联系信息</li>
                            <li><strong>3.</strong>完成</li>
                        </ul>
                        <div class="items">
                            <div class="page">
                                <h3>创建一个账户<br/><em>请填写您的注册账户信息，用于登录。</em></h3>
                                <p><label>用户名：</label><input type="text" class="input" id="user" name="userName" /></p>
                                <p><label>密码：</label><input type="password" class="input" id="pass" name="userPassword" /></p>
                                <p><label>确认密码：</label><input type="password" class="input" id="pass1" name="userPassword1" /></p>
                                <p><label>手机号码：</label><input type="text" class="input" name="userPhone" /></p>
                                <p><label>头像：</label><input type="file" class="input" name="upload" /></p>
                                <br/>
                                <div class="btn">
                                    <input type="button" class="next right" value="下一步&raquo;" />
                                </div>
                            </div>
                            <div class="page">
                                <h3>填写联系信息<br/><em>请告诉我们您的联系方式。</em></h3>
                                <p><label>学校：</label><input type="text" class="input" name="userSchool" /></p>
                                <p><label>地址：</label><input type="text" class="input" name="userAdress" /></p>
                                <p><label>收件人：</label><input type="text" class="input" name="userConsignee" /></p>
                                <p><label>邮编：</label><input type="text" class="input" name="userCode" /></p>
                                <br/>
                                <br/>
                                <div class="btn">
                                    <input type="button" class="prev" style="float:left" value="&laquo;上一步" />
                                    <input type="button" class="next right" value="下一步&raquo;" />
                                </div>
                            </div>
                            <div class="page">
                                <h3>完成注册<br/><em>点击确定完成注册。</em></h3>
                                <h4>咸鱼欢迎您！</h4>
								<input name="agree" type="checkbox" id="read">阅读并同意<a href="shop_jsp/user_XianYu.jsp">《咸鱼条款》</a>
                                <p>请点击“确定”按钮完成注册。</p>
                                <br/>
                                <br/>
                                <br/>

                                <div class="btn">
                                    <input type="button" class="prev" style="float:left" value="&laquo;上一步" />
                                    <input type="submit" class="next right" id="sub" value="确定" />
                                </div>
                            </div>
                        </div>
                    </div>
                </s:form>
            </div>

  </body>
</html>
