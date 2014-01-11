<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>新增</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>客户管理</span></p>
    </div>

    <div class="ht_sub_nr1" id="qc_sell_tab">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico06.png"/>

            <p>新增</p></h4>
        <form action="/customer/add" method="post">
            <dl class="ht_sub_dl1">
                <dd>
                    <ul class="ht_sub_ul2">
                        <li>
                            <span>*账户类型：</span>
                            <select name="paymentRule" class="ht_sub_li3">
                                <c:forEach items="${paymentRules}" var="item">
                                    <option value="${item}">${item.desc}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li><span>*账 号：</span><input name="userId" type=text class="ht_sub_li3">
                        </li>
                        <li><span>*姓 名：</span><input name="username" type=text class="ht_sub_li3"></li>
                        <li>
                            <span>*证件类型：</span>
                            <SELECT class="ht_sub_li3" name="certificate">
                                <OPTION value="身份证">身份证</OPTION>
                                <OPTION value="港澳通行证">港澳通行证</OPTION>
                                <OPTION value="驾驶证">驾驶证</OPTION>
                            </SELECT>
                        </li>
                        <li><span>*证件号码：</span><input name="certificateCode" type=text class="ht_sub_li3"></li>
                        <li>
                            <span>行 业</span>
                            <input name="trade" class="ht_sub_li3"/>
                        </li>
                        <li>
                            <span> 职 业：</span>
                            <input name="vocation" class="ht_sub_li3"/>
                        </li>
                        <li><span>电子邮箱：</span><input name="email" type="text" class="ht_sub_li3"/></li>
                        <li><span>联系电话：</span><input name="telephone" type="text" class="ht_sub_li3"/></li>
                        <li><span>联系人：</span><input name="linkman" type="text" class="ht_sub_li3"/></li>
                        <li><span>邮寄地址：</span><input name="address" type="text" class="ht_sub_li4"/></li>
                    </ul>
                    <div class="clear"></div>
                    <p class="ht_sub_button2"><input type="submit" value="确定" class="ht_but_qd"/>
                        <input type="button" onclick="javascript:history.go(-1);" value="取消" class="ht_but_qx"/>
                    </p>

                    <div class="ht_sub_yangshi"></div>
                </dd>
            </dl>
        </form>
    </div>
</div>
</body>
</html>
