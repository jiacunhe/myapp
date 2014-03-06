<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-3-5
  Time: 下午4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("basePath",basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/css/public.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/css/sub.css" rel="stylesheet" type="text/css" />
    <script src="${basePath}/js/iepng.js" type="text/javascript"></script>
    <script language="javascript" src="${basePath}/js/jquery-1.8.0.min.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <![endif]-->
    <script language=javascript src="${basePath}/js/1.js" id=clientEventHandlersJS> </script>
    <title>支付完成</title>
</head>
<body>
<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="${basePath}/">首页</a> >> <span>套餐购买</span></p>
    </div>

    <div class="content_right_nr">
        <div class="sub_nr">
            <div class="sub_successful">
                <p>${tradeStatus}</p>

            </div>

            <h4 class="sub_cgtitle">购买详情</h4>

            <ul class="cxzf_list">
                <li><span>套餐名称：</span>${packageName}</li>
                <li><span>购买时间：</span>${tradeTime}</li>
                <li><span>订单金额：</span>${orderAmount}</li>
                <li><span>购买状态：</span>${tradeStatus}</li>
                <c:if test="${failMessage!=null}" >

                <li><span>失败原因： </span>
                        ${failMessage}
                </c:if>

            </ul>

            <div class="clear"></div>
            <div class="sub_djs">
                <img src="${basePath}/images/ico_djs.gif" />

                 <span class="sub_djs1" id="tiao">30</span><a href="javascript:countDown"></a>秒后自动跳转到首页……
                <meta http-equiv="refresh" content="30; url=${basePath}/"/>


            </div>
            <div class="kongbai"></div>

        </div>
    </div>


</div>
</body>
<script type="text/javascript">
    function countDown(secs){$("#tiao").html(secs);if(--secs>0)setTimeout("countDown("+secs+")",1000);}
    countDown(30);

</script>

</html>