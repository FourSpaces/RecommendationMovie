<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/29
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>电影详情</title>
</head>
<body>

<div class="content">

    <c:if test="${!empty movieinfo}">
        <h1 class="main-title">${movieinfo.name}</h1>
        <div class="col-md-9 content-top">
            <div class="number">
                    <%--上半部分--%>
                <div class="row">
                    <div class=" col-md-3">
                        <div class="row_8 handImages">
                            <img src="${__IMAGE__}${movieinfo.poster}" class="img-responsive" alt="">
                        </div>
                    </div>
                    <!---->
                    <div class="col-md-8">
                        <div>
                            <%--电影信息部分--%>
                            <div id="info">
                                <span><span class="pl">导演</span>: <span class="attrs">${movieinfo.director}</span></span><br>
                                <span><span class="pl">编剧</span>: <span class="attrs">${movieinfo.screenwriter}</span></span><br>
                                <span class="actor">
                                    <span class="pl">主演</span>: <span class="attrs">${movieinfo.performer}</span>
                                </span><br>
                                <span class="pl">类型:</span> <span  class="attrs">${movieinfo.tag}</span><br>
                                <span class="pl">上映时间:</span> <span class="attrs">${movieinfo.time}</span><br>
                            </div>
                            <!-- 显示评分部分 -->
                            <div id="interest_sectl">
                                <div class="rating_wrap clearbox" rel="v:rating">
                                    <div class="clearfix"><div class="rating_logo ll">评分</div></div>

                                    <div class="rating_self clearfix" typeof="v:Rating">
                                        <strong class="ll rating_num" property="v:average">${movieinfo.score}</strong>
                                        <span property="v:best" content="10.0"></span>
                                        <div class="rating_right ">
                                            <div class="ll bigstar bigstar${movieinfo.score*5}"></div>
                                            <div class="rating_sum">
                                                <a href="collections" class="rating_people"><span property="v:votes">${movieinfo.scoreitem}</span>人评价</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 评分展示 -->
                                    <div class="ratings-on-weight">

                                        <div class="item">
                                            <span class="stars5 starstop" title="力荐">5星</span>
                                            <div class="power" style="width:12px"></div>
                                            <span class="rating_per">9.4%</span>
                                            <br>
                                        </div>
                                        <div class="item">
                                            <span class="stars4 starstop" title="推荐">4星</span>
                                            <div class="power" style="width:39px"></div>
                                            <span class="rating_per">29.2%</span>
                                            <br>
                                        </div>
                                        <div class="item">

                                            <span class="stars3 starstop" title="还行">3星</span>
                                            <div class="power" style="width:64px"></div>
                                            <span class="rating_per">47.0%</span>
                                            <br>
                                        </div>
                                        <div class="item">

                                            <span class="stars2 starstop" title="较差">2星</span>
                                            <div class="power" style="width:16px"></div>
                                            <span class="rating_per">11.8%</span>
                                            <br>
                                        </div>
                                        <div class="item">

                                            <span class="stars1 starstop" title="很差">1星</span>
                                            <div class="power" style="width:3px"></div>
                                            <span class="rating_per">2.5%</span>
                                            <br>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <!---->
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div id="interest_sect_level" class="clearfix">
                            <c:if test="${!empty moviescore}">
                                <div>
                                    评价时间：${moviescore.time}
                                </div><br/>
                                <div class="ll j a_stars">
                                    我的评价:
                                <span id="rating">
                                    <span id="stars"
                                          data-solid="${__RES__}/images/rating_icons/star_onmouseover.png"
                                          data-hollow="${__RES__}/images/rating_icons/star_hollow_hover.png"
                                          data-solid-2x="${__RES__}/images/rating_icons/star_onmouseover@2x.png"
                                          data-hollow-2x="${__RES__}/images/pics/rating_icons/star_hollow_hover@2x.png">

                                        <a href="/mvScore/${movieinfo.mid}/1?sid=${moviescore.sid}" class="j a_show_login" name="pbtn-25884801-1">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star1" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/2?sid=${moviescore.sid}" class="j a_show_login" name="pbtn-25884801-2">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star2" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/3?sid=${moviescore.sid}" class="j a_show_login" name="pbtn-25884801-3">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star3" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/4?sid=${moviescore.sid}" class="j a_show_login" name="pbtn-25884801-4">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star4" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/5?sid=${moviescore.sid}" class="j a_show_login" name="pbtn-25884801-5">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star5" width="16" height="16"></a>
                                    </span>
                                    <%--显示选择标签值--%>
                                    <span id="rateword" class="pl"></span>
                                    <input id="n_rating" type="hidden" value="${moviescore.score}">
                                </span>
                                </div>

                            </c:if>
                             <c:if test="${empty moviescore}">
                                 <div class="ll j a_stars">
                                     评价:
                                <span id="rating">
                                    <span id="stars"
                                          data-solid="${__RES__}/images/rating_icons/star_onmouseover.png"
                                          data-hollow="${__RES__}/images/rating_icons/star_hollow_hover.png"
                                          data-solid-2x="${__RES__}/images/rating_icons/star_onmouseover@2x.png"
                                          data-hollow-2x="${__RES__}/images/pics/rating_icons/star_hollow_hover@2x.png">

                                        <a href="/mvScore/${movieinfo.mid}/1" class="j a_show_login" name="pbtn-25884801-1">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star1" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/2" class="j a_show_login" name="pbtn-25884801-2">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star2" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/3" class="j a_show_login" name="pbtn-25884801-3">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star3" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/4" class="j a_show_login" name="pbtn-25884801-4">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star4" width="16" height="16"></a>
                                        <a href="/mvScore/${movieinfo.mid}/5" class="j a_show_login" name="pbtn-25884801-5">
                                            <img src="${__RES__}/images/rating_icons/star_hollow_hover.png" id="star5" width="16" height="16"></a>
                                    </span>
                                    <%--显示选择标签值--%>
                                    <span id="rateword" class="pl"></span>
                                    <input id="n_rating" type="hidden" value="">
                                </span>
                                 </div>
                             </c:if>

                        </div>
                    </div>
                </div>
                    <%--下半部分：提交评分，查看评分列表--%>
                <div class="row">

                    <br>
                        <%--剧情简介--%>
                    <div class="col-md-10" >
                        <div class="story">
                            <h4 class="stories"><span>剧情简介...</span></h4>
                        </div>
                        <div class="indent">
                            <span>
                                ${movieinfo.details}
                            </span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <br>

                        <%--查看评分列表--%>
                    <div class="col-md-10">
                        <div class="comment-top">
                            <div class="story">
                                <h4 class="stories "><span>评分列表 </span></h4>
                            </div>
                            <!---->
                            <div id="scorelist">
                                <div class="comments-top-top ">
                                    <div class="top-comment-right">
                                        <div class="comment">
                                            <span>传统捍卫者</span>
                                            <span>评分：<span class="allstar40 main-title-rating" title="力荐"></span></span>
                                            <span></span>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>


                            <!---->
                        </div>
                        <a href="#" class="reply">更多评分</a>
                    </div>

                    <div class="clearfix"></div>

                </div>
            </div>
        </div>
    </c:if>

    <div class="clearfix"></div>


</div>

<script>

    /* <!-- 豆瓣评分实现 js 分析 -->*/
    (init_stars = function (o) {
        var e,
                n = function() {
                    /**
                     * window.devicePixelRatio 设备像素比
                     * window.matchMedia 表示指定的媒体查询字符串解析后的结果
                     */
                    var t = "(-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3/2), (min-resolution: 1.5dppx)";
                    return window.devicePixelRatio > 1 || !(!window.matchMedia || !window.matchMedia(t).matches) //返回值为真（1），则表示为，返回值为假（0），
                },
                initTab = {
                    1: "很差",
                    2: "较差",
                    3: "还行",
                    4: "推荐",
                    5: "力荐"
                },

                ratingValue = $("#n_rating"), //存储评价值
                starsImag = $("#stars img"), //评星图片对象
                stars = $("#stars"),

                //获得空心的图标
                s = n() && stars.data("hollow-2x") ? stars.data("hollow-2x") : stars.data("hollow"),
                //获得实心得图标
                c = n() && stars.data("solid-2x") ? stars.data("solid-2x") : stars.data("solid"),

                // 设置评星填充
                //l = function(e) {
                fillStars = function(e) {
                    var n = ratingValue.val() || 0;   // 默认值为 0
                    //使用三目运算符，不为假时：执行 #rateword 赋值 ，对星进行处理。 为假时：读取数据源的值，赋给rateword, 对星进行处理
                    //评分值是否大于0, 大于0 ，则显示鼠标悬停评分。 小于0 则显示存储评分
                    e ? ($("#rateword").text(initTab[e]),
                            //遍历a元素，判断是否填充星星
                            starsImag.each(function(t) {
                                this.src = t < e ? c : s
                            })) : ($("#rateword").text(n ? initTab[n] : ""),
                            starsImag.each(function(t) {
                                this.src = t < n ? c : s
                            }))
                };
            //hover方法规定当鼠标指针悬停在被选元素上时要运行的两个函数 (规定 mouseover 事件发生时运行的函数,规定 mouseout 事件发生时运行的函数。)
            starsImag.hover(function() {
                    fillStars(this.id.charAt(4))//charAt() 方法可返回指定下标的字符（由0开始计算） ，假如当前id 为star2，2作为参数传入
                },
                function() {
                    fillStars(e || 0)
                }),
            ratingValue.attr("name") && starsImag.click(function() {
                starsValue = this.id.charAt(4), ratingValue.val(starsValue), fillStars(starsValue)
            }),fillStars()

    }());
    //执行
    //init_stars();
    zz = {
        1: "很差",
        2: "较差",
        3: "还行",
        4: "推荐",
        5: "力荐"
    },
    /* 实现动态加载评分 */
    $.getJSON("/api/moviescore/list/${movieinfo.mid}", function(data){
            var scorelist = $('#scorelist');
            scorelist.html('');
            $.each(data.content, function(i,item){
               // $("<img/>").attr("src", item.media.m).appendTo("#images");
                $.getJSON("/api/moviescore/user/"+item.uid,function(data){
                    item.uid = data.nickname;
                    html = setValue(item.uid,item.score,item.time);
                    scorelist.append(html);
                });

            });
    });

    function setValue(name,scort,time){

        html = "";
        html += ' <div class="comments-top-top "><div class="top-comment-right"><div class="">';
        html += '<span>'+name+'</span></a>&nbsp;&nbsp;&nbsp;&nbsp;';
        html += '评分：<span class="allstar'+(scort*10)+' main-title-rating" title=""></span>&nbsp;&nbsp;';
        html += '<span>'+time+'</span><div class="clearfix"> </div>';
        html += '</div> </div> <div class="clearfix"> </div> </div>';

        return html;
    }

</script>
<script>

</script>
</body>
</html>
