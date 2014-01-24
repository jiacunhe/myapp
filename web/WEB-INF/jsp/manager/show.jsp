<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.hyrt.com.cn" prefix="hyrt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>查看管理员</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>查看管理员</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico06.png"/>

            <p>查看</p></h4>
        <sp:form method="post" action="${basePath}/manager/add" class="ht_sub_form1" style="margin-left:100px;">
            <p>用户名：</p>
            <sp:input path="userId" readonly="true" class="ht_sub_input1"/>
            <br/>

            <div class="clear"></div>
            <p>姓 名：</p>
            <sp:input path="username" readonly="true" class="ht_sub_input1"/>
            <br/>

            <div class="clear"></div>
            <p>备注：</p>
            <sp:textarea path="remark" readonly="true" class="ht_sub_input1" cssStyle="height: 100px"/><br/>

            <div class="clear"></div>
            <p>所属角色：</p>
            <select name="roleIds" disabled multiple size="10" class="ht_sub_ul1">
                <c:forEach items="${roleMap}" var="role">
                    <option value="${role.key}" class="ht_sub_input3" ${hyrt:contains(roleIds, role.key) ? 'selected':''}>${role.value}</option>
                </c:forEach>
            </select>
            <div class="clear"></div>
            <a href="javascript:history.go(-1);" class="ht_but_qd0">取消</a>
        </sp:form>
    </div>

</div>


</body>
</html>
