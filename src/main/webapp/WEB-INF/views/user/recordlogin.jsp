<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/5/24
  Time: 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<head>
    <title>登陆记录</title>
    <link href="${__RES__}/css/user.style.css" rel="stylesheet">
</head>
<body>
<section class="content-wrap">
    <div class="row">
        <aside class="col-md-3 sidebar">
            <div class="widget">
                <h4 class="title">我的记录</h4>
                <div class="list-group">
                    <a href="/user/record/login" class="list-group-item">登陆记录</a>
                    <a href="/user/record/score" class="list-group-item">评分记录</a>
                    <a href="/user/record/search" class="list-group-item">搜索记录</a>
                </div>
            </div>
        </aside>
        <main class="col-md-7 main-content">
            <article class="post">
                <div class="post-head">
                    <h3 class="post-title">
                        登陆记录
                    </h3>
                </div>
                <div class="post-content">
                    <table class="table table-striped">
                        <caption>最近的登陆记录</caption>
                        <thead>
                        <tr>
                            <th>时间</th>
                            <th>变化</th>
                            <th>地理位置</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${loginList.getContent()}" var="list">
                        <tr>
                            <td>${list.loginTime}</td>
                            <td>${list.ip}</td>
                            <td>未知</td>
                        </tr>
                        </c:forEach>


                        </tbody>
                    </table>
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
