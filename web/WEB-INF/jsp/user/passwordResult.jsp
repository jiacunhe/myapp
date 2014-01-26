<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>客户管理</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>安全中心</span></p>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico017.png"/>

            <p>提示</p></h4>
        <span class="ht_sub_span2"><img src="${basePath}/manage/images/ht_ico011.gif"/>
            <p>密码修改成功</p></span>

        <input type="button" onclick="javascript:history.go(-2);" value="返回" class="ht_but_qd1" style="margin-left: 160px"/>
        <div class="clear"></div>
        <div class="ht_yangshi" style="height:60px;"></div>
    </div>


</div>


</body>
</html>
