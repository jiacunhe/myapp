<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-25
  Time: 下午3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title></title>
    <style type="text/css">
        html { overflow-x:hidden; }
    </style>
</head>
<body style="background:url(${basePath}/images/ht_xg251.gif) repeat-y #ccd2da 30px top;">
<div class="ht_content_left">
    <div class="ht_yangshi"></div>
    <hyrt:privilege uri="/customer/list">
        <dl>
            <dt><A href="${basePath}/customer/list" target="main"><img src="${basePath}/manage/images/ht_ico1.png"/>客户管理</A>
            </dt>
        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/orderManage/search">
        <dl>
            <dt><A href="${basePath}/orderManage/search" target="main"><img src="${basePath}/manage/images/ht_ico2.png"/>订单查询</A>
            </dt>
        </dl>
    </hyrt:privilege>

    <%--        <dl>
                <dt><A href="#"><img src="${basePath}/manage/images/ht_ico3.png"/>信息监控列表</A></dt>
            </dl>--%>
    <hyrt:privilege uri="/package/list">
        <dl>


            <dt><A href="${basePath}/package/list" target="main" ><img src="${basePath}/manage/images/ht_ico4.png"/>套餐制定</A></dt>

        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/userAccount/search">
        <dl>
            <dt><A href="${basePath}/userAccount/search" target="main"><img src="${basePath}/manage/images/ht_ico5.png"/>用户账户信息</A>
            </dt>
        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/userAccount/allotSearch">
        <dl>
            <dt><A href="${basePath}/userAccount/allotSearch" target="main"><img src="${basePath}/manage/images/ht_ico6.png"/>包月套餐分配</A>
            </dt>
        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/userAccount/rechargeSearch">
        <dl>
            <dt><A href="${basePath}/userAccount/rechargeSearch" target="main"><img src="${basePath}/manage/images/ht_ico7.png"/>付款明细</A>
            </dt>
        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/manage/analysis">
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
    </hyrt:privilege>
    <hyrt:privilege uri="/manage/userOperation">
        <dl>
            <dt><A href="${basePath}/manage/userOperation" target="main"><img src="${basePath}/manage/images/ht_ico9.png"/>操作日志</A></dt>
        </dl>
    </hyrt:privilege>
    <hyrt:privilege uri="/manager/list">
        <dl>
            <dt><A onclick=javascript:ShowFLT(2) href="javascript:void(null)"><img
                    src="${basePath}/manage/images/ht_ico10.png"/>系统管理</A></dt>
            <dd id=LM2 style="DISPLAY: none">
                <ul>
                    <hyrt:privilege uri="/role/manager">
                        <li><a href="${basePath}/role/manager" target="main">角色管理</a></li>
                    </hyrt:privilege>
                    <hyrt:privilege uri="/manager/list">
                        <li><a href="${basePath}/manager/list" target="main">用户管理</a></li>
                    </hyrt:privilege>
                </ul>
            </dd>
        </dl>
    </hyrt:privilege>

</div>
</body>
</html>