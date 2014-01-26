<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-25
  Time: 下午3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title></title>
</head>
<body>
<!--top-->
<div class="ht_top">
    <div class="ht_top_content">
        <img src="${basePath}/manage/images/ht_logo.png" class="ht_logo"/>

        <div class="ht_top_xx">
            <p>当前用户：<span>${manage.username}</span></p>
        </div>
        <div class="ht_top_button">
            <a href="${basePath}/index" target="main"><img src="${basePath}/manage/images/ht_sy.png"/></a>
            <a href="${basePath}/user/password/modify/UI" target="main"><img src="${basePath}/manage/images/ht_xgmm.png"/></a>
            <a href="${basePath}/manage/logout"><img src="${basePath}/manage/images/ht_tc.png"/></a>
        </div>
    </div>
</div>
</body>
</html>