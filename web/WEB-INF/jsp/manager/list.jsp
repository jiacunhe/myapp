<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>用户管理</title>
    <script type="text/javascript">
        $(function () {



            $("input[type='checkbox']").attr("checked", false);
            $("#edit").parent().hide();
            $("#lock").parent().hide();
            $("#unlock").parent().hide();
            $("#resetPassword").parent().hide();
            $("input[type='checkbox']").each(function () {
                $(this).change(function () {
                    $("input[type='checkbox']").attr("checked", false);
                    $(this).attr("checked", true);
                    $("#resetPassword").parent().show();
                    var userId = $(this).attr("userId");
                    if ('admin' == userId) {
                        $("#edit").parent().hide();
                        $("#lock").parent().hide();
                        $("#unlock").parent().hide();
                    } else {
                        $("#edit").parent().show();
                        var status = $(this).attr("status");
                        if ("NORMAL" == status) {
                            $("#unlock").parent().hide();
                            $("#lock").parent().show();
                        } else {
                            $("#lock").parent().hide();
                            $("#unlock").parent().show();
                        }
                    }
                });
            });
            $("#edit").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var param = $(obj).attr("id");
                        $("#edit").attr("href", "${basePath}/manager/modify/UI" + param);
                    }
                }
            });
            $("#lock").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj.length != 0) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var param = $(obj).attr("id");
                        var name = $(obj).attr("name");
                        $("#lock").attr("href", "${basePath}/manager/lock" + param);
                        return window.confirm('确定要锁定管理员：' + name + '?');
                    }
                } else {
                    alert("请选择一项");
                    return false;
                }
            });
            $("#unlock").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj.length != 0) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var param = $(obj).attr("id");
                        var name = $(obj).attr("name");
                        $("#unlock").attr("href", "${basePath}/manager/unlock" + param);
                        return window.confirm('确定要解锁管理员：' + name + '?');
                    }
                } else {
                    alert("请选择一项");
                    return false;
                }
            });
            $("#resetPassword").click(function () {
                var obj = $("input[type='checkbox']:checked");
                if (obj.length != 0) {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var param = $(obj).attr("id");
                        var name = $(obj).attr("name");
                        $("#resetPassword").attr("href", "${basePath}/manager/resetPassword" + param);
                        return window.confirm('确定要重置管理员：' + name + '的密码?');
                    }
                } else {
                    alert("请选择一项");
                    return false;
                }
            });
            <%
            String messages=request.getParameter("manageResetPassword");
            if(messages!=null&&!messages.equals("null")&&!messages.equals("")){
            try{
              messages=new String(messages.getBytes("iso-8859-1"),"utf-8");
              }catch (Exception e){
              e.printStackTrace();
              }
              }
            %>
            var messagePrompt="<%=messages%>";

            if(messagePrompt!=null&&messagePrompt!='null') {
                alert(messagePrompt);
            }
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
            <hyrt:privilege uri="/manager/add/UI"><li>
                <a href="${basePath}/manager/add/UI?formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">
                    <img src="${basePath}/manage/images/ht_ico02.png"/>

                    <p>增加</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/manager/modify"><li><a id="edit" href="${basePath}/"><img src="${basePath}/manage/images/ht_ico08.png"/>

                <p>信息修改</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/manager/resetPassword"><li><a id="resetPassword" href="${basePath}/"><img src="${basePath}/manage/images/ht_ico03.png"/>

                <p>重置密码</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/manager/lock"><li><a id="lock" href="${basePath}/"><img src="${basePath}/manage/images/ht_ico015.png"/>

                <p>锁定</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/manager/unlock"><li><a id="unlock" href="${basePath}/"><img src="${basePath}/manage/images/ht_ico016.png"/>

                <p>解锁</p></a></li></hyrt:privilege>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico09.png"/>

            <p>查询</p></h4>
        <sp:form action="${basePath}/manager/list" method="get" class="ht_sub_form3">
            <input type="hidden" id="pageNo" name="pageNo" value="1"/>
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
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1">
            <tr class="ht_sub_tr1" style="font-size: 12px;">
                <th width="30"></th>
                <th width="80">姓名</th>
                <th width="80">用户名</th>
                <th width="100">创建时间</th>
                <th width="100">创建者</th>
                <th WIDTH="100">角色</th>
                <th WIDTH="150">备注</th>
                <th>状态</th>
            </tr>

            <c:forEach items="${page.results}" var="manager">
                <tr align="center" class="ht_sub_tr1" style="font-size: 12px;">
                    <td><input name="${manager.username}" userId="${manager.userId}" status="${manager.status}"
                               id="?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${empty command.formRoleId ? 0 : command.formRoleId}&formStatus=${command.formStatus}"
                               type="checkbox"/></td>
                    <td>${manager.username}</td>
                    <td>${manager.userId}</td>
                    <td><fmt:formatDate value="${manager.regTime}" type="both" pattern="yyyy-MM-dd"/></td>
                    <td>${manager.creatorName}</td>
                    <td><c:forEach items="${manager.roles}" var="role">${role.roleName},</c:forEach></td>
                    <td>${manager.remark}&nbsp;</td>
                    <td>
                            ${manager.status.desc}
                            <%--
                                                    <a href="/manager/show/UI?userId=${manager.userId}&formUserId=${command.formUserId}&formUsername=${command.formUsername}&formRoleId=${command.formRoleId}">查看</a>
                            --%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <%@ include file="/WEB-INF/jsp/public/page.jspf" %>
    </div>

    <!--<iframe src="jk_list.html" scrolling="no"></iframe>-->
</div>

</body>
</html>
