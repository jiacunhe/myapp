<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>管理员列表</title>
</head>
<body>
<div>
    <sp:form action="/manager/list" method="get">
        <sp:input path="formUserId" title="123123"/>
        <sp:input path="formUsername"/>
        <sp:select path="formRoleId">
            <option value="0">请选择</option>
            <sp:options  items="${roleMap}" />
        </sp:select>
        <input type="submit" value="查询"/>
    </sp:form>
</div>
<DIV ID="MainArea">
    <TABLE CELLSPACING="0" CELLPADDING="0" CLASS="sub_table1">

        <!-- 表头-->
        <THEAD>
        <TR ALIGN=center VALIGN=middle ID=TableTitle>
            <TD WIDTH="100">姓名</TD>
            <TD WIDTH="100">用户名</TD>
            <TD WIDTH="100">创建时间</TD>
            <TD WIDTH="100">创建者</TD>
            <TD WIDTH="100">角色</TD>
            <TD WIDTH="200">备注</TD>
            <TD>相关操作</TD>
        </TR>
        </THEAD>

        <!--显示数据列表-->
        <TBODY ID="TableData" CLASS="dataContainer">

        <c:forEach items="${managers}" var="manager">
            <TR CLASS="TableDetail1 template">
                <TD>${manager.username}&nbsp;</TD>
                <TD>${manager.userId}&nbsp;</TD>
                <TD><fmt:formatDate value="${manager.regTime}" type="both" pattern="yyyy-MM-dd"/>&nbsp;</TD>
                <TD>${manager.creatorId}&nbsp;</TD>
                <TD><c:forEach items="${manager.roles}" var="role">${role.roleName}&nbsp; </c:forEach></TD>
                <TD>${manager.remark}&nbsp;</TD>
                <TD><a href="/manager/delete?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}"
                       onclick="return window.confirm('确定要删除管理员：' + ${manager.username} + '?')">删除</a>
                    <a href="/manager/modify/UI?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">修改</a>
                    <a href="/manager/resetPassword?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}"
                       onclick="return window.confirm('您确定要初始化密码吗？')">初始化密码</a>
                </TD>
            </TR>
        </c:forEach>

        </TBODY>
    </TABLE>
    <br/>
    <a href="/manager/add/UI?formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">新建</a>
</DIV>
</body>
</html>