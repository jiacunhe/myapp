<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/manage/css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="/manage/css/ht_sub.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" media="all" href="/css/jsDatePick_ltr.min.css" />
    <script type="text/javascript" src="/js/jsDatePick.min.1.3.js"></script>
    <script type="text/javascript">
        window.onload = function(){   new JsDatePick({ useMode:2,  target:"startDate",  dateFormat:"%Y-%m-%d" });  new JsDatePick({  useMode:2, target:"endDate",  dateFormat:"%Y-%m-%d" }); }
    </script>
    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
    </style>
</head>
<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>付款明细</span></p>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="/manage/images/ht_ico09.png" /><p>查询</p></h4>

        <form method="post" action="/userAccount/rechargeSearch" class="ht_sub_form8">

            <p>付款时间：</p>
            <input type="text"  class="ht_sub_input17" name="startDate" id="startDate"  value="${result.startDate}"/> <span>至</span> <input type="text"  id="endDate"  name="endDate"  value="${result.endDate}" class="ht_sub_input17"/><br />

            <p>客户账号：</p>
            <input type="text"  class="ht_sub_input1" name="userId" value="${result.userId}"  style="height:28px;"/>
            <div class="clear"></div>
            <p>付款金额(元)：</p>
            <input type="text" class="ht_sub_input20" name="lowPrice" value="${result.lowPrice}"/><span>—</span><input type="text" class="ht_sub_input20"  name="highPrice" value="${result.highPrice}"/><br />
            <div class="clear"></div>
            <input type="submit" value="开始查询" class="ht_but_cx2" style="margin-top:30px;"/>
            <input type="hidden" value="1" name="commit">


        </form>



        <div class="ht_sub_yangshi"></div>
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="margin-top:20px;">
            <tr class="ht_sub_tr1">
                <th>序号</th>
                <th>客户账号</th>
                <th>时间</th>
                <th>消费额（元）</th>
                <th>消费内容</th>
                <th>备 注</th>
            </tr>
            <c:forEach  var="obj" items="${result.list}"   varStatus="status">
                <tr align="center" <c:if test="${status.count%2==0}">class="sub_tr1"</c:if> >
                    <td>${status.count}</td>
                    <td>${obj.userId}</td>
                    <td>${obj.chargeTime}</td>
                    <td>${obj.amount}</td>
                    <td>${obj.packageName}</td>
                    <td>${obj.chargeType} | ${obj.returnResult}</td>
                </tr>
            </c:forEach>

            <tr class="sub_tr1">
                <td colspan="6">

                    <ul>

                        <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${result.page -1}"  title="上一页"> < </a></li>



                        <c:if test="${result.page <= 9}">
                            <c:forEach var="i" begin="${1}" end="${result.page-1}" step="1">
                                <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <c:if test="${result.page > 9}">
                            <c:forEach var="i" begin="${result.page-5}" end="${result.page-1}" step="1">
                                <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${result.page}" style="color:#FF0000">${result.page}</a></li>


                        <c:forEach var="j" begin="${result.page+1}" end="${result.page + 5}" step="1">
                            <c:if test="${j <= result.totalPage}">
                                <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${j}">${j}</a></li>
                            </c:if>
                        </c:forEach>

                        <li><a href="/userAccount/rechargeSearch?userId=${result.userId}&startDate=${result.startDate}&endDate=${result.endDate}&lowPrice=${result.lowPrice}&highPrice=${result.highPrice}&page=${result.page+1}" title="下一页"> > </a></li>
                        <li><span >共 ${result.countItem }条 ，当前第 <strong> ${result.page }</strong> / <span> <strong>${result.totalPage}</strong> </span> 页 </span> </li>
                    </ul>

                </td>
            </tr>
        </table>

    </div>



</div>



</body>
</html>
