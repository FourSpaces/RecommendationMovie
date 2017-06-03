<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/5/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>注册</title>
    <link href="${__RES__}/css/login.register.style.css" rel="stylesheet">
</head>
<body>
<div class="content">
    <div class="header" >
        <h1>注册用户</h1>
    </div>
    <div class="row">
        <div class="col-md-4" >
            <form:form  style="padding: 2em;" action="${__ROOT__}/public/register" class="form-horizontal"  method="post"  commandName="userinfo" role="form">

                <div class="input-element">
                    <label for="username">用户名</label>
                    <input type="text" id="username" name="username">
                </div>
                <div class="input-element">
                    <label for="nickname">昵称</label>
                    <input type="text" id="nickname" name="nickname">
                </div>
                <div class="input-element">
                    <label for="password">密码</label>
                    <input type="password" id="password" name="password">
                </div>
                <div class="form-group">
                    <input type="checkbox" id="rem">
                    <label style="font-weight: bold;" for="rem">我已经阅读并同意</label><a style="color: #3B7FC4;">《使用协议》</a>

                </div>
                <div class="form-group">
                    <button id="submit"  type="submit" class="btn btn-success" style="float: right;">注册</button>
                </div>
                <div class="clearfix"></div>
            </form:form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.input-element input').focusin(function(){
        $(this).parent().addClass('active');
    });

    $('.input-element input').blur(function(){
        if(!$(this).val().length > 0) {
            $(this).parent().removeClass('active');
        }
    });
</script>
<script src="${__RES__}/js/userScrapy.js"></script>
</body>
</html>
