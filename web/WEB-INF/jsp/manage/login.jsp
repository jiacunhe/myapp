<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("basePath", basePath);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台登录</title>
    <link href="${path}/manage/css/ht_denglu.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<script language="javascript">
    $(function () {
        $("#password2").show();
        $("#password").hide();
        $("#form").submit(function () {
            if ("用户名" == $("#userId").val() || "" == $("#username")) {
                $("#error").html("请输入用户名");
                $("#userId").focus();
                return false;
            } else if ("" == $("#password").val()) {
                $("#error").html("请输入密码");
                $("#password").show();
                $("#password2").hide();
                $("#password").focus();
                return false;
            }
        });
        $("#userId").focus(function () {
            if ($(this).val() == "用户名") $(this).val("");
        });
        $("#userId").blur(function () {
            if ($(this).val() == "") $(this).val("用户名");
        });
        $("#password2").focus(function () {
            $(this).hide();
            $("#password").show();
            $("#password").focus();
        });
        $("#password").blur(function () {
            if ($(this).val() == "") {
                $("#password2").show();
                $("#password").hide();
            }
        });
        $("#userId").keydown(function() {
            $("#error").html("");
        });
        $("#password").keydown(function() {
            $("#error").html("");
        });
    });
</script>

<body>
<div class="ht_dl">
    <h4><img src="${path}/manage/images/ht_logo0.png"/></h4>

    <div class="ht_dlnr">
        <h2><img src="${path}/manage/images/ht_dltitle1.png"/></h2>
        <form id="form" method="post" action="/manage/login">
            <input id="userId" name="userId" type="text" value="${empty userId ? '用户名' : userId}" class="ht_dlinput1"/><br/>
            <input id="password" name="password" type="password" value="" class="ht_dlinput1"/>
            <input id="password2" type="text" value="密码" class="ht_dlinput1"/><br/>
            <span id="error">${error}</span>
            <input type="submit" value="" class="ht_dlinput2"/><a href="#">忘记密码</a>
        </form>
    </div>
</div>
</body>
</html>