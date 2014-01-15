<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>客户管理</title>
    <script type="text/javascript">
        $().ready(function () {
            /*$("#submit").click(function() {
                $.ajax({
                    url:"/user/password/modify",
                    method: "post",
                    success: function(data) {
                         if(data == true) {
                             if (window.confirm("密码修改成功，请重新登录系统。")) {
                             }
                         }
                    }
                });
                return false;
            });*/
            $("#form").validate({
                rules: {
                    oldPassword: {
                        required: true,
                        remote: {
                            url: "/user/password/check",
                            data: {
                                userId: function () {
                                    return $('#userId').val();
                                },
                                password: function () {
                                    return $('#oldPassword').val();
                                }
                            }

                        }
                    },
                    password: {
                        required: true,
                        minlength: 6,
                        maxlength: 16
                    },
                    password2: {
                        required: true,
                        equalTo: "#password"
                    }
                },
                messages: {
                    oldPassword: {
                        required: "请输入旧密码",
                        remote: "密码不正确"
                    },
                    password: {
                        required: "请输入密码",
                        minlength: "密码不能少于6位",
                        maxlength: "密码不能超过16位"
                    },
                    password2: {
                        required: "请再输入一次密码",
                        equalTo: "两次密码不一致"
                    }
                }
            });
        });
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>用户管理</span></p>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico017.png"/>

            <p>修改密码</p></h4>
        <span class="ht_sub_span2"><img src="${basePath}/manage/images/ht_ico011.gif"/><p>
            定期更换密码可以让您的账户更加安全。请确保登录密码与支付密码不同！建议密码采用字母和数字混合，并且不短于6位.。</p></span>

        <form id="form" method="post" action="/user/password/modify" class="ht_sub_form2">
            <input type="hidden" value="${manage.userId}" name="userId" id="userId"/>

            <p>旧密码：</p>
            <input type="password" name="oldPassword" class="ht_sub_input4" id="oldPassword"/> <span>*</span><br/>

            <div class="clear"></div>
            <p>新密码：</p>
            <input type="password" name="password" class="ht_sub_input4" id="password"/> <span>*</span><br/>

            <div class="clear"></div>
            <p>确认新密码：</p>
            <input type="password" name="password2" class="ht_sub_input4" id="password2"/> <span>*</span><br/>

            <div class="clear"></div>
            <input id="submit" type="submit" value="确定" class="ht_but_qd1"/>
            <input type="button" onclick="javascript:history.go(-1);" value="取消" class="ht_but_qx1"/>
        </form>
        <div class="clear"></div>
        <div class="ht_yangshi" style="height:60px;"></div>
    </div>


</div>


</body>
</html>
