<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <link rel="stylesheet" type="text/css"  href="${basePath}/images/dialog/dialog.css">
    <script src="${basePath}/images/dialog/dialog.js" type="text/javascript"></script>

    <title>订单详情</title>
    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
    </style>

</head>

<body>


<div class="content_right" style="height: 666px;">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>查询提交</span></p>
    </div>
    <div class="sub_rttop0">
        <ul class="ztxs">
            <li class="tj">1.提交</li>
            <li>2.查询中</li>
            <li>3.成功</li>

        </ul>
        <ul class="tiem">
            <li class="xz">${orderInfo.createTime}</li>

                <li class="xz">${orderInfo.verifyTime}</li>

                <li class="xz">${orderInfo.finishTime}</li>


        </ul>
    </div>
    <div class="content_right_nr" style="margin-top:16px;">
        <h4 class="sub_title1"><p class="sub_p9">订单—${orderInfo.id}</p></h4>
        <div class="sub_nr">
            <ul class="ddzt">
                <li style="width: 340px;">订单号：${orderInfo.id}</li>
                <li>当前订单状态：<span>
                    <c:choose>
                        <c:when test="${orderInfo.status ==1}">
                            <li class="tj">查询中</li>
                        </c:when>
                        <c:when test="${orderInfo.status ==2}">
                            <li class="tj">成功</li>
                        </c:when>
                        <c:when test="${orderInfo.status ==3}">
                            <li class="tj">无结果</li>
                        </c:when>
                        <c:when test="${orderInfo.status ==4}">
                            <li class="tj">未通过审核</li>
                        </c:when>
                        <c:when test="${orderInfo.status ==5}">
                            <li class="tj">账户支付失败</li>
                        </c:when>

                      </c:choose>
               </span></li>
            </ul>
            <div class="clear"></div>
            <!--p class="zhushi" style="border-bottom:none; text-indent:40px;">订单正在发货，请耐心等待。</p-->
        </div>
    </div>
    <div class="content_right_nr" style="margin-top:16px;">
        <h4 class="sub_title1"><p class="sub_p9">订单信息</p></h4>
        <div class="sub_nr" style="height:60px;">
            <ul class="dd_list1">
                <!--li>订单号：1005 <span>（<b>1</b>）</span></li-->
                <li>查询类型：${orderInfo.orderTypeName}</li>
                <li>查询条数：<span><b>${orderInfo.total}</b></span>条</li>
            </ul>
        </div>
    </div>

    <div class="content_right_nr" style="margin-top:16px;">
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table2" style="margin-top:0px;">
            <tr class="sub_tr1">
                <th>序号</th>
                <th>查询对象</th>
                <th>状态</th>
            </tr>
            <c:forEach  var="obj" items="${objects.list}"   varStatus="status">
                <tr class="sub_tr1">
                    <td>${object.page*5+status.count}</td>
                    <td>${obj.objCode } |  ${obj.objName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${obj.status ==1}">
                                <li class="tj">查询中</li>
                            </c:when>
                            <c:when test="${obj.status ==2}">
                                <li class="tj">成功</li>
                            </c:when>
                            <c:when test="${obj.status ==3}">
                                <li class="tj">无结果</li>
                            </c:when>
                            <c:when test="${obj.status ==4}">
                                <li class="tj">未通过审核</li>
                            </c:when>
                            <c:when test="${obj.status ==5}">
                                <li class="tj">账户支付失败</li>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

            <tr class="sub_tr1">
                <td colspan="4">

                    <ul>

                        <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${objects.page -1}"  title="上一页"> < </a></li>



                        <c:if test="${objects.page <= 9}">
                            <c:forEach var="i" begin="${1}" end="${objects.page-1}" step="1">
                                <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <c:if test="${objects.page > 9}">
                            <c:forEach var="i" begin="${objects.page-5}" end="${objects.page-1}" step="1">
                                <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${objects.page}" style="color:#FF0000">${objects.page}</a></li>


                        <c:forEach var="j" begin="${objects.page+1}" end="${objects.page + 5}" step="1">
                            <c:if test="${j <= objects.totalpage}">
                                <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${j}">${j}</a></li>
                            </c:if>
                        </c:forEach>

                        <li><a href="${basePath}/order/detail?id=${orderInfo.id}&page=${objects.page+1}" title="下一页"> > </a></li>
                        <li><span >共 ${objects.totalitem }条 ，当前第 <strong> ${objects.page }</strong> / <span> <strong>${objects.totalpage}</strong> </span> 页 </span> </li>
                    </ul>

                </td>
            </tr>
        </table>
    </div>

</div>

</body>
</html>