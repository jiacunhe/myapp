<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>用户管理</title>
    <script type="text/javascript">
        $(function () {
            $("input[type='checkbox']:checked");
            $("input[type='checkbox']").each(function () {
                $(this).change(function () {
                    $("input[type='checkbox']").attr("checked", false);
                    $(this).attr("checked", true);
                });
            });
            $("#edit").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                    } else {
                        var param = $(obj).attr("id");
                        $("#edit").attr("href", "/manager/modify/UI" + param);
                    }
                } else {
                    alert("请选择一项");
                }
            });
            $("#delete").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                    } else {
                        var param = $(obj).attr("id");
                        var name = $(obj).attr("name");
                        $("#delete").attr("href", "/manager/delete" + param);
                        return window.confirm('确定要锁定管理员：' + name + '?');
                    }
                } else {
                    alert("请选择一项");
                }
            });
            $("#unlock").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                    } else {
                        var param = $(obj).attr("id");
                        var name = $(obj).attr("name");
                        $("#unlock").attr("href", "/manager/unlock" + param);
                        return window.confirm('确定要解锁管理员：' + name + '?');
                    }
                } else {
                    alert("请选择一项");
                }
            });
        })
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>用户管理</span></p>
    </div>
    <div class="ht_kongbai"></div>
    <div class="ht_rtbut">
        <ul>
            <li>
                <a href="/manager/add/UI?formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">
                    <img src="${basePath}/manage/images/ht_ico02.png"/>

                    <p>增加</p></a></li>
            <li><a id="edit" href="/"><img src="${basePath}/manage/images/ht_ico08.png"/>

                <p>信息修改</p></a></li>
            <li><a id="resetPassword" href="/"><img src="${basePath}/manage/images/ht_ico03.png"/>

                <p>重置密码</p></a></li>
            <li><a id="delete" href="/"><img src="${basePath}/manage/images/ht_ico015.png"/>

                <p>锁定</p></a></li>
            <li><a id="unlock" href="/"><img src="${basePath}/manage/images/ht_ico016.png"/>

                <p>解锁</p></a></li>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico09.png"/>

            <p>查询</p></h4>
        <sp:form action="/manager/list" method="get" class="ht_sub_form3">
            <p>用户名：</p>
            <sp:input path="formUserId" class="ht_sub_input01"/>
            <p>角色： </p>
            <span class="ht_span03"><sp:select path="formRoleId" class="ht_sub_input013">
                <option value="0">请选择</option>
                <sp:options items="${roleMap}"/>
            </sp:select> </span><br/>

            <p>姓名：</p>
            <sp:input path="formUsername" class="ht_sub_input01"/>
            <p>状态： </p>
            <span class="ht_span03"><sp:select path="formStatus" class="ht_sub_input013">
                <option value="">请选择</option>
                <sp:options items="${statusMap}"/>
            </sp:select> </span>

            <p><input type="submit" value="查询" class="ht_but_cx0"/></p>
        </sp:form>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico05.png"/>

            <p>列表</p></h4>
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1">
            <tr class="ht_sub_tr1">
                <th width="30"></th>
                <th width="80">姓名</th>
                <th width="80">用户名</th>
                <th width="100">创建时间</th>
                <th width="100">创建者</th>
                <th WIDTH="100">角色</th>
                <th WIDTH="150">备注</th>
                <th>状态</th>
            </tr>
            <c:forEach items="${managers}" var="manager">
                <tr align="center">
                    <td><input name="${manager.username}"
                               id="?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}&formStatus=${command.formStatus}"
                               type="checkbox"/></td>
                    <td>${manager.username}</td>
                    <td>${manager.userId}</td>
                    <td><fmt:formatDate value="${manager.regTime}" type="both" pattern="yyyy-MM-dd"/></td>
                    <td>${manager.creatorName}</td>
                    <td><c:forEach items="${manager.roles}" var="role">${role.roleName},</c:forEach></td>
                    <td>${manager.remark}&nbsp;</td>
                    <td>
                            ${'LOCK' == manager.status ? '锁定' : '正常'}
                            <%--
                                                    <a href="/manager/show/UI?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">查看</a>
                            --%>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!--<iframe src="jk_list.html" scrolling="no"></iframe>-->
</div>


</body>
</html>
