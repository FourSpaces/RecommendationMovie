<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/26
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>有人拦截我吗？</title>
</head>
<body>
   有人拦截我吗？
</body>
</html>
