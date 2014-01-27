<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <script type="text/javascript">
        $().ready(function () {
            $.validator.addMethod("chinese", function (value, element) {
                var chinese = /^[\u4e00-\u9fa5]+$/;
                return this.optional(element) || (chinese.test(value));
            }, "只能输入中文");
            $.validator.addMethod("telephone", function (value, element) {
                var telephone = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
                return this.optional(element) || (telephone.test(value));
            }, "电话号码不正确");
            $("#form").validate({
                rules: {
                    username: {
                        required: true,
                        chinese: true
                    },
                    certificateCode: "required",
                    email: {email: true},
                    telephone: {telephone: true}
                },
                messages: {
                    username: {
                        required: "请输入姓名",
                        chinese: "只能输入中文"
                    },
                    certificateCode: "请输入证件号码",
                    email: "电子邮箱格式不正确",
                    telephone: "电话号码不正确"
                }
            });
        });
    </script>
    <title>个人资料</title>
</head>

<body>

<form id="form" action="${basePath}/customer/MD5" method="post">
    <div class="content_right">
        <div class="yemei">
            <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>个人资料</span></p>
        </div>

        <div class="content_right_nr">
            <h4 class="sub_title1"><p class="sub_p4">修改个人资料</p> <p class="button1"></p></h4>
            <div class="sub_nr">
                <ul class="grzl_list">
                    <li>
                        <span>账户类型：</span>
                        <select name="paymentRule" class="li1" disabled>
                            <c:forEach items="${paymentRules}" var="item">
                                <option value="${item}" ${customer.paymentRule == item ? 'selected':''}>${item.desc}</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li><span>*账 号：</span><input name="userId" style="border: none;background-color: #ffffff" value="${customer.userId}" readonly type=text class="li1">
                    </li>
                    <li><span>*姓 名：</span><input name="username" style="border: none;background-color: #ffffff" value="${customer.username}" readonly type=text class="li1"></li>
                    <li>
                        <span>*证件类型：</span>
                        <input name="certificate" style="border: none;background-color: #ffffff" value="${customer.certificate}" readonly type=text class="li1">
                    </li>
                    <li><span>*证件号码：</span><input name="certificateCode" style="border: none;background-color: #ffffff" value="${customer.certificateCode}" readonly type=text class="li2"></li>
                    <li>
                        <span>行 业：</span>
                        <input name="trade" value="${customer.trade}" class="li3"/>
                    </li>
                    <li>
                        <span>职 业：</span>
                        <input name="vocation" value="${customer.vocation}" class="li3"/>
                    </li>
                    <li><span>电子邮箱：</span><input name="email" value="${customer.email}" type="text" class="li3"/></li>
                    <li><span>联系电话：</span><input name="telephone" value="${customer.telephone}" type="text" class="li3"/></li>
                    <li><span>联系人：</span><input name="linkman" value="${customer.linkman}" type="text" class="li3"/></li>
                    <li><span>邮寄地址：</span><input name="address" value="${customer.address}" type="text" class="li4"/></li>

                </ul>
                <div class="clear"></div>
                <p class="button2"><input type="submit" value="确定" class="but_qd"/>
                    <input type="button" onclick="javascript:history.go(-1);" value="取消" class="but_qx"/></p>
            </div>
        </div>

        <div class="yangshi"></div>

    </div>
</form>

</body>
</html>
