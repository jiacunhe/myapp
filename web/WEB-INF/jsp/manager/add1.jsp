<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>
<html>
<head>
    <title>新建管理员</title>
</head>
<body>
<sp:form method="post" action="/manager/add">
    *用户名：
    <sp:input path="userId"/>
    <sp:errors path="userId"/> <br/>
    *姓名：
    <sp:input path="username"/>
    <sp:errors path="username"/> <br/>
    *备注：
    <sp:textarea path="remark"/>
    <sp:errors path="remark"/> <br/>
    选择角色：
    <select name="roleIds" multiple size="10" style="width: 250px;">
        <c:forEach items="${roleMap}" var="role">
            <option value="${role.key}">${role.value}</option>
        </c:forEach>
    </select>
    按住Ctrl键可以多选或取消选择
    <input type="submit" value="确定"/>
    <input type="reset" value="重置"/>
    <input type="button" value="取消"/>
</sp:form>
</body>
</html>