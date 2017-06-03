<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/26
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"  %>
<%@ include file="/WEB-INF/views/InitConstant.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>电影推荐-<sitemesh:title/></title>
    <%@ include file="/WEB-INF/views/common/publicMeta.jsp"%>
    <%@ include file="/WEB-INF/views/common/publicCSS.jsp"%>
    <%@ include file="/WEB-INF/views/common/publicJS.jsp"%>
    <sitemesh:head/>
</head>
<body>
        <div id="main-content">
           <%-- 左上角的装饰 --%>
            <div class="back">
                <img src="${__RES__}/images/back.png" alt="">
            </div>

           <div class="container">
               <div class="main-top">
                   <div class="main">
                    <%@ include file="/WEB-INF/layouts/base/header.jsp"%>
                    <sitemesh:body/>
                   </div>
                   <i class="line"> </i>
                   <i class="line-in"> </i>
                   <i class="line-in line-in1"> </i>
                   <%--<i class="line-in line-in2"> </i>--%>
               </div>
           </div>

        </div>
    <%@ include file="/WEB-INF/layouts/base/footer.jsp"%>
</body>
</html>

