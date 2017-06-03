<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/26
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 公共头部 -->
<div class="header">
    <div class="header-top">
        <div class="header-in">
            <div class="logo">
                <a href="index.html"><img src="${__RES__}/images/logo.png" alt=""></a>
            </div>
            <div class="search">
                <form style="margin-bottom: 0em;">
                    <input type="text" value=""  id="search">
                    <input  type="button" id="searchButton" value="搜索">
                </form>
            </div>
            <script>
                <c:if test="${!search.equals('')}">
                    $("#search").val("${search}");
                </c:if>

                $("#searchButton").on("click", function(){

                    var searchVal = $("#search").val();
                    if(searchVal!=""){
                        window.location.href ="/mvCinema?search="+searchVal;
                    }else{
                        alert('搜索内容不能为空');
                    }
                });
                $('#search').on('keypress',function(event){

                    if(event.keyCode == 13)
                    {
                        var searchVal = $("#search").val();
                        if(searchVal!=""){
                            window.location.href ="/mvCinema?search="+searchVal;
                        }else{
                            alert('搜索内容不能为空');
                        }
                    }

                });

            </script>
            <div class="clearfix"> </div>
        </div>
        <div class="header-top-on">
            <ul class="social-in">
                <li><a href="#"><i> </i></a></li>
                <li><a href="#"><i class="facebook"> </i></a></li>
                <li><a href="#"><i class="tin"> </i></a></li>
            </ul>
        </div>
        <div class="clearfix"> </div>
    </div>
    <!---->
    <%@ include file="/WEB-INF/views/common/nav.jsp"%>
</div>

