<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>subsidiary</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
        }
        table tr td{ padding-left: 5px;}
        .page ul{ width: 80%; float: left}
        .page ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
        -->
    </style>
</head>
<body>
<div class="sub_nr" style="width: 498px; height: 270px; background-color:#ffffff;">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="15%">序 号</th>
            <th width="65%">消息时间</th>
            <th width="20%">查看</th>
        </tr>

        <c:forEach  var="obj" items="${objects.list}"   varStatus="status">
            <tr <c:if test="${status.count%2==0}">class="sub_tr1"</c:if>>
                <td style="text-align:center">${objects.page*5+status.count}</td>


                <td>${obj.messageTime }</td>

                <td  style="text-align:center">
                    <a href="javascript:viewer(${obj.id})"><img src="${basePath}/images/26.png" alt="查看" title="查看"></a>

                </td>

            </tr>
        </c:forEach>
        <tr class="page">
            <td colspan="3">

                <ul>

                    <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${objects.page -1}&orderType=${objects.orderType}"  title="上一页"> < </a></li>



                    <c:if test="${objects.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${objects.page-1}" step="1">
                            <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${i}&orderType=${objects.orderType}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${objects.page > 9}">
                        <c:forEach var="i" begin="${objects.page-5}" end="${objects.page-1}" step="1">
                            <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${i}&orderType=${objects.orderType}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${objects.page}&orderType=${objects.orderType}" style="color:#FF0000">${objects.page}</a></li>


                    <c:forEach var="j" begin="${objects.page+1}" end="${objects.page + 5}" step="1">
                        <c:if test="${j <= objects.totalPage}">
                            <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${j}&orderType=${objects.orderType}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="${basePath}/order/subsidiary?id=${objects.orderDetailId}&page=${objects.page +1}&orderType=${objects.orderType}" title="下一页"> > </a></li>
                    <li><span >共 ${objects.totalItem }条 ，当前第 <strong> ${objects.page }</strong> / <span> <strong>${objects.totalPage}</strong> </span> 页 </span> </li>
                </ul>

            </td>
        </tr>



    </table>
    <script type="text/javascript">
        function viewer(id){

          alert("sorry,测试阶段，无具体数据信息");
        }

    </script>
</div>
</body>
</html>