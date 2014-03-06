<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>消费明细</title>
    <style type="text/css">

       #woookaka ul{ width: 100%; margin-top: 20px;padding-left: 35px;}
       #woookaka ul li{list-style: none; width: 100%; height: 33px; line-height: 33px; font-size: 12px;}
       #woookaka ul li span{ font-weight: 600; color: #fc9901}
    </style>
</head>
<body>
<div class="content_right" style="height:800px;">

    <div class="yemei">
        <p>您当前所在位置：<a href="${basePath}/welcome.jsp">首页</a> >> <span>消费明细</span></p>
    </div>

    <div class="content_right_nr">

        <dl class="sub_dl2" >

            <dt><h4 class="sub_title1" id="select_table" onclick="tabCard(); return false;" >
                    <a id="searchResultTab1" href="#">充值购买记录</a>
                    <a id="searchResultTab2" href="#">包月套餐记录</a>
                </h4>
            </dt>
            <div class="sub_nr">
                <dd style="display:block;" id="content"></dd>

            </div>
        </dl>
        <c:if test="${!empty privatePackage}">
  <div id="woookaka" class="content_right_nr">

            <h4 class="sub_title1"><p class="sub_p2">我的专属资费信息</p></h4>
            <ul>
                <li><span>${privatePackage.packageName}</span></li>
                <li>价格：<span>${privatePackage.price}</span></li>
                <li>含查询条数：<span>${privatePackage.b1q}</span> 次</li>
                <li>含监控条数：<span>${privatePackage.b2q}</span> 次/1年</li>
            </ul>


    </div></c:if>


        <c:if test="${!empty monthlyPackage}">
        <div id="woookaka" class="content_right_nr">

            <h4 class="sub_title1"><p class="sub_p2">我的包月套餐定制</p></h4>
            <ul>
                <li><span>${monthlyPackage.packageName}</span></li>
                <li>含查询条数：<span>${monthlyPackage.b1q}</span> 次</li>
                    <%--   <li>含监控条数：<span>${monthlyPackage.b2q}</span> 次/1年</li>--%>
            </ul>
        </div></c:if>


</div>


<%--<h4 class="sub_title1" id="select_table" onclick="tabCard(); return false;">--%>
<%--<a id="searchResultTab1" href="#">充值购买记录</a>--%>
<%--<a id="searchResultTab2" href="#">包月套餐记录</a>--%>
<%--</h4>--%>

<div  id="content1" style="display: none">

            <span class="xfmx_span2">
                <SELECT name="period" onchange="searchRechargeRecord(this.value)">
                    <OPTION value="m" <c:if test="${period eq 'm'}">selected </c:if>>最近一个月</OPTION>
                    <OPTION value="3m" <c:if test="${period eq '3m'}">selected </c:if>>最近三个月</OPTION>
                    <OPTION value="y" <c:if test="${period eq 'y'}">selected </c:if>>最近一年</OPTION>
                </SELECT>
            </span>
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th>序号</th>
            <th>时间</th>
            <th>消费额（元）</th>
            <th>消费内容</th>
            <th>备 注</th>
        </tr>

        <c:forEach  var="obj" items="${relist}"   varStatus="status">
            <tr align="center" <c:if test="${status.count%2==0}">class="sub_tr1"</c:if> >
                <td>${status.count}</td>
                <td>${obj.chargeTime}</td>
                <td>${obj.amount}</td>
                <td>${obj.packageName}</td>
                <td>${obj.chargeType} | ${obj.returnResult}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div  id="content2" style="display: none">
    <p style="height: 33px; line-height: 33px; padding: 0; margin-bottom: 0px; margin-left: 10px;">您可以查看最近12个月的记录</p>
    <%--        <span class="xfmx_span2">
    <SELECT name="period" onchange="searchRechargeRecord(this.value)">
              <OPTION value="m" <c:if test="${period eq 'm'}">selected </c:if>>最近一个月</OPTION>
              <OPTION value="3m" <c:if test="${period eq '3m'}">selected </c:if>>最近三个月</OPTION>
              <OPTION value="y" <c:if test="${period eq 'y'}">selected </c:if>>最近一年</OPTION>
          </SELECT>

    </span>  --%>
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th>序号</th>
            <th>类型</th>
            <%--                    <th>客户账号</th>
                                <th>客户姓名</th>--%>
            <th>月份</th>
            <th>分配者</th>
            <th>查询(包/用条数)</th>
            <%--  <th>监控(包/用条数)</th>--%>


        </tr>

        <c:forEach  var="obj" items="${monthlyList}"   varStatus="status">
            <tr align="center" <c:if test="${status.count%2==0}">class="sub_tr1"</c:if> >
                <td>${status.count}</td>
                <td>包月</td>
                    <%--      <td></td>
                          <td></td>--%>
                <td>${obj.yearMonth}</td>
                <td>${obj.assignorName}</td>
                <td>${obj.b1q} / ${obj.b1uq}</td>
                    <%--      <td>${obj.b2q} / ${obj.b2uq}</td>--%>
            </tr>
        </c:forEach>
    </table>
</div>









<script type="text/javascript">

    function searchRechargeRecord(val){
        window.location.href="${basePath}/bill/rechargeRecord?period="+val;
    }

</script>
<script type="text/javascript">


        document.getElementById("searchResultTab1").style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab1").style.color = "#fd7d00";
        document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;



    function tabCard(){

        var e = window.event?window.event.srcElement:e.target;

        if(e.innerText == "充值购买记录"){
            document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
        }else if(e.innerText == "包月套餐记录"){
            document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
        }

        for(i=0;i<document.getElementById("select_table").childNodes.length;i++)
        {
            if(document.getElementById("select_table").childNodes.item(i).nodeName=="A"){
                document.getElementById("select_table").childNodes.item(i).style.background = "none";
                document.getElementById("select_table").childNodes.item(i).style.color = "#3f3f3f";
                // display:block;width:187px;height:34px;line-height:34px;float:left;margin-top:1px;text-align:center;font-weight:bold;font-size:12px; display:inline; color:#3f3f3f;
            }

        }
        e.style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
        e.style.color = "#fd7d00";

        e.blur();			//Chrome和Opera不需要
    }
</script>
</div>
</body>
</html>