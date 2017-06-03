<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/27
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>电影库</title>
</head>
<body>

<!---->
<div class="archives">
    <h2>选电影</h2>
    <div class="archives-tops">
        <div class="fliter-wp">
            <div class="filter">
                <form action="get" id="gaia_frm" autocomplete="off">
                    <input type="hidden" name="type" value="movie">
                    <div class="tags">
                        <div class="tag-list">
                            <%--<label class="activate">热门--%>
                            <%--<input type="radio" name="tag" value="热门" checked="checked">--%>
                            <%--</label>--%>

                            <%--<label>最新--%>
                                <%--<input type="radio" name="sort" value="time" <c:if test='${moviePageProperty == "time"}' >checked="checked"</c:if>></label>--%>

                            <%--<label>经典--%>
                                <%--<input type="radio"  name="sort" value="scoreitem" <c:if test='${moviePageProperty == "scoreitem"}' >checked="checked"</c:if>></label>--%>

                            <%--<label>豆瓣高分--%>
                                <%--<input type="radio"  name="sort" value="status" <c:if test='${moviePageProperty == "status"}' >checked="checked"</c:if>></label>--%>

                            <c:if test="${!empty taglist}">
                                <c:forEach items="${taglist}" var="tags" varStatus="status">
                                    <label>${tags.key}
                                        <input type="radio" name="tag" value="${tags.key}" <c:if test='${tag == tags.key}' >checked="checked"</c:if>></label>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="tool">
                        <div class="sort">
                            <label>
                                <input type="radio" name="sort" value="scoreitem" <c:if test='${moviePageProperty == "scoreitem"}' >checked="checked"</c:if>>&nbsp;按热度排序
                            </label>
                            <label>
                                <input type="radio" name="sort" value="time" <c:if test='${moviePageProperty == "time"}' >checked="checked"</c:if>>&nbsp;按时间排序
                            </label>
                            <label>
                                <input type="radio" name="sort" value="status" <c:if test='${moviePageProperty == "status"}' >checked="checked"</c:if>>&nbsp;按评价排序
                            </label>
                        </div>

                        <input type="hidden" name="page_limit" value="20">
                        <input type="hidden" name="page_start" value="0">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!---->

<!-- 精选电影 -->
<div class="cinema">
    <div class="hide">
        <h3 class="cinema"><a href="/mvDetails">Contrary </a> </h3>
        <h3 class="cinema travel"><a href="/mvDetails">Random</a> </h3>
        <h3 class="cinema tele"><a href="/mvDetails">Bonorum</a> </h3>
    </div>
    <c:if test="${!empty movieListPage}">

    <div class="cinema-top">
        <!-- 如果电影信息列表不为空 -->
        <!-- 电影信息列表-->
    <c:forEach items="${movieListPage.getContent()}" var="movie">
        <div class="col-md-4 top-cinema">
            <a href="/mvDetails/${movie.mid}">
                <img class="img-responsive" src="${__IMAGE__}${movie.poster}" alt="name" ></a>
            <div class="caption">
                 <a href="/mvDetails/${movie.mid}"><h3 class="cinema tele overflow-concealment">${movie.name}</h3></a>
                <div class="details-style">${movie.details}</div>
            </div>
        </div>
    </c:forEach>

    <div class="clearfix"></div>

    </div>

    <!-- 分页 -->
    <div>
        <ul class="pagination">
            <c:if test="${movieListPage.number != 0}">
                <li><a href="/mvCinema?p=${movieListPage.number-1}&sort=${moviePageProperty}&s=${movieListPage.size}&search=${search}">&laquo;</a></li>
            </c:if>
            <c:forEach var="i" begin="1" end="${movieListPage.totalPages}" step="1">
                <li class='<c:if test="${ movieListPage.number-i == -1}">active</c:if>'><a href="/mvCinema?p=${(i-1)}&sort=${moviePageProperty}&s=${movieListPage.size}&search=${search}">${i}</a></li>
            </c:forEach>
            <c:if test="${ movieListPage.number - movieListPage.totalPages != -1}">
                <li><a href="/mvCinema?p=${movieListPage.number+1}&sort=${moviePageProperty}&s=${movieListPage.size}&search=${search}">&raquo;</a></li>
            </c:if>
        </ul>
    </div>
    </c:if>
</div>
<!---->

<script>
    var tab = '${tab}';
    var sort = '${moviePageProperty}';
    var tag = '${tag}';
    var search = '${search}';
    $("input:radio[name='sort']").change(function (){ //拨通
        var val = $('input:radio[name="sort"]:checked').val();
        window.location.href ="/mvCinema?sort="+val+"&s=9&tag="+tag;
    });

    $("input:radio[name='tag']").change(function (){ //拨通
        var val = $('input:radio[name="tag"]:checked').val();
        window.location.href ="/mvCinema?sort="+sort+"&s=9&tag="+val;
    });


</script>

</body>
</html>
