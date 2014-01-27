
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>在线咨询</title>
    <script type="text/javascript">
        function submitM(){
                 if($('#message').val().trim()==""){
                  alert("您提交的问题为空，请填写后再提交。谢谢！")
                 }else{
                    $('#formA').submit();
                 }
        }
    </script>
</head>

<body>

<!--content-->

<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>在线咨询</span></p>
    </div>
    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p9">问题反馈</p></h4>
        <div class="sub_nr">
            <h2 class="dh">如有问题,请拨打客服电话 ：0371-55656586</h2>
            <form id="formA" name="formA" method="post" action="${basePath}/user/onlineCommitMessage" class="sub_form1">
                <p>问题反馈：</p>
                <textarea id="message" name="message" class="sub_input6"></textarea>
                <br />
                <div class="clear"></div>
                <input type="button" value="提 交"  onclick="submitM()" class="but_qd"/>
                <input type="reset" value="重 置"  class="but_qx" />
            </form>
            <div class="kongbai"></div>
        </div>
    </div>
</div>


</body>
</html>