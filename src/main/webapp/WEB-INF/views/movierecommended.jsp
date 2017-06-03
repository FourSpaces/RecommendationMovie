<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/27
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<html>
<head>
    <title>电影推荐</title>
</head>
<body>
<!---->
<div class="cinema">
    <h1>猜你喜欢</h1>
    <div class="cinema-top">
    <c:if test="${!empty MovieList}">
        <c:forEach items="${MovieList}" var="movie" varStatus="status">

            <div class="col-md-4 top-cinema">
                <a href="/mvDetails/${movie.mid}">
                    <img class="img-responsive" src="${__IMAGE__}${movie.poster}" alt="name"></a>
                <div class="caption">
                    <a href="/mvDetails/${movie.mid}">
                    <h3 class="cinema  overflow-concealment ${nameclassList[status.index%3]} ">${movie.name} </h3></a>
                    <div>评分：
                        <span class="allstar${movie.score*5} main-title-rating" title=""></span>
                        <span class=" " title="">${movie.score}分</span>
                    </div>
                </div>
            </div>

         </c:forEach>
    </c:if>

        <div class="clearfix"></div>
    </div>

</div>
</body>
</html>
