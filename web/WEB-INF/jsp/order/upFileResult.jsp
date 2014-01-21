<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />
    <title>subsidiary</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
        }
        table th{border: 1px solid #dadada;}
        table tr{border: 1px solid #dadada;}
        table tr td{ padding-left: 5px;border: 1px solid #dadada;}
        .page ul{ width: 80%; float: left}
        .page ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
        .commitfield{height: 33px; line-height: 33px; margin-top: 25px;padding-left: 33px;}
        .commitfield a{width:90px; height:28px; border:none; background:url(/images/but_bg2.gif) no-repeat; margin-left: 20px; text-align:center; float: left; color: #ffffff;}
        .loadingback{Z-INDEX: 998; FILTER: alpha(opacity=60); LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 100%; BACKGROUND-COLOR: #ffffff; opacity: 0.6}
        .loading{ POSITION: absolute;Z-INDEX: 999;width:200px;height:18px; line-height: 18px;}

        -->
    </style>
</head>
<body>
<div class="sub_nr" style="width: 100%; height:660px; background-color:#eeeeee;">
    <div class="yemei">
        <p>您当前所在位置： <a href="#">信息查询</a> >> <span>
            <c:if test="${fileOrderType == 1}">企业查询</c:if> <c:if test="${fileOrderType == 2}">人员查询</c:if><c:if test="${fileOrderType == 3}">对外投资查询</c:if>
            </span>>> <span>批量导入</span></p>
    </div>
    <h4 class="sub_title1" style="margin-top: 10px; margin-right: 2px; margin-left: 5px;"><p class="sub_p5">导入数据</p></h4>
    <table  class="sub_table1" style="margin-left: 5px;margin-top: 10px; margin-right: 25px; margin-left: 5px; width:748px" cellpadding="0" cellspacing="0">
          <tr class="sub_tr1">
            <th class="bordebottom">证件号</th>
            <th class="bordebottom">名称</th>
            <th class="bordebottom">备注</th>
              <th class="bordebottom">证件类型</th>
          </tr>

          <c:forEach  var="obj" items="${upObjList}"   varStatus="status">
          <tr <c:if test="${status.count%2==0}">class="sub_tr1"</c:if>>
            <td class="bordebottom">${obj[0]}</td>
            <td class="bordebottom">${obj[1]}</td>
            <td class="bordebottom">${obj[2]}</td>
            <td class="bordebottom">${obj[3]}</td>
          </tr>
        </c:forEach>

        <tr class="page">
            <td colspan="4">

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

    <p class="commitfield"> <a href="/order/createOrderByFile" onclick="waiting()">生成订单</a> <a href="javascript:goback()">放弃</a></p>
</div>


<script type="text/javascript">
    function waiting()
    {
        var dialogMask = document.createElement("div");
        dialogMask.className="loadingback";
        document.body.appendChild(dialogMask);
        dialogMask.style.height=document.body.clientHeight+"px";
        var loading = document.createElement("div");
        loading.className="loading";
        document.body.appendChild(loading);
        loading.innerHTML="<span><img src='/images/loading.gif'></span><span>正在处理，请稍候...</span>";
        loading.style.left=(document.body.scrollWidth-58)/2;
        loading.style.top=(document.body.scrollHeight-20)/2;
    }

    function goback(){
        <c:if test="${fileOrderType == 1}">window.location.href="/order/group";</c:if>
        <c:if test="${fileOrderType == 2}">window.location.href="/order/person";</c:if>
        <c:if test="${fileOrderType == 3}">window.location.href="/order/investment";</c:if>
    }

</script>
</body>
</html>