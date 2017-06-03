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
                        搜索记录
                    </h3>
                </div>
                <div class="post-content">
                    <table class="table table-striped">
                        <caption>最近一周的搜索记录</caption>
                        <thead>
                        <tr>
                            <th>关键字</th>
                            <th>时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${movieScorePage.getContent()}" var="list">
                            <tr>

                                <td>${list.keyword}</td>
                                <td>${list.time}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <ul class="pagination">
                        <c:if test="${movieScorePage.number != 0}">
                            <li><a href="/user/record/search?p=${movieScorePage.number-1}">&laquo;</a></li>
                        </c:if>
                        <c:forEach var="i" begin="1" end="${movieScorePage.totalPages}" step="1">
                            <li class='<c:if test="${ movieScorePage.number-i == -1}">active</c:if>'><a href="/user/record/search?p=${(i-1)}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${ movieScorePage.number - movieScorePage.totalPages != -1}">
                            <li><a href="/user/record/search?p=${movieScorePage.number+1}">&raquo;</a></li>
                        </c:if>
                    </ul>
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
