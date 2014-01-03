<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />

    <script language=javascript src="/js/1.js" id=clientEventHandlersJS> </script>
    <script language="javascript" src="/js/jquery.min.js"></script>
    <script language=javascript src="/js/js.js"> </script>
    <script language=javascript src="/js/public.js"></script>
    <title>企业查询</title>
</head>

<body>
<!--top-->
<div class="top">
    <div class="top_content">
        <img src="../images/logo.png" class="logo"/>
        <div class="top_xx">
            <div><p>当前用户：<span>xiaozhang</span></p>

                <ul class="menu">
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

                </ul>


            </div>
            <div class="clear"></div>
            <p>您好！今天是 2013-12-23  星期一</p>
        </div>
        <div class="top_button">
            <ul>
                <li><a href="#">首页</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<!--content-->
<div class="content">
    <div class="content_left" >
        <div class="yangshi"></div>
        <dl>
            <dt><img src="../images/ico1.png" /> <A onclick=javascript:ShowFLT(1) href="javascript:void(null)">信息查询</A></dt>
            <dd id=LM1 style="DISPLAY: none">
                <ul>
                    <li><a href="/order/group" target="mainIframe">企业查询</a></li>
                    <li><a href="#">人员</a></li>
                    <li><a href="#">对外投资查询</a></li>
                </ul>
            </dd>
        </dl>

        <dl>
            <dt><img src="../images/ico2.png" /> <A onclick=javascript:ShowFLT(2) href="javascript:void(null)">信息监控</A></dt>
            <dd id=LM2 style="DISPLAY: none">
                <ul>
                    <li><a href="#">企业监控</a></li>
                    <li><a href="#">人员监控</a></li>
                    <li><a href="#">监控列表</a></li>
                </ul>
            </dd>
        </dl>

        <dl>
            <dt><img src="../images/ico3.png" /> <A onclick=javascript:ShowFLT(3) href="javascript:void(null)">套餐购买</A></dt>
            <dd id=LM3 style="DISPLAY: none"></dd>
        </dl>

        <dl>
            <dt><img src="../images/ico4.png" /> <A onclick=javascript:ShowFLT(4) href="javascript:void(null)">我的订单</A></dt>
            <dd id=LM4 style="DISPLAY: none"></dd>
        </dl>


        <dl>
            <dt><img src="../images/ico5.png" /> <A onclick=javascript:ShowFLT(5) href="javascript:void(null)">个人中心</A></dt>
            <dd id=LM5 style="DISPLAY: none">
                <ul>
                    <li><a href="#">个人资料</a></li>
                    <li><a href="#">安全中心</a></li>
                    <li><a href="#">消费明细</a></li>
                    <li><a href="#">我的消息</a></li>
                </ul>
            </dd>
        </dl>


        <dl>
            <dt><img src="../images/ico6.png" /> <A onclick=javascript:ShowFLT(6) href="javascript:void(null)">问题解答</A></dt>
            <dd id=LM6 style="DISPLAY: none"></dd>
        </dl>


        <dl>
            <dt><img src="../images/ico2.png" /> <A onclick=javascript:ShowFLT(7) href="javascript:void(null)">在线咨询</A></dt>
            <dd id=LM7 style="DISPLAY: none"></dd>
        </dl>


    </div>
    <div class="content_right" style="background: none">

        <iframe id="mainIframe" name="mainIframe"  scrolling="no"  frameborder="0" src="/welcome" width="100%" height="100%" onload="Javascript:SetWinHeight(this)" ></iframe>

    </div>
</div>



<!--bottom-->
<div class="clear"></div>
<div class="bottom"   style="position:absolute; bottom:0;">
    <div class="bottom_content">
        <p>Copyright 2011-2013 某某版权所有 豫ICP备00000000号</p>
    </div>
</div>


<script type="text/javascript">
    function SetWinHeight(obj){
        var win=obj;
        if (document.getElementById){
            if (win && !window.opera) {
                if (win.contentDocument && win.contentDocument.body.offsetHeight)
                    win.height = win.contentDocument.body.offsetHeight+100;
                else if(win.Document && win.Document.body.scrollHeight)
                    win.height = win.Document.body.scrollHeight+100;
            }
        }
    }
</script>


</body>
</html>
