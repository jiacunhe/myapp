<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>套餐余额</title>
    <style type="text/css">

        #woookaka ul{ width: 100%; margin-top: 20px;padding-left: 35px;}
        #woookaka ul li{list-style: none; width: 100%; height: 33px; line-height: 3px; font-size: 12px;}
        #woookaka ul li span{ font-weight: 600; color: #fc9901}
    </style>
</head>

<body>


<div class="content_right" style="height: 666px">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>查询资费</span></p>
    </div>

    <div id="woookaka" class="content_right_nr">

            <h4 class="sub_title1"><p class="sub_p2">普通套餐剩余</p></h4>
           <c:if test="${package1}">


                <table class="sub_table1" border="1px solid #dadada" width="100%">

                    <tr align="center">
                        <td>用户名</td>
                        <td>查询类型</td>
                        <td>剩余条数</td>
                        <td>总条数</td>
                        <td>备注</td>
                    </tr>
                    <c:forEach var="p" items="${list}"  varStatus="status">
                        <tr align="center">
                            <td>${p.userId}</td>
                            <td><c:if test="${p.businessId==1}">单条查询</c:if>
                                <c:if test="${p.businessId==2}">按年监控</c:if>
                            </td>
                            <td>${p.remainder}</td>
                            <td>${p.totality}</td>
                            <td>${p.remark}</td>
                        </tr>
                    </c:forEach>

                </table>


        </c:if>


            <h4 class="sub_title1"><p class="sub_p2">包月套餐剩余</p></h4>
            <c:if test="${package2}">


                <table class="sub_table1" border="1px solid #dadada" width="100%" >

                    <tr align="center">
                        <td>用户名</td>
                        <td>查询类型</td>
                        <td>分配者</td>
                        <td>有效月份</td>
                        <td>总条数</td>
                        <td>剩余条数</td>
                        <td>备注</td>
                    </tr>
                    <c:forEach var="p" items="${list2}"  varStatus="status">
                        <tr align="center">
                            <td>${p.userId}</td>
                            <td><c:if test="${p.businessId==1}">单条查询</c:if>
                                <c:if test="${p.businessId==2}">按年监控</c:if>
                            </td>
                            <td>${p.assignorId}</td>
                            <td>${p.yearMonth}</td>
                            <td>${p.assignQuantity}</td>
                            <td>${p.assignQuantity -p.usedQuantity}</td>
                            <td>${p.remark}</td>
                        </tr>
                    </c:forEach>

                </table>


        </c:if>
    </div>

</div>


</body>
</html>





