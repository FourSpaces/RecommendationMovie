<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/5/24
  Time: 7:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>用户信息</title>
    <link href="${__RES__}/css/user.style.css" rel="stylesheet">
</head>
<body>
<section class="content-wrap">
    <div class="row">
        <aside class="col-md-3 sidebar">
            <div class="widget">
                <h4 class="title">信息设置</h4>
                <div class="list-group">
                    <a href="/user/info" class="list-group-item">我的信息</a>
                    <a href="/user/edit/password" class="list-group-item">修改密码</a>
                </div>
            </div>
        </aside>
        <main class="col-md-7 main-content">
            <article class="post">
                <div class="post-head">
                    <h3 class="post-title">
                        我的信息
                    </h3>
                </div>
                <div class="post-content">
                    <form:form action="${__ROOT__}/user/info" class="form-horizontal"  method="post"  commandName="user" role="form">

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input type="text" class="form-control" id="name" name="username" placeholder="请输入用户名" value="${doctorInfo.username}" >
                        </div>
                        <div class="form-group">
                            <label for="nickname">昵称</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="请输入昵称" value="${doctorInfo.nickname}" >
                        </div>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form:form>
                </div>
                <footer class="post-footer clearfix"></footer>
            </article>
        </main>

    </div>
</section>

<script type="text/javascript">

</script>
<script src="${__RES__}/js/userScrapy.js"></script>
</body>
</html>

