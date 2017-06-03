<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/26
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header-bottom">
    <div class="navigation">
        <div>
            <label class="mobile_menu" for="mobile_menu">
                <span>Menu</span>
            </label>
            <input id="mobile_menu" type="checkbox">
            <ul class="nav">
                <li><a class="color1" href="/">主页</a></li> <%-- 82 --%>
                <li><a href="/mvCinema" class="color2">电影库</a></li> <%-- 103 --%>
                <li><a href="/mvScore" class="color3">电影评分</a></li><%-- 124 --%>
                <li><a href="/mvRecommended" class="color5">推荐电影</a></li><%-- 124 --%>

                <li><%--<a href="contact.html" class="color6">个人中心/登录/注册</a>--%>
                    <a href="" class="color6">&nbsp;</a> <%-- 493 --%>
                  <%--  <ul >
                        <li><a href="cinema.html">cinema</a></li>
                        <li><a href="magazine.html">Magazine</a></li>
                    </ul>--%>
                </li>

                <!-- 如果用户信息不为空 -->
                    <c:choose>
                        <c:when test="${empty UserInfo}">
                        <li style="float: right;">
                            <span>
                                <a href="${__ROOT__}/public/login" class="color7">登录</a><%-- 493 --%>
                                <a class="color7">/</a>
                                <a href="${__ROOT__}/public/register" class="color7">注册</a>
                            </span>
                        </li>
                        </c:when>
                        <c:otherwise>

                            <li class="dropdown" style="float: right;">
                                <span>
                                    <a href="#" >${UserInfo.nickname}<span> </span></a>
                                </span>
                                <ul>
                                    <li><a href="/user/info">个人信息</a></li>
                                    <li><a href="/user/referral/configure">推荐管理</a></li>
                                    <li><a href="/user/record/login">我的记录</a></li>
                                    <li><a href="/public/logout">注销登陆</a></li>
                                </ul>

                            </li>

                        </c:otherwise>
                    </c:choose>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
