<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>新增</title>
    <script type="text/javascript">
        $().ready(function () {
            $.validator.addMethod("chinese", function (value, element) {
                var chinese = /^[\u4e00-\u9fa5]+$/;
                return this.optional(element) || (chinese.test(value));
            }, "只能输入中文");
            $.validator.addMethod("telephone", function (value, element) {
                var telephone = /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1[3|4|5|8][0-9]{9}$)/;
                return this.optional(element) || (telephone.test(value));
            }, "电话号码不正确");
            $.validator.addMethod("userId", function (value, element) {
                var userId = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,14}$/;
                return this.optional(element) || (userId.test(value));
            }, "电话号码不正确");
            $("#form").validate({
                rules: {
                    userId: {
                        required: true,
                        userId: true,
                        remote: {
                            url: "/user/checkUserId"
                        }
                    },
                    username: {
                        required: true,
                        chinese: true
                    },
                    certificateCode: "required",
                    email: {email: true},
                    telephone: {telephone: true}
                },
                messages: {
                    userId: {
                        required: "请输入账号",
                        userId: "账号必须为以字母开头的6-15位字母和数字组合",
                        remote:"账号已存在"
                    },
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
        <form id="form" action="/customer/add" method="post">
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
                        <li><span>*账 号：</span><input id="userId" name="userId" type=text class="ht_sub_li3">
                        </li>
                        <li><span>*姓 名：</span><input name="username" type=text class="ht_sub_li3"></li>
                        <li>
                            <span>证件类型：</span>
                            <SELECT class="ht_sub_li3" name="certificate">
                                <OPTION value="身份证">身份证</OPTION>
                                <OPTION value="港澳通行证">港澳通行证</OPTION>
                                <OPTION value="驾驶证">驾驶证</OPTION>
                            </SELECT>
                        </li>
                        <li><span>*证件号码：</span><input name="certificateCode" type=text class="ht_sub_li3"></li>
                        <li>
                            <span>行 业：</span>
                            <input name="trade" class="ht_sub_li3"/>
                        </li>
                        <li>
                            <span>职 业：</span>
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
