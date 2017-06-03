<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/25
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>主页</title>
    <!-- requried-jsfiles-for owl -->
    <link href="${__RES__}/css/owl.carousel.css" rel="stylesheet">
    <script src="${__RES__}/js/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({
                items : 3,
                lazyLoad : true,
                autoPlay : true,
                pagination : false,
                navigation : true,
                navigationText :  true,
            });
        });
    </script>
    <!-- //requried-jsfiles-for owl -->
</head>
<body>
   <!-- 热映电影 -->
   <div class="gallery">
       <h1>热映电影</h1>

       <!-- start content_slider -->
       <div id="owl-demo" class="owl-carousel " style="padding: 1px;">

        <c:if test="${!empty rymovie}">
            <c:forEach items="${rymovie}" var="movie" varStatus="status">
                <div class="item g1">
                    <a href="/mvDetails/${movie.mid}">
                        <img class="lazyOwl " data-src="${__IMAGE__}${movie.poster}" alt="name" style="height: 499px;"></a>
                    <div class="caption">
                        <a href="/mvDetails/${movie.mid}">
                        <h3 class="cinema overflow-concealment ${nameclassList[status.index%3]} ">${movie.name}</h3></a>
                        <p>导演: ${movie.director}<br>
                            编剧: ${movie.screenwriter}</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>

       </div>
       <!--//sreen-gallery-cursual---->
   </div>

    <!-- 内容部分 -->
   <div class="content">
       <div class="col-md-8 content-top">

    <c:if test="${!empty rymovie}">
        <c:forEach items="${rymovie}" var="movie" varStatus="status">
            <div class="number">
                <div class="feb">
                    <label style="padding: 10px 8px;margin: 0;" >${movie.time}</label>
                </div>
                <h3><a href="/mvDetails/${movie.mid}">${movie.name}</a></h3>
                <div  class="row">
                    <div class="col-md-5">
                        <div class="row_8 handImage">
                            <img src="${__IMAGE__}${movie.poster}" class="img-responsive" alt="">
                        </div>
                    </div>
                    <div class="col-md-7">
                        <p>${movie.details}</p>
                    </div>
                </div>
                <!---->

                <!---->
                <div class="movie">
                    <a href="/mvDetails/${movie.mid}" class="more">更多 </a>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </c:forEach>
    </c:if>



           <!---->
         <%--  <div class="older-top">
               <a href="#" class="older"><i> </i>older posts</a>
               <a href="#" class="older top-old"><i > </i>newer posts</a>
               <div class="clearfix"> </div>
           </div>--%>
           <!---->
       </div>
       <!---->
       <div class="col-md-4 content-bottom">
           <div class="story"><h4  class="stories"><span>热点资讯</span></h4></div>
           <!---->
           <div class="grid-top">
               <h4>本周口碑榜</h4>
               <ul>
                <c:if test="${!empty tagJson}">
                    <c:forEach items="${tagJson}" var="movie" varStatus="status">
                    <li><a href="/mvDetails/${movie.getString("mid").replace("[\"","").replace("\"]","")}">${movie.getString("name").replace("[\"","").replace("\"]","")} </a></li>
                    </c:forEach>
                </c:if>
               </ul>
           </div>
           <!---->
           <div class="grid-top-in">
               <h4>热点 Tab </h4>
               <p><a href="/mvCinema?sort=scoreitem&s=9&search=速度与激情" class="jol"> 速度与激情</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=蓝精灵" class="lop">蓝精灵</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=怪物" class="bun">怪物</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=异星觉醒" class="live"> 异星觉醒</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=银河护卫队" class="dan">银河护卫队</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=三只小猪" class="jol"> 三只小猪</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=加勒比海盗" class="live">加勒比海盗</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=查尔斯三世" class="eva">查尔斯三世</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=救赎" class="live">救赎</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=千与千寻" class="bun">千与千寻</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=泰坦" class="live">泰坦 </a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=机器" class="jol">机器</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=星际" class="live">星际 </a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=驯龙" class="bun">驯龙</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=原始人" class="live">原始人</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=黑暗骑士" class="lop"> 黑暗骑士</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=窃听" class="live">窃听</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=魔术" class="bun">魔术</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=黑客" class="eva">黑客</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=冰川" class="live">冰川 </a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=哈利" class="bun">哈利</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=终章" class="live">终章 </a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=角斗士" class="dan">角斗士</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=枪火" class="eva">枪火</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=辛德勒" class="live">辛德勒 </a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=魔女宅急便" class="bun">魔女宅急便</a>
                   <a href="/mvCinema?sort=scoreitem&s=9&search=天空之城" class="live">天空之城 </a>

               </p>
           </div>
           <!---->
       </div>
       <div class="clearfix"></div>
   </div>

</body>
</html>
