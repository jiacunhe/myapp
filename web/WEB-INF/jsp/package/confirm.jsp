<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>

    <title>订单购买确认</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">套餐购买</a> >> <span>订单确认</span></p>
    </div>
    <div class="content_right_nr1">
        <h4 class="sub_title3">订单信息</h4>
        <ul class="cxzf_list">
            <li><span>套餐名称：</span>${p.packageName}</li>
            <li><span>套餐类型：</span>公用套餐</li>
            <li><span>套餐价格：</span>${p.price}元</li>
            <li><span>套餐内容：</span>单条查询条数${p.quantityA}条、按年监控企业或个人条数${p.quantityB}条</li>
            <li><span>支付方式：</span><input type="radio"  checked name="payMethod" value="bank">网银支付
                                         <input type="radio"  name="payMethod" value="payPal">支付宝支付</li>
        </ul>
        <p class="button2" style="padding-left:50px; margin-top:0px;"><input type="button" value="确定购买" class="but_qd" />
            <input type="button" value="取消订单" class="but_qx" onclick="history.go(-1)"/></p>
        <div class="sub_tx2">
            <span><b>特别声明：</b><p>用户请认真核实订单信息，点击“确定购买”后不能更改，因客户填写订单失误产生的查询损失责任自负，产生的相关费用不予退还。</p></span>
        </div>
    </div>



</div>


</body>
</html>
