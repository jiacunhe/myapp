<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/manage/css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="/manage/css/ht_sub.css" rel="stylesheet" type="text/css" />


    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
        .gy_foot{ height: 20px; line-height: 20px; overflow: hidden; margin-top: 30px; margin-bottom: 15px;}
        .gy_foot a{ padding: 3px; float: left}

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
        <span><p>客户账号：</p><input type="text" class="ht_sub_input11" name="userId" value="${_userId}"/></span>
        <span><p>客户名称：</p><input type="text"  class="ht_sub_input11" name="userName" value="${_userName}"/></span>

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



                <div class="gy_foot">
                    <div style="float: left; margin-left: 20px; display: inline;">
                        页次：${resmap.page}/${resmap.totalpage}页 &nbsp;
                        总记录数：${resmap.totalitem}条
                    </div>
                    <div style="float: right; margin-right: 20px; display: inline">
                        <a href="javascript:go2Page(1)" title="首页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/firstPage.png" style="float: left; margin: 3px;"/>
                        </a>
                        <c:forEach var="i" begin="${resmap.page - 5>=1?resmap.page - 5:1}" end="${resmap.page + 4}" step="1">
                                <c:if test="${i <= resmap.totalpage}">

                                        <a href="javascript:go2Page(${i});"    <c:if test="${i == resmap.page}">style="color:#000000; font-weight: 600;"</c:if>>${i}</a>

                                </c:if>
                        </c:forEach>
                        <a href="javascript: go2Page(${resmap.totalpage})" title="尾页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/lastPage.png" style="float: left; margin: 3px 8px 3px 3px;"/>
                        </a>

                        转到第 <input id="pn" onFocus="this.select();" maxlength="2" type="text" value="1" name="currPage" tabindex="0" style="width: 18px; height: 14px; text-align: center; text-indent: 0"/> 页
                        <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="go2Page(document.getElementById('pn').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>
                    </div>
                </div>
                <script type="text/javascript">
                    function go2Page(pageNo) {
                        if(pageNo == undefined || pageNo==null || pageNo=="")pageNo=1;
                           window.location.href="/userAccount/search?userId=${userId}&userName=${userName}&page="+pageNo;
                    }
                </script>




            </td>
        </tr>

    </table>

</div>


<div id="content2" style="display:none">
    <form method="post" action="/userAccount/searchMonthly" class="ht_sub_form7" style="margin-left:40px;">

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


        <span><p>客户账号：</p><input type="text" class="ht_sub_input11" name="userId" value="${userId}"/></span>
        <span><p>客户名称：</p><input type="text"  class="ht_sub_input11" name="userName" value="${userName}"/></span>

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

                <div class="gy_foot">
                    <div style="float: left; margin-left: 20px; display: inline;">
                        页次：${page}/${totalPage}页 &nbsp;
                        总记录数：${countItem}条
                    </div>
                    <div style="float: right; margin-right: 20px; display: inline">
                        <a href="javascript:goPage(1)" title="首页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/firstPage.png" style="float: left; margin: 3px;"/>
                        </a>
                        <c:forEach var="i" begin="${page - 5>=1?page - 5:1}" end="${page + 4}" step="1">
                                <c:if test="${i <= totalPage}">

                                        <a href="javascript:goPage(${i});" <c:if test="${i == page}"> style="color:#000000; font-weight: 600;" </c:if> >${i}</a>

                                </c:if>
                        </c:forEach>
                        <a href="javascript: goPage(${totalPage})" title="尾页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/lastPage.png" style="float: left; margin: 3px 8px 3px 3px;"/>
                        </a>

                        转到第 <input id="pn2" onFocus="this.select();" maxlength="2" type="text" value="1" name="currPage" tabindex="0" style="width: 18px; height: 14px; text-align: center; text-indent: 0"/> 页
                        <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="goPage(document.getElementById('pn2').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>
                    </div>
                </div>
                <script type="text/javascript">
                    function goPage(pageNo) {
                        if(pageNo == undefined || pageNo==null || pageNo=="")pageNo=1;
                        window.location.href="/userAccount/searchMonthly?yearMonth=${yearMonth}&userId=${userId}&userName=${userName}&page="+pageNo;
                    }
                </script>



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

        e.blur();
    }
</script>


</body>
</html>
