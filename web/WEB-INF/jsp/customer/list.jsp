<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>客户管理</title>
    <link rel="stylesheet" type="text/css" media="all" href="/css/jsDatePick_ltr.min.css"/>
    <script type="text/javascript" src="/js/jsDatePick.min.1.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){

            $("#sc").click(function(){
                $("#startTime").val("");
                $("#sc").hide();
            });
        });



            function refreshQuery(more) {
            if (more) {
                $("#simple").hide();
                $("#all").show();
                $("#toggle").html("收起高级搜索");
            } else {
                $("#simple").show();
                $("#all").hide();
                $("#toggle").html("显示高级搜索");
            }
            window.document.forms[0].queryType.value = more;
        }
        $(function () {
            new JsDatePick({ useMode: 2, target: "startTime", dateFormat: "%Y-%m-%d" });
            new JsDatePick({ useMode: 2, target: "endTime", dateFormat: "%Y-%m-%d" });
            var more = ${queryType};
            refreshQuery(more);
            $("#toggle").click(function () {
                more = !more;
                refreshQuery(more);
            });
            $("#s_unlock").change(function () {
                if ($(this).attr("checked")) {
                    $("#status").attr("checked", true);
                } else {
                    $("#status").removeAttr("checked");
                }
                window.document.forms[0].submit();
            });
            $("#status").change(function () {
                if ($(this).attr("checked")) {
                    $("#s_unlock").attr("checked", true);
                } else {
                    $("#s_unlock").removeAttr("checked");
                }
                window.document.forms[0].submit();
            });
            $("#searchId").click(function () {
                window.document.forms[0].queryType.value = false;
                window.document.forms[0].userId.value = $("#condition").val();
                window.document.forms[0].username.value = "";
                window.document.forms[0].pageNo.value = 1;
                window.document.forms[0].submit();
            });
            $("#searchName").click(function () {
                window.document.forms[0].queryType.value = false;
                window.document.forms[0].userId.value = "";
                window.document.forms[0].username.value = $("#condition").val();
                window.document.forms[0].pageNo.value = 1;
                window.document.forms[0].submit();
            });
            $("#searchAll").click(function () {
                window.document.forms[0].queryType.value = true;
                window.document.forms[0].pageNo.value = 1;
                window.document.forms[0].submit();
            });
            function showOperation(op) {
                $(op).parent().removeAttr("style");
            }

            function hideOperation(op) {
                $(op).parent().attr("style", "display:none");
            }

            $("input[type='checkbox'][list='true']").attr("checked", false);
            hideOperation($("#edit"));
            hideOperation($("#delete"));
            hideOperation($("#detail"));
            hideOperation($("#resetPassword"));
            hideOperation($("#packageAssign"));
            hideOperation($("#lock"));
            hideOperation($("#unlock"));
            $("input[type='checkbox'][list='true']").each(function () {
                $(this).change(function () {
                    $("input[type='checkbox'][list='true']").attr("checked", false);
                    showOperation($("#edit"));
                    showOperation($("#delete"));
                    showOperation($("#packageAssign"));
                    showOperation($("#detail"));
                    showOperation($("#resetPassword"));
                    var status = $(this).attr("status");
                    if ("NORMAL" == status) {
                        hideOperation($("#unlock"));
                        showOperation($("#lock"))
                    } else if ("LOCK" == status) {
                        hideOperation($("#lock"));
                        showOperation($("#unlock"))
                    }
                    $(this).attr("checked", "checked");
                });
            });

            $("#edit").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#edit").attr("href", $("#edit").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                    }
                }
            });

            $("#delete").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#delete").attr("href", $("#delete").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                        return window.confirm('确定要删除客户：' + $(obj).attr("username") + '?');
                    }
                }
            });

            $("#lock").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#lock").attr("href", $("#lock").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                        return window.confirm('确定要锁定客户：' + $(obj).attr("username") + '?');
                    }
                }
            });

            $("#detail").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#detail").attr("href", $("#detail").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                    }
                }
            });


            $("#packageAssign").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        var paymentRule = $(obj).attr("paymentRule");
                        $("#packageAssign").attr("href", $("#packageAssign").attr("href") + "&_userId=" + userId + "&paymentRule="+paymentRule);
                    }
                }
            });
            $("#unlock").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#unlock").attr("href", $("#unlock").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                        return window.confirm('确定要解锁客户：' + $(obj).attr("username") + '?');
                    }
                }
            });
            $("#resetPassword").click(function () {
                var obj = $("input[type='checkbox'][list='true']:checked");
                if (obj.length == 0) {
                    alert("请选择一项");
                    return false;
                } else {
                    if (obj.length > 1) {
                        alert("只能选择一项");
                        return false;
                    } else {
                        var userId = $(obj).attr("id");
                        $("#resetPassword").attr("href", $("#resetPassword").attr("href") + "&_userId=" + userId + "&queryType=" + more);
                        return window.confirm('确定要重置客户：' + $(obj).attr("username") + '的密码?');
                    }
                }
            });
        });
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr" style="position: relative">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>客户管理</span></p>
    </div>
    <div class="ht_kongbai"></div>
    <div class="ht_rtbut">
        <ul>
            <li><a id="refresh" href="javascript: window.document.forms[0].submit();"><img
                    src="${basePath}/manage/images/ht_ico012.png"/>

                <p>刷 新</p></a></li>
            <hyrt:privilege uri="/customer/add"><li>
                <a href="/customer/add/UI?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="add"><img src="${basePath}/manage/images/ht_ico02.png"/>

                    <p>新 增</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/customer/modify"><li>
                <a href="/customer/modify/UI?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="edit"><img src="${basePath}/manage/images/ht_ico03.png"/>

                    <p>编 辑</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/customer/delete"><li>
                <a href="/customer/delete?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="delete"><img src="${basePath}/manage/images/ht_ico04.png"/>

                    <p>删 除</p></a></li></hyrt:privilege>
            <li>
                <a href="/customer/show/UI?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="detail"><img src="${basePath}/manage/images/ht_ico013.png"/>

                    <p>查看详细</p></a></li>


            <hyrt:privilege uri="/package/assign"><li>
                <a href="/package/check?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="packageAssign"><img src="${basePath}/manage/images/ht_icotcfp.png"/>

                    <p>套餐分配</p></a></li></hyrt:privilege>


            <hyrt:privilege uri="/customer/resetPassword"><li>
                <a href="/customer/resetPassword?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="resetPassword"><img src="${basePath}/manage/images/ht_ico014.png"/>

                    <p>重置密码</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/customer/lock"><li>

                <a href="/customer/lock?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="lock"><img src="${basePath}/manage/images/ht_ico015.png"/>

                    <p>锁 定</p></a></li></hyrt:privilege>
            <hyrt:privilege uri="/customer/unlock"><li>
                <a href="/customer/unlock?condition=${form.condition}&userId=${form.userId}&username=${form.username}&creatorId=${form.creatorId}&telephone=${form.telephone}&startTime=${form.startTime}&endTime=${form.endTime}&paymentRule=${form.paymentRule}&status=${form.status}"
                   id="unlock"><img src="${basePath}/manage/images/ht_ico016.png"/>

                    <p>解 封</p></a></li></hyrt:privilege>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico09.png"/>

            <p id="toggle" style="cursor:pointer;">显示高级搜索</p></h4>
        <form method="get" action="/customer/list" class="ht_sub_form3">

            <input type="hidden" id="queryType" name="queryType" value="false"/>
            <input type="hidden" id="pageNo" name="pageNo" value="1"/>

            <div id="simple">
                <input type="text" id="condition" name="condition" value="${form.condition}" class="ht_sub_input5"/>
                <input type="button" id="searchId" value="搜账号" class="ht_sub_input6"/>
                <input type="button" id="searchName" value="搜姓名" class="ht_sub_input6"/>
                <input type="checkbox" id="s_unlock" ${form.status == 'NORMAL' ? 'checked' : ''} class="ht_sub_input7"
                       style="margin-top: 10px; margin-right: 6px"/>

                <div style="margin-top:4px; float:left;">只显示未锁定用户</div>
            </div>
            <div id="all">
                <div id="sc" style="position:absolute; top:264px; left:176px; z-index: 1">
                    <img src="${basePath}/manage/images/ht_icosc.gif">
                </div>
                <p>账号：</p>
                <input type="text" name="userId" value="${form.userId}" class="ht_sub_input01"/>

                <p>姓名：</p>
                <input type="text" name="username" value="${form.username}" class="ht_sub_input01"/>

                <c:if test="${manage.userType eq 'MANAGER'}">
                <p>账户类型：</p>
                        <span class="ht_span03"><select name="paymentRule" class="ht_sub_input013">
                            <option value="">全部</option>
                            <c:forEach items="${paymentRules}" var="item">
                                <option value="${item}" ${form.paymentRule == item ? 'selected' : ''}>${item.desc}</option>
                            </c:forEach>
                        </select></span></c:if><br/>

                <c:if test="${manage.userType eq 'MANAGER'}">
                <p>父账户：</p></c:if>
                <input name="creatorId" <c:if test="${manage.userType ne 'MANAGER'}">type="hidden" value="${manage.userId}" </c:if> value="${form.creatorId}" class="ht_sub_input01">

                <p>联系电话：</p>
                <input type="text" name="telephone" value="${form.telephone}" class="ht_sub_input01"/>
                <input type="checkbox" id="status" name="status" ${form.status == 'NORMAL' ? 'checked' : ''}
                       class="ht_sub_input7"
                       style="margin-left:10px; margin-right: 0px; margin-top: 8px"/>

                <p style="margin-top:2px; width:200px; text-align:left;">只显示未锁定用户</p>
                <br/>

                <div style="position: absolute;">
                    <p>注册时间：</p>
                    <input type="text" id="startTime" readonly name="startTime" value="${form.startTime}"
                           class="ht_sub_input01" style="text-indent: 0px;"/>
                    <span style="float:left; margin:0px 10px 0px 0px;">至</span>
                    <input type="text" id="endTime" readonly name="endTime" value="${form.endTime}"
                           class="ht_sub_input01"/></div>
                <br/>
                <input type="button" id="searchAll" value="开始查询" class="ht_but_cx0"
                       style="margin-top: 15px; margin-left: 80px"/>
            </div>
        </form>
    </div>

    <div class="ht_sub_nr1">
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1">
            <tr class="ht_sub_tr1">
                <th width="70"></th>
                <th width="80">账户类型</th>
                <th width="90">账号</th>
                <th width="90">姓名</th>
                <th width="110">联系电话</th>
                <th width="160">注册日期</th>
                <th width="80">父账户</th>
                <th>账户状态</th>
            </tr>
            <c:forEach items="${page.results}" var="customer">
                <tr align="center">
                    <td><input type="checkbox" list="true" id="${customer.userId}" status="${customer.status}"
                               username="${customer.username}" paymentRule="${customer.paymentRule}"/></td>
                    <td>${customer.paymentRule.desc}</td>
                    <td>${customer.userId}</td>
                    <td>${customer.username}</td>
                    <td>${customer.telephone}</td>
                    <td>${customer.regTime}</td>
                    <td>
                        <c:if test="${customer.isChild}">
                        <a href="/customer/show/UI?_userId=${customer.creatorId}">${customer.creatorId}</a>
                        </c:if></td>
                    <td>${customer.status.desc}</td>
                </tr>
            </c:forEach>
        </table>
        <%@ include file="/WEB-INF/jsp/public/page.jspf" %>
    </div>
</div>
</body>
</html>
