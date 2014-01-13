
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ht_sub.css" rel="stylesheet" type="text/css" />
    <script src="../js/ht_iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="../js/ht_select.js" id=clientEventHandlersJS> </script>

    <!--table选项卡-->
    <script type="text/javascript" src="../js/sub_main.js"></script>
    <script type="text/javascript" src="../js/sub_public.js"></script>

    <title>查看详细</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>客户管理</span></p>
    </div>

    <div class="ht_sub_nr1" id="qc_sell_tab">
        <script type="text/javascript">$(function(){$("#qc_sell_tab").tabs();})</script>
        <dl class="ht_sub_dl1">
            <dt><a href="#">个人基本资料</a><a href="#">套餐类型</a></dt>
            <div class="clear"></div>
            <dd>
                <ul class="ht_sub_ul2">
                    <li class="newline"><span>账户类型：</span>后付费</li>
                    <li><span>*账 号：</span>zhangsan</li>
                    <li class="newline"><span>*父账户：</span>wangsan</li>
                    <li><span>账户是否锁定：</span>是</li>
                    <li class="newline"><span>锁定时间：</span>2013-12-24 00:00:00</li>
                    <li><span>注册时间：</span>2013-12-22 00:00:00</li>
                    <li class="newline"><span>*姓 名：</span>张 三</li>
                    <li><span>证件类型：</span>身份证</li>
                    <li class="newline"><span>证件号码：</span>410181198502121542</li>
                    <li><span> 职 业：</span>法律</li>
                    <li class="newline"><span>行 业</span>律师</li>
                    <li><span>电子邮箱：</span>111111@163.com</li>
                    <li class="newline"><span>联系电话：</span>12345678945</li>
                    <li><span>联系人：</span>张 三</li>
                    <li class="newline"><span>邮寄地址：</span>郑州市某某区某某路某某号</li>
                    <li><span>邮 编：</span>450000</li>
                </ul>
                <div class="ht_sub_yangshi"></div>
            </dd>

            <dd>

                <form method="get" action="#" class="ht_sub_form3" >
                    <p>套餐类型： </p>
                                <span class="ht_span03">
                                   合同套餐
                                   </span>
                    <div class="clear"></div>
                    <div class="ht_sub_area2" style="height:90px;">
                        <p>单条查询条数：</p><input type="text" value="1000" class="ht_sub_input10" style="height:20px; line-height:20px;"/>条 <span>注：可进行企业查询、人员查询、对外投资查询</span>
                        <p>按年监控条数：</p><input type="text" value="1000" class="ht_sub_input10" style="height:20px; line-height:20px;"/>条 <span>注：可进行企业监控和人员监控</span>
                        <div class="clear"></div>
                        <p>包月周期：</p><select class="ht_sub_input10" style="height:20px; line-height:20px;">
                        <option>2</option>
                        <option  selected="selected">4</option>
                    </select>月
                    </div>
                    <div class="clear"></div>
                    <input type="button" value="确定"  class="ht_but_qd" style="margin-left:82px;"/>
                    <input type="button" value="取消"  class="ht_but_qx" />
                </form>
                <div class="ht_sub_yangshi"></div>
            </dd>
        </dl>
    </div>



</div>



</body>
</html>
