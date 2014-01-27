<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-25
  Time: 下午2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        html { overflow-x:hidden; }
    </style>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body style="background:url(${basePath}/images/xg24.gif) repeat-y">
<div class="content_left" >
    <div class="yangshi"></div>
    <dl>
        <dt><img src="${basePath}/images/ico1.png" /> <A onclick=javascript:ShowFLT(1) href="javascript:void(null)">信息查询</A></dt>
        <dd id=LM1 style="DISPLAY: none">
            <ul>
                <li><a href="${basePath}/order/group" target="mainIframe">企业查询</a></li>
                <li><a href="${basePath}/order/person" target="mainIframe">人员查询</a></li>
                <li><a href="${basePath}/order/investment" target="mainIframe">对外投资</a></li>
            </ul>
        </dd>
    </dl>

    <dl>
        <dt><img src="${basePath}/images/ico2.png" /> <A onclick=javascript:ShowFLT(2) href="javascript:void(null)">信息监控</A></dt>
        <dd id=LM2 style="DISPLAY: none">
            <ul>
                <li><a href="${basePath}/order/groupMonitor" target="mainIframe">企业监控</a></li>
                <li><a href="${basePath}/order/personMonitor" target="mainIframe">人员监控</a></li>
                <!--  <li><a href="#">监控列表</a></li>     -->
            </ul>
        </dd>
    </dl>


    <dl>
        <dt><img src="${basePath}/images/ico4.png" /> <A onclick=javascript:ShowFLT(4) href="${basePath}/order/search" target="mainIframe">我的查询</A></dt>
        <dd id=LM4 style="DISPLAY: none"></dd>
    </dl>


    <dl>
        <dt><img src="${basePath}/images/ico3.png" /> <A onclick=javascript:ShowFLT(3) href="${basePath}/package/buy" target="mainIframe">套餐购买</A></dt>
        <dd id=LM3 style="DISPLAY: none"></dd>
    </dl>




    <dl>
        <dt><img src="${basePath}/images/ico5.png" /> <A onclick=javascript:ShowFLT(5) href="javascript:void(null)">个人中心</A></dt>
        <dd id=LM5 style="DISPLAY: none">
            <ul>
                <li><a href="#">个人资料</a></li>
                <li><a href="#">安全中心</a></li>
                <li><a href="${basePath}/bill/rechargeRecord" target="mainIframe">消费明细</a></li>
                <li><a href="${basePath}/accountInfo/list" target="mainIframe">账户余额</a></li>
                <li><a href="${basePath}/user/message" target="mainIframe">我的消息</a></li>
            </ul>
        </dd>
    </dl>


    <dl>
        <dt><img src="${basePath}/images/ico6.png" /> <A onclick=javascript:ShowFLT(6) href="${basePath}/questions" target="mainIframe">问题解答</A></dt>
        <dd id=LM6 style="DISPLAY: none"></dd>
    </dl>


    <dl>
        <dt><img src="${basePath}/images/ico2.png" /> <A onclick=javascript:ShowFLT(7) href="${basePath}/questionOnline" target="mainIframe">在线咨询</A></dt>
        <dd id=LM7 style="DISPLAY: none"></dd>
    </dl>


</div>
</body>
</html>