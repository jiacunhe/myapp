<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>登录</title>
    <script type="text/javascript">
        function hideErrors() {
            var userId = document.getElementById("userId.errors");
            var password = document.getElementById("password.errors");
            if (userId) {
                $(userId).html("");
            }
            if (password) {
                $(password).html("");
            }
        }
    </script>
</head>

<body>
<div class="dl_content" style="position:absolute">
    <div class="dl_nr">
        <h4></h4>

        <div class="dl_bd">
            <sp:form method="post" action="/login" modelAttribute="user">
                用户名：
                <sp:input onkeydown="hideErrors();" path="userId" class="dl_input1"/>
                <sp:errors path="userId"/> <br/>
                密&nbsp;&nbsp;&nbsp;码：
                <sp:password onkeydown="hideErrors();" path="password" class="dl_input1"/>
                <sp:errors path="password"/>
                <input type="submit" value="" class="dl_input2"/>
                <a href="#">忘记密码</a>
            </sp:form>
        </div>
        <div class="clear"></div>
        <div class="dl_bg"></div>
    </div>
</div>

</body>
</html>
