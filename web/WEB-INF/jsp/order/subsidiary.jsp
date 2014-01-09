<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/sub.css" rel="stylesheet" type="text/css" />
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
            <th width="65%">查询条件</th>
            <th width="20%">查看</th>
        </tr>

        <c:forEach  var="obj" items="${objects.list}"   varStatus="status">
            <tr <c:if test="${status.count%2==0}">class="sub_tr1"</c:if>>
                <td style="text-align:center">${object.page*5+status.count}</td>
                <td>${obj.objCode } |  ${obj.objName}</td>

                <td  style="text-align:center"> <c:if test="${obj.status eq '5'}"><a href="javascript:viewer('${obj.id}')">查看结果</a></c:if>
                    <c:if test="${obj.status ne '5'}">${obj.statusName}</c:if>
                                                    &nbsp;</td>
            </tr>
        </c:forEach>
        <tr class="page">
            <td colspan="3">

                <ul>

                    <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${objects.page -1}&type=${objects.type}"  title="上一页"> < </a></li>



                    <c:if test="${objects.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${objects.page-1}" step="1">
                            <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${i}&type=${objects.type}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${objects.page > 9}">
                        <c:forEach var="i" begin="${objects.page-5}" end="${objects.page-1}" step="1">
                            <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${i}&type=${objects.type}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${objects.page}&type=${objects.type}" style="color:#FF0000">${objects.page}</a></li>


                    <c:forEach var="j" begin="${objects.page+1}" end="${objects.page + 5}" step="1">
                        <c:if test="${j <= objects.totalpage}">
                            <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${j}&type=${objects.type}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="/order/subsidiary?orderId=${objects.orderId}&page=${objects.page +1}&type=${objects.type}" title="下一页"> > </a></li>
                    <li><span >共 ${objects.totalitem }条 ，当前第 <strong> ${objects.page }</strong> / <span> <strong>${objects.totalpage}</strong> </span> 页 </span> </li>
                </ul>

            </td>
        </tr>



    </table>
    <script type="text/javascript">
        function viewer(id){
            parent.window.location.href="/order/result?id="+id;
        }

    </script>
</div>
</body>
</html>