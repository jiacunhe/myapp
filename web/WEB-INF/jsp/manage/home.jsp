<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("basePath", basePath);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${basePath}/manage/css/ht_public.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/manage/css/ht_sub.css" rel="stylesheet" type="text/css"/>
    <%@ taglib uri="/WEB-INF/tld/mytag.tld" prefix="hyrt" %>
    <script src="${basePath}/manage/js/ht_iepng.js" type="text/javascript"></script>
    <script src="${basePath}/js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="${basePath}/manage/js/ht_select.js" id=clientEventHandlersJS></script>
    <title>工商企业查询管理系统</title>
</head>

<body>
<!--top-->
<div class="ht_top">
    <div class="ht_top_content">
        <img src="${basePath}/manage/images/ht_logo.png" class="ht_logo"/>

        <div class="ht_top_xx">
            <p>当前用户：<span>${manage.username}</span></p>
        </div>
        <div class="ht_top_button">
            <a href="/user/password/modify/UI" target="main"><img src="${basePath}/manage/images/ht_xgmm.png"/></a>
            <a href="/manage/logout"><img src="${basePath}/manage/images/ht_tc.png"/></a>
        </div>
    </div>
</div>
<!--content-->
<div class="ht_content">
    <div class="ht_content_left">
        <div class="ht_yangshi"></div>
        <hyrt:privilege uri="/customer/list">
            <dl>
                <dt><A href="/customer/list" target="main"><img src="${basePath}/manage/images/ht_ico1.png"/>客户管理</A>
                </dt>
            </dl>
        </hyrt:privilege>
        <dl>
            <dt><A href="/orderManage/search" target="main"><img src="${basePath}/manage/images/ht_ico2.png"/>订单查询</A>
            </dt>
        </dl>

        <%--        <dl>
                    <dt><A href="#"><img src="${basePath}/manage/images/ht_ico3.png"/>信息监控列表</A></dt>
                </dl>--%>

        <dl>
            <hyrt:privilege uri="/package/list"><dt><A href="/package/list" target="main" ><img src="${basePath}/manage/images/ht_ico4.png"/>套餐制定</A></dt></hyrt:privilege>
        </dl>


        <dl>
            <dt><A href="/userAccount/search" target="main"><img src="${basePath}/manage/images/ht_ico5.png"/>用户账户信息</A>
            </dt>
        </dl>


        <dl>
            <dt><A href="/userAccount/allotSearch" target="main"><img src="${basePath}/manage/images/ht_ico6.png"/>包月套餐分配</A>
            </dt>
        </dl>


        <dl>
            <dt><A href="/userAccount/rechargeSearch" target="main"><img src="${basePath}/manage/images/ht_ico7.png"/>付款明细</A>
            </dt>
        </dl>

        <dl>
            <dt><A onclick=javascript:ShowFLT(1) href="javascript:void(null)"><img
                    src="${basePath}/manage/images/ht_ico8.png"/>统计分析</A></dt>
            <dd id=LM1 style="DISPLAY: none">
                <ul>
                    <li><a href="#">消费统计</a></li>
                    <li><a href="#">查询数据统计</a></li>
                    <li><a href="#">订单统计</a></li>
                </ul>
            </dd>
        </dl>

        <dl>
            <dt><A href="#"><img src="${basePath}/manage/images/ht_ico9.png"/>操作日志</A></dt>
        </dl>

        <dl>
            <dt><A onclick=javascript:ShowFLT(2) href="javascript:void(null)"><img
                    src="${basePath}/manage/images/ht_ico10.png"/>系统管理</A></dt>
            <dd id=LM2 style="DISPLAY: none">
                <ul>
                    <hyrt:privilege uri="/role/manager">
                    <li><a href="/role/manager" target="main">角色管理</a></li>
                    </hyrt:privilege>
                    <hyrt:privilege uri="/role/manager">
                        <li><a href="/manager/list" target="main">用户管理</a></li>
                    </hyrt:privilege>
                </ul>
            </dd>
        </dl>


    </div>
    <div class="ht_content_right">

        <iframe id="main" name="main" src="/index" scrolling="no"></iframe>

    </div>
</div>


<!--bottom-->
<div class="clear"></div>
<div class="ht_bottom">
    <div class="ht_bottom_content">
        <p>Copyright 2011-2013 某某版权所有 豫ICP备00000001号</p>
    </div>
</div>


</body>
</html>
