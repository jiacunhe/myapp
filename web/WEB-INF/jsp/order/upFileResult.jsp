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
<div class="sub_nr" style="width: 100%; height:660px; background-color:#eeeeee;">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">信息查询</a> >> <span>
            <c:if test="${fileOrderType == 1}">企业查询</c:if> <c:if test="${fileOrderType == 2}">人员查询</c:if><c:if test="${fileOrderType == 3}">对外投资查询</c:if>
            </span>>> <span>批量导入</span></p>
    </div>
    <h4 class="sub_title1" style="margin-top: 10px; margin-right: 2px; margin-left: 5px;"><p class="sub_p5">导入数据</p></h4>
    <table style="margin-top: 10px; margin-right: 2px; margin-left: 5px; width: 98%" cellpadding="0" cellspacing="0" class="sub_table1" style="margin-left: 5px;">
          <tr class="sub_tr1" style="border-left: 1px;">
            <th style="border-left: 1px solid #dadada; ">code</th>
            <th style="border-left: 1px solid #dadada; ">name</th>
            <th style="border-left: 1px solid #dadada; ">remark</th>
          </tr>

          <c:forEach  var="obj" items="${upObjList}"   varStatus="status">
          <tr <c:if test="${status.count%2==0}">class="sub_tr1"</c:if>>
            <td style="border-left: 1px solid #dadada; ">${obj[0]}</td>
            <td style="border-left: 1px solid #dadada; ">${obj[1]}</td>
            <td style="border-left: 1px solid #dadada; ">${obj[2]}</td>
          </tr>
        </c:forEach>

        <tr class="page">
            <td colspan="3">

                <ul>
                    <li><a href="/order/upFileResult?page=${1}"  title="首页"> << </a></li>
                    <li><a href="/order/upFileResult?page=${page -1}"  title="上一页"> < </a></li>



                    <c:if test="${page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${page-1}" step="1">
                            <li><a href="/order/upFileResult?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${page > 9}">
                        <c:forEach var="i" begin="${page-5}" end="${page-1}" step="1">
                            <li><a href="/order/upFileResult?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="/order/upFileResult?page=${page}" style="color:#FF0000">${page}</a></li>


                    <c:forEach var="j" begin="${page+1}" end="${page + 5}" step="1">
                        <c:if test="${j <= totalPage}">
                            <li><a href="/order/upFileResult?page=${j}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="/order/upFileResult?page=${page +1}" title="下一页"> > </a></li>
                    <li><a href="/order/upFileResult?page=${totalPage}" title="末页"> >> </a></li>
                    <li><span >共 ${countItem }条 ，当前第 <strong> ${page }</strong> / <span> <strong>${totalPage}</strong> </span> 页 </span> </li>
                </ul>

            </td>
        </tr>


    </table>

    <p> <a href="/order/createOrderByFile">生成订单</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a href="/welcome.jsp">放弃</a></p>
</div>
</body>
</html>