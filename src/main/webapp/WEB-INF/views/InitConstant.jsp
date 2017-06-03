<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/4/26
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%-- 引入公共静态常量 --%>
<%@ page import="com.movie.os.common.constants.CommonConstants"%>
<%--<%!
    /**图片、CSS、js静态资源文件地址*/
    static String staticServer = CommonConstants.staticServer;
    /**上传服务用服务器地址，访问时用staticImage，数据库中不存储域名*/
    static String uploadServerUrl=CommonConstants.uploadImageServer;
    /**页面显示图片的前缀路径*/
    static String staticImage=CommonConstants.staticImage;

    //内容编辑器上传图片路径
    static String keuploadSimpleUrl = uploadServerUrl+"/image/keupload?";
    //图片上传路径
    static String uploadSimpleUrl = uploadServerUrl+"/image/gok4?";
%>--%>

<c:set var="__RES__" value="<%=CommonConstants.Resources%>"></c:set>
<c:set var="__ROOT__" value="<%=CommonConstants.Root%>"></c:set>
<c:set var="__IMAGE__" value="<%=CommonConstants.Imgae%>"></c:set>



