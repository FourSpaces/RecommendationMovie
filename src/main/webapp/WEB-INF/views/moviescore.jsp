<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/27
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>电影评分</title>
</head>
<body>
<div class="content">
    <h1 class="main-title">最受欢迎的电影评分</h1>
    <div class="col-md-9 content-top">
    <c:if test="${!empty movieListPage}">
        <c:forEach items="${movieListPage.getContent()}" var="movie" varStatus="status">

        <div class="number">
            <div  class="row">
                <div class=" col-md-3">
                    <div class="row_8 handImages">
                        <img src="${__IMAGE__}${movie.poster}" class="img-responsive" alt="">
                    </div>
                </div>
                <!---->
                <div class="col-md-8">
                    <h3 class="title"><a href="/mvDetails/${movie.mid}">${movie.name}</a></h3>
                    <div>
                        <%--评分-评论人数--%>
                            评分：
                            <span class="allstar${movie.score*5} main-title-rating" title=""></span>
                            <span class=" " title="力荐">${movie.score}分</span>
                            评论人数：
                            <span class="main-meta">${movie.scoreitem}</span>
                    </div>
                    <p>${movie.details}</p>
                </div>
            </div>
        </div>
        <!---->
        </c:forEach>
    </c:if>
    </div>
    <c:if test="${!empty movieListPage}">
        <div>
            <ul class="pagination">
                <c:if test="${movieListPage.number != 0}">
                    <li><a href="/mvCinema?p=${movieListPage.number-1}&sort=${moviePageProperty}&s=${movieListPage.size}">&laquo;</a></li>
                </c:if>
                <c:forEach var="i" begin="1" end="${movieListPage.totalPages}" step="1">
                    <li class='<c:if test="${ movieListPage.number-i == -1}">active</c:if>'><a href="/mvCinema?p=${(i-1)}&sort=${moviePageProperty}&s=${movieListPage.size}">${i}</a></li>
                </c:forEach>
                <c:if test="${ movieListPage.number - movieListPage.totalPages != -1}">
                    <li><a href="/mvCinema?p=${movieListPage.number+1}&sort=${moviePageProperty}&s=${movieListPage.size}">&raquo;</a></li>
                </c:if>
            </ul>
        </div>
    </c:if>
    <div class="clearfix"></div>
</div>
</body>
</html>
