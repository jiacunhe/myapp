<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/manage/css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="/manage/css/ht_sub.css" rel="stylesheet" type="text/css" />

<%--
   <script src="/manage/js/ht_iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="/manage/js/ht_select.js" id=clientEventHandlersJS> </script>

    <!--table选项卡-->
    <script type="text/javascript" src="/manage/js/sub_main.js"></script>
    <script type="text/javascript" src="/manage/js/sub_public.js"></script>--%>
    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
    </style>
    <title>用户账户信息</title>

</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>用户账户信息</span></p>
    </div>

    <div class="ht_sub_nr1" id="qc_sell_tab">
        <h4 class="ht_sub_title0"><img src="/manage/images/ht_ico09.png" /><p>查询</p></h4>
       <%-- <script type="text/javascript">$(function(){$("#qc_sell_tab").tabs();})</script>--%>
        <dl class="ht_sub_dl1">
            <dt  onclick="tabCard(); return false;" id="select_tab"><a href="#"  id="searchResultTab1">用户账户信息查询</a><a href="#"  id="searchResultTab2">包月套餐信息查询</a></dt>
            <div class="clear"></div>
            <dd id="content">

            </dd>

        </dl>
    </div>



</div>





<div id="content1" style="display:none">

    <form method="post" action="/userAccount/search" class="ht_sub_form7" style="margin-left:40px;">
        <span><p>客户账号：</p><input type="text" class="ht_sub_input11" name="userId" value="${userId}"/></span>
        <span><p>客户名称：</p><input type="text"  class="ht_sub_input11" name="userName" value="${userName}"/></span>
        <%--                                 <span><p>套餐类型：</p><select class="ht_sub_input016">
                                             <option>全部</option>
                                             <option>合同套餐</option>
                                             <option>固定套餐</option>
                                         </select></span>
                                        <span><p>套餐状态：</p><select class="ht_sub_input016">
                                            <option>全部</option>
                                            <option>活动</option>
                                            <option>暂停</option>
                                            <option>终止</option>
                                        </select></span>--%>
        <div class="clear"></div>
        <input type="hidden" name="page" value="1">
        <input type="submit" value="开始查询" class=" ht_but_cx4"/>
    </form>

    <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
        <tr class="ht_sub_tr1">
            <th width="70">客户账号</th>
            <th width="70">客户姓名</th>
            <%--                        <th width="68" rowspan="2">套餐类型</th>
                                    <th width="68" rowspan="2">套餐名称</th>
                                    <th width="68" rowspan="2">套餐状态</th>
                                    <th width="70" rowspan="2">生效日期</th>     --%>
            <th width="100">可用查询条数</th>
            <th width="100">可用监控个数</th>
        </tr>
        <c:forEach  var="obj" items="${resmap.list}"   varStatus="status">
            <tr align="center" <c:if test="${status.count%2==0}">class="ht_sub_tr1"</c:if> >
                <td>${obj.userId}</td>
                <td>${obj.userName}</td>
                <td>${obj.b1r}</td>
                <td>${obj.b2r}</td>
            </tr>
        </c:forEach>

        <tr class="sub_tr1">
            <td colspan="4">

                <ul>

                    <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${resmap.page -1}"  title="上一页"> < </a></li>



                    <c:if test="${resmap.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${resmap.page-1}" step="1">
                            <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${resmap.page > 9}">
                        <c:forEach var="i" begin="${resmap.page-5}" end="${resmap.page-1}" step="1">
                            <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${resmap.page}" style="color:#FF0000">${resmap.page}</a></li>


                    <c:forEach var="j" begin="${resmap.page+1}" end="${resmap.page + 5}" step="1">
                        <c:if test="${j <= resmap.totalpage}">
                            <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${j}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="/userAccount/search?userId=${userId}&userName=${userName}&page=${resmap.page+1}" title="下一页"> > </a></li>
                    <li><span >共 ${resmap.totalitem }条 ，当前第 <strong> ${resmap.page }</strong> / <span> <strong>${resmap.totalpage}</strong> </span> 页 </span> </li>
                </ul>

            </td>
        </tr>

    </table>

</div>


<div id="content2" style="display:none">
    <form method="post" action="/userAccount/searchMonthly" class="ht_sub_form7" style="margin-left:40px;">
        <span><p>客户账号：</p><input type="text" class="ht_sub_input11" name="userId" value="${userId}"/></span>
        <span><p>客户名称：</p><input type="text"  class="ht_sub_input11" name="userName" value="${userName}"/></span>
                    <span><p>月份：</p>
                        <select class="ht_sub_input016" name="yearMonth">
                            <script language="JavaScript">
                                today = new Date();
                                for (t = 0; t < 12; t++) {
                                    var selec = "";
                                    var mont = (today.getMonth() + 1);
                                     if((today.getMonth() + 1)<10){
                                         mont =  "0"+(today.getMonth() + 1);
                                     }
                                    var ym = ""+ today.getFullYear() + mont;

                                    if('${yearMonth}'== ym ){
                                        selec = "selected";
                                    }

                                    document.write('<option value="'  + ym + '" '+selec+'>'   + today.getFullYear() + '年' +(today.getMonth() + 1) + '月</option>');
                                    today.setMonth(today.getMonth() - 1);
                                }


                            </script>
                        </select>


                    </span>
        <%--                           <span style="width:500px;"><p>日期：</p>
                                     <input type="text"  class="ht_sub_input17"/> <b>至</b> <input type="text" class="ht_sub_input17"/></span>
                                         <span><p>套餐状态：</p><select class="ht_sub_input016">
                                             <option>全部</option>
                                             <option>活动</option>
                                             <option>暂停</option>
                                             <option>终止</option>
                                         </select></span>--%>
        <div class="clear"></div>
        <input type="hidden" name="page" value="1">
        <input type="submit" value="开始查询" class=" ht_but_cx4"/>
    </form>

    <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
        <tr class="ht_sub_tr1">
            <th width="70" rowspan="2">客户账号</th>
            <th width="70" rowspan="2">客户姓名</th>
            <th width="70" rowspan="2">分配者</th>
            <th width="80" rowspan="2">套餐名称</th>
            <th width="100" rowspan="2">月份</th>
            <th colspan="3">套餐条数</th>
        </tr>
        <tr class="ht_sub_tr1">
            <th> 总数 </th>
            <th>已用</th>
            <th>剩余</th>
        </tr>
        <c:forEach  var="obj" items="${monthlyList}"   varStatus="status">


            <tr align="center" <c:if test="${status.count%2==0}">class="ht_sub_tr1"</c:if> >
                <td>${obj.userId}</td>
                <td>${obj.userName}</td>
                <td>${obj.assignorName}</td>
                <td>${obj.remark}</td>
                <td>${obj.yearMonth}</td>
                <td>${obj.b1q}</td>
                <td>${obj.b1uq}</td>
                <td>${obj.b1q-obj.b1uq}</td>
            </tr>
        </c:forEach>

        <tr class="sub_tr1">
            <td colspan="8">

                <ul>

                    <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${page -1}"  title="上一页"> < </a></li>



                    <c:if test="${resmap.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${resmap.page-1}" step="1">
                            <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${page > 9}">
                        <c:forEach var="i" begin="${page-5}" end="${page-1}" step="1">
                            <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${page}" style="color:#FF0000">${resmap.page}</a></li>


                    <c:forEach var="j" begin="${page+1}" end="${page + 5}" step="1">
                        <c:if test="${j <= totalPage}">
                            <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${j}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="/userAccount/searchMonthly?userId=${userId}&userName=${userName}&page=${page+1}" title="下一页"> > </a></li>
                    <li><span >共 ${countItem }条 ，当前第 <strong> ${page }</strong> / <span> <strong>${totalPage}</strong> </span> 页 </span> </li>
                </ul>

            </td>
        </tr>



    </table>
</div>


<script type="text/javascript">

   if('${yearMonth}'==''){
        document.getElementById("searchResultTab1").style.background = "url(/manage/images/ht_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab1").style.color = "#ffffff";
        document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
   }else{
       document.getElementById("searchResultTab2").style.background = "url(/manage/images/ht_ttbg4.gif) no-repeat";
       document.getElementById("searchResultTab2").style.color = "#ffffff";
       document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
   }


    function tabCard(){
        var e = window.event?window.event.srcElement:e.target;

        if(e.innerText == "用户账户信息查询"){
            document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
        }else if(e.innerText == "包月套餐信息查询"){
            document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
        }

        for(i=0;i<document.getElementById("select_tab").childNodes.length;i++)
        {
            if(document.getElementById("select_tab").childNodes.item(i).nodeName=="A"){
                document.getElementById("select_tab").childNodes.item(i).style.background = "none";
                document.getElementById("select_tab").childNodes.item(i).style.color = "#37393a";
                // display:block;width:187px;height:34px;line-height:34px;float:left;margin-top:1px;text-align:center;font-weight:bold;font-size:12px; display:inline; color:#3f3f3f;
            }

        }
        e.style.background = "url(/manage/images/ht_ttbg4.gif) no-repeat";
        e.style.color = "#ffffff";

        e.blur();			//Chrome和Opera不需要
    }
</script>


</body>
</html>
