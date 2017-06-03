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
    <title>推荐配置</title>
    <link href="${__RES__}/css/user.style.css" rel="stylesheet">
</head>
<body>
<section class="content-wrap">
    <div class="row">
        <aside class="col-md-3 sidebar">
            <div class="widget">
                <h4 class="title">推荐配置</h4>
                <div class="list-group">
                    <a href="/user/referral/configure" class="list-group-item">推荐配置</a>
                </div>
            </div>
        </aside>
        <main class="col-md-7 main-content">
            <article class="post">
                <div class="post-head">
                    <h3 class="post-title">
                        推荐配置
                    </h3>
                </div>
                <div class="post-content">
                <form:form action="${__ROOT__}/user/referral/configure" class="form-horizontal"  method="post"  commandName="user" role="form">

                <div class="form-group">
                        <label for="lists">你喜欢看什么电影?</label>
                        <select class="form-control" id="lists" name="like">
                            <option value="0" <c:if test="${remarkArray[0]=='0'}">selected</c:if> >全部</option>
                            <option value="1" <c:if test="${remarkArray[0]=='0'}">selected</c:if> >喜剧</option>
                            <option value="2" <c:if test="${remarkArray[0]=='2'}">selected</c:if> >爱情</option>
                            <option value="3" <c:if test="${remarkArray[0]=='3'}">selected</c:if> >家庭</option>
                            <option value="4" <c:if test="${remarkArray[0]=='4'}">selected</c:if> >犯罪</option>
                            <option value="5" <c:if test="${remarkArray[0]=='5'}">selected</c:if> >动作</option>
                            <option value="6" <c:if test="${remarkArray[0]=='6'}">selected</c:if> >悬疑</option>
                            <option value="7" <c:if test="${remarkArray[0]=='7'}">selected</c:if> >古装</option>
                            <option value="8" <c:if test="${remarkArray[0]=='8'}">selected</c:if> >科幻</option>
                            <option value="9" <c:if test="${remarkArray[0]=='9'}">selected</c:if> >奇幻</option>
                        </select>

                    </div>
                    <div class="list-group">
                        <label >你的年龄？</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="year" id="optionsRadios1" value="1"  <c:if test="${remarkArray[1]=='1'}">checked</c:if> > 20岁以下
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="year" id="optionsRadios2" value="2" <c:if test="${remarkArray[1]=='2'}">checked</c:if> > 20-25岁
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="year" id="optionsRadios3" value="3"  <c:if test="${remarkArray[1]=='3'}">checked</c:if> > 26-30岁
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="year" id="optionsRadios4" value="4" <c:if test="${remarkArray[0]=='4'}">checked</c:if> > 30岁以上
                            </label>
                        </div>
                    </div>
                    <div class="list-group">
                        <label >你的观影方式？</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="gyfs" id="or1" value="0"  <c:if test="${remarkArray[2]=='0'}">checked</c:if> > 电影院看比较多
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="gyfs" id="or2" value="1"  <c:if test="${remarkArray[2]=='1'}">checked</c:if> > 电脑看比较多
                            </label>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                    </form:form>
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
