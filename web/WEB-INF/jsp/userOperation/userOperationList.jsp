<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-22
  Time: 上午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <link rel="stylesheet" type="text/css" media="all" href="${basePath}/css/jsDatePick_ltr.min.css"/>
    <script type="text/javascript" src="${basePath}/js/jsDatePick.min.1.3.js"></script>
    <title>操作日志</title>
    <script type="text/javascript">
    $(function () {
    new JsDatePick({ useMode: 2, target: "operationTimeStart", dateFormat: "%Y-%m-%d" });
    new JsDatePick({ useMode: 2, target: "operationTimeEnd", dateFormat: "%Y-%m-%d" });

    });
            </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>操作日志</span></p>
    </div>

    <div class="ht_sub_nr1" style=" height: 100px;">
        <h4 class="ht_sub_title0"><img src="${basePath}/images/ht_ico09.png" /><p>查询</p></h4>

        <form method="get" action="${basePath}/manage/userOperation" class="ht_sub_form8" style="margin:10px 0px 20px 0px;">
            <input type="hidden" id="pageNo" name="pageNo" value="1"/>
            <p>操作时间：</p>
            <input type="text" id="operationTimeStart" name="operationTimeStart" value="${operationTimeStart}"  class="ht_sub_input17" style="margin-top: -5px;"/> <span>至</span> <input type="text" id="operationTimeEnd" name="operationTimeEnd" value="${operationTimeEnd}" class="ht_sub_input17" style="margin-top: -5px;"/>
            <p>系统账号：</p>
            <input type="text" id="userId" name="userId"  class="ht_sub_input19" value="${userId}"  style="height:28px;"/>
            <input type="submit" value="开始查询" class="ht_but_cx0" style=" margin-left:14px; display:inline;"/>
        </form>

    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="../images/ht_ico05.png" /><p>列表</p></h4>
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
            <tr class="ht_sub_tr1">
                <th width="200">时间</th>

                <th><p>内容</p></th>
            </tr>
            <c:forEach items="${page.results}" var="userOperation">
            <tr align="center">
                <td>

                    <fmt:formatDate value="${userOperation.operateTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                <td><p>用户:${userOperation.userId}&nbsp;&nbsp;&nbsp; ${userOperation.description}</p></td>
            </tr>
            </c:forEach>


        </table>

        <div class="ht_sub_foot">
            <%@ include file="/WEB-INF/jsp/public/page.jspf" %>
        </div>
        <div class="ht_sub_yangshi"></div>
    </div>
</div>







</body>
</html>
