<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-25
  Time: 下午2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <script type="text/javascript">
        function goHome(){
            document.getElementById("mainIframe").src="${basePath}/welcome.jsp";
        }
    </script>
</head>
<body>
<!--top-->
<div class="top">
    <div class="top_content">
        <img src="${basePath}/images/logo.png" class="logo"/>
        <div class="top_xx">
            <div><p>当前用户：<span>${user.userId}</span></p>

                <!--  <ul class="menu">
                      <li>
                          <a href="#"class="tablink"><img src="../images/ico01.png" /></a>
                          <ul>
                              <li id="qc_sell_tab2">

                                  <script type="text/javascript">$(function(){$("#qc_sell_tab2").tabs();})</script>
                                  <dl class="pub_dl">
                                      <dt><a href="#">订单提醒</a><a href="#">消息提醒</a></dt>
                                      <dd style="display:block;">
                                          <p style="width:100px; height:10px; overflow:hidden;">&nbsp;</p>
                                          <p>已完成订单：<a href="#">（0）</a></p>
                                          <p>未完成订单：<a href="#">（0）</a></p>
                                          <p>未查到订单：<a href="#">（0）</a></p>
                                          <p>企业监控最新动态：<a href="#">（0）</a></p>
                                          <p>人员监控最新动态：<a href="#">（0）</a></p>
                                      </dd>
                                      <dd style="color:#006">
                                          <p style="width:100px; height:10px; overflow:hidden;">&nbsp;</p>
                                          <p>消息提醒/通知：<a href="#">（0）</a></p>
                                      </dd>
                                  </dl>

                              </li>
                          </ul>
                      </li>

                  </ul> -->


            </div>
            <div class="clear"></div>
            <p>您好！今天是
                <script language="JavaScript">
                    today = new Date();
                    document.write(today.getFullYear() + '年' +(today.getMonth() + 1) + '月'+today.getDate()+'日');
                    var days = new Array("日","一", "二", "三", "四", "五", "六");
                    document.write("&nbsp; &nbsp; 星期"+days[today.getDay()]);
                </script>
            </p>
        </div>
        <div class="top_button">
            <ul>
                <li><a href="${basePath}/home" target="mainIframe">首页</a></li>
                <li><a href="${basePath}/customer/MD5Password/UI" target="mainIframe">修改密码</a></li>
                <li><a href="${basePath}/logout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>