<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>个人资料</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>个人资料</span></p>
    </div>

    <div class="content_right_nr">
<<<<<<< HEAD
        <h4 class="sub_title1"><p class="sub_p4">个人资料</p> <c:if test="${role=='普通用户'}"><p class="button1"><a href="${basePath}/customer/modify/UI?_userId=${customer.userId}"><img src="${basePath}/images/button4.gif" /></a></p></c:if></h4>
        <div class="sub_nr">
            <ul class="grzl_list">
                <li class="newline"><span>用户类型：</span>${role}<a href="#">查询资费</a></li>
=======
        <h4 class="sub_title1"><p class="sub_p4">个人资料</p> <c:if test="${role=='普通用户'}"><p class="button1"><a href="${basePath}/customer/MD5/UI?_userId=${customer.userId}"><img src="${basePath}/images/button4.gif" /></a></p></c:if></h4>
        <div class="sub_nr">
            <ul class="grzl_list">
                <li class="newline"><span>用户类型：</span>${role}<c:if test="${role=='普通用户'}"><a  href="#"></a></c:if></li>
>>>>>>> 66885e462193d9289b4374896bd84c845f4c2fd8
                <li><span>账 号：</span>${customer.userId}</li>
                <li class="newline"><span>姓 名：</span>${customer.username}</li>

                <c:if test="${role=='普通用户'}">
<<<<<<< HEAD
                <li><span>证件类型：</span>${customer.certificate}</li>
                <li class="newline"><span>证件号码：</span>${customer.certificateCode}</li>
                <li><span> 职 业：</span>${customer.vocation}</li>
                <li class="newline"><span>行业：</span>${customer.trade}</li>
                <li><span>电子邮箱：</span>${customer.email}</li>
                <li class="newline"><span>联系电话：</span>${customer.telephone}</li>
                <li><span>联系人：</span>${customer.linkman}</li>
                <li class="newline"><span>邮寄地址：</span>${customer.address}</li>
=======
                    <li><span>证件类型：</span>${customer.certificate}</li>
                    <li class="newline"><span>证件号码：</span>${customer.certificateCode}</li>
                    <li><span> 职 业：</span>${customer.vocation}</li>
                    <li class="newline"><span>行业：</span>${customer.trade}</li>
                    <li><span>电子邮箱：</span>${customer.email}</li>
                    <li class="newline"><span>联系电话：</span>${customer.telephone}</li>
                    <li><span>联系人：</span>${customer.linkman}</li>
                    <li class="newline"><span>邮寄地址：</span>${customer.address}</li>
>>>>>>> 66885e462193d9289b4374896bd84c845f4c2fd8
                </c:if>
            </ul>
        </div>
    </div>

</div>


</body>
</html>
