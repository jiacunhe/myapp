<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="/css/ht_sub.css" rel="stylesheet" type="text/css" />
    <script src="/js/ht_iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="/js/ht_select.js" id=clientEventHandlersJS> </script>

    <!--table选项卡-->
    <script type="text/javascript" src="/js/sub_main.js"></script>
    <script type="text/javascript" src="/js/sub_public.js"></script>

    <title>用户账户信息</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>用户账户信息</span></p>
    </div>

    <div class="ht_sub_nr1" id="qc_sell_tab">
        <h4 class="ht_sub_title0"><img src="../images/ht_ico09.png" /><p>查询</p></h4>
        <script type="text/javascript">$(function(){$("#qc_sell_tab").tabs();})</script>
        <dl class="ht_sub_dl1">
            <dt><a href="#">合同、固定套餐查询</a><a href="#">包月套餐查询</a></dt>
            <div class="clear"></div>
            <dd>
                <form method="get" action="#" class="ht_sub_form7" style="margin-left:40px;">
                    <span><p>客户账号：</p><input type="text" class="ht_sub_input11"/></span>
                    <span><p>客户姓名：</p><input type="text"  class="ht_sub_input11"/></span>
                                 <span><p>套餐类型：</p><select class="ht_sub_input016">
                                     <option>全部</option>
                                     <option>合同套餐</option>
                                     <option>固定套餐</option>
                                 </select></span>
                                <span><p>套餐状态：</p><select class="ht_sub_input016">
                                    <option>全部</option>
                                    <option>活动</option>
                                    <option>暂停</option>
                                    <option>终止</option>
                                </select></span>
                    <div class="clear"></div>
                    <input type="button" value="开始查询" class=" ht_but_cx4"/>
                </form>
                <div class="ht_sub_button3">
                    <a href="#"><img src="../images/ht_button7.jpg" /></a>
                </div>
                <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
                    <tr class="ht_sub_tr1">
                        <th width="70" rowspan="2">客户账号</th>
                        <th width="70" rowspan="2">客户姓名</th>
                        <th width="68" rowspan="2">套餐类型</th>
                        <th width="68" rowspan="2">套餐名称</th>
                        <th width="68" rowspan="2">套餐状态</th>
                        <th width="70" rowspan="2">生效日期</th>
                        <th width="100" colspan="3">套餐查询条数</th>
                        <th width="100" colspan="3">企业监控个数</th>
                        <th width="100" colspan="3">人员监控人数</th>
                    </tr>
                    <tr class="ht_sub_tr1">
                        <th>总数</th>
                        <th>已用</th>
                        <th>剩余</th>
                        <th>总数</th>
                        <th>已用</th>
                        <th>剩余</th>
                        <th>总数</th>
                        <th>已用</th>
                        <th>剩余</th>
                    </tr>
                    <tr align="center">
                        <td>wangsan</td>
                        <td>王三</td>
                        <td>合同套餐</td>
                        <td>套餐二</td>
                        <td>活动</td>
                        <td>2013-12-26</td>
                        <td>100</td>
                        <td>50</td>
                        <td>50</td>
                        <td>26</td>
                        <td>13</td>
                        <td>13</td>
                        <td>8</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr align="center" class="ht_sub_tr1">
                        <td>wangsan</td>
                        <td>王三</td>
                        <td>合同套餐</td>
                        <td>套餐二</td>
                        <td>活动</td>
                        <td>2013-12-26</td>
                        <td>100</td>
                        <td>50</td>
                        <td>50</td>
                        <td>26</td>
                        <td>13</td>
                        <td>13</td>
                        <td>8</td>
                        <td>3</td>
                        <td>5</td>
                    </tr>

                </table>
            </dd>
            <dd>
                <form method="get" action="#" class="ht_sub_form7" style="margin-left:40px;">
                    <span><p>客户账号：</p><input type="text" class="ht_sub_input11"/></span>
                    <span><p>客户姓名：</p><input type="text"  class="ht_sub_input11"/></span>
                              <span style="width:500px;"><p>日期：</p>
                                <input type="text"  class="ht_sub_input17"/> <b>至</b> <input type="text" class="ht_sub_input17"/></span>
                                    <span><p>套餐状态：</p><select class="ht_sub_input016">
                                        <option>全部</option>
                                        <option>活动</option>
                                        <option>暂停</option>
                                        <option>终止</option>
                                    </select></span>
                    <div class="clear"></div>
                    <input type="button" value="开始查询" class=" ht_but_cx4"/>
                </form>
                <div class="ht_sub_button3">
                    <a href="#"><img src="../images/ht_button7.jpg" /></a>
                </div>
                <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
                    <tr class="ht_sub_tr1">
                        <th width="70" rowspan="2">客户账号</th>
                        <th width="70" rowspan="2">客户姓名</th>
                        <th width="70" rowspan="2">套餐类型</th>
                        <th width="80" rowspan="2">套餐名称</th>
                        <th width="70" rowspan="2">套餐状态</th>
                        <th width="100" rowspan="2">包月周期(月)</th>
                        <th width="80" rowspan="2">生效日期</th>
                        <th width="80" rowspan="2">失效日期</th>
                        <th colspan="3">套餐条数</th>
                    </tr>
                    <tr class="ht_sub_tr1">
                        <th> 总数 </th>
                        <th>已用</th>
                        <th>剩余</th>
                    </tr>
                    <tr align="center">
                        <td>wangsanyi</td>
                        <td>王三</td>
                        <td>包月</td>
                        <td>套餐一</td>
                        <td>活动</td>
                        <td>6</td>
                        <td>2013-12-01</td>
                        <td>2014-12-01</td>
                        <td>12</td>
                        <td>6</td>
                        <td>6</td>
                    </tr>
                    <tr align="center" class="ht_sub_tr1">
                        <td>wangsanyi</td>
                        <td>王三</td>
                        <td>包月</td>
                        <td>套餐一</td>
                        <td>活动</td>
                        <td>6</td>
                        <td>2013-12-01</td>
                        <td>2014-12-01</td>
                        <td>12</td>
                        <td>9</td>
                        <td>3</td>
                    </tr>
                </table>
            </dd>

        </dl>
    </div>



</div>



</body>
</html>
