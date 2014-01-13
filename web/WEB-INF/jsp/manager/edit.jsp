<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.hyrt.com.cn" prefix="hyrt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>管理员信息修改</title>
    <script type="text/javascript">
        $().ready(function () {
            $.validator.addMethod("chinese", function (value, element) {
                var chinese = /^[\u4e00-\u9fa5]+$/;
                return this.optional(element) || (chinese.test(value));
            }, "只能输入中文");
            $.validator.addMethod("telephone", function (value, element) {
                var telephone = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
                return this.optional(element) || (telephone.test(value));
            }, "只能输入中文");
            $("#form").validate({
                rules: {
                    username: {
                        required: true,
                        chinese: true
                    },
                    roleIds: "required"
                },
                messages: {
                    username: {
                        required: "请输入姓名",
                        chinese: "只能输入中文"
                    },
                    roleIds: "请选择角色"
                }
            });
        });
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>管理员信息修改</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico010.png"/>

            <p>管理员信息修改</p></h4>
        <sp:form id="form" method="post" action="/manager/modify" class="ht_sub_form1" style="margin-left:100px;">
            <p>*用户名：</p>
            <sp:input path="userId" readonly="true" class="ht_sub_input1"/>
            <sp:errors path="userId"/><br/>

            <div class="clear"></div>
            <p>*姓 名：</p>
            <sp:input path="username" class="ht_sub_input1"/>
            <sp:errors path="username"/><br/>

            <div class="clear"></div>
            <p>备注：</p>
            <sp:textarea path="remark" class="ht_sub_input1" cssStyle="height: 100px"/><br/>

            <div class="clear"></div>
            <p>所属角色：</p>
            <select name="roleIds" multiple size="10" class="ht_sub_ul1" style="height: 180px;">
                <c:forEach items="${roleMap}" var="role">
                    <option value="${role.key}" class="ht_sub_input3" ${hyrt:contains(roleIds, role.key) ? 'selected':''}>${role.value}</option>
                </c:forEach>
            </select>   按住Ctrl键可以多选或取消选择
            <div class="clear"></div>
            <input type="hidden" name="formUserId" value="${formUserId}"/>
            <input type="hidden" name="formUsername" value="${formUsername}"/>
            <input type="hidden" name="formRoleId" value="${formRoleId}"/>
            <input type="hidden" name="formStatus" value="${formStatus}"/>
            <input type="submit" value="确定" class="ht_but_qd0"/>
            <a href="javascript:history.go(-1);" class="ht_but_qx0">取消</a>
        </sp:form>
    </div>

</div>


</body>
</html>
