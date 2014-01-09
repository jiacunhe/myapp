<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css"  href="/images/dialog/dialog.css">
    <script src="/images/dialog/dialog.js" type="text/javascript"></script>

    <script language="javascript" src="/js/1.js"> </script>
    <title>订单详情</title>
    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
    </style>

</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>我的订单</span></p>
    </div>
    <div class="sub_rttop0">
        <ul class="ztxs">
            <li class="tj">1.提交订单</li>
            <c:choose>
                <c:when test="${orderInfo.status eq '3'}">
                    <li class="tj">2.通过审核</li>
                </c:when>
                <c:when test="${orderInfo.status eq '4'}">
                    <li class="tj">2.查询中</li>
                </c:when>
                <c:otherwise>
                        <li>2.审核中</li>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${orderInfo.status eq '5'}">
                    <li class="tj">3.成功</li>
                </c:when>
                <c:when test="${orderInfo.status eq '6'}">
                    <li class="tj">3.查询无果</li>
                </c:when>
                <c:when test="${orderInfo.status eq '7'}">
                    <li class="tj">3.未通过审核</li>
                </c:when>
                <c:when test="${orderInfo.status eq '8'}">
                    <li class="tj">3.账户支付失败</li>
                </c:when>
                <c:otherwise>
                    <li>3.</li>
                </c:otherwise>
            </c:choose>
        </ul>
        <ul class="tiem">
            <li class="xz">${orderInfo.createTime}</li>
            <c:if test="${orderInfo.status<5}">
                <li>${orderInfo.verifyTime}</li>
            </c:if>
            <c:if test="${orderInfo.status>4}">
                <li>${orderInfo.finishTime}</li>
            </c:if>

        </ul>
    </div>
    <div class="content_right_nr" style="margin-top:16px;">
        <h4 class="sub_title1"><p class="sub_p9">订单—${orderInfo.id}</p></h4>
        <div class="sub_nr">
            <ul class="ddzt">
                <li style="width: 340px;">订单号：${orderInfo.id}</li>
                <li>当前订单状态：<span>
                    <c:choose>
                        <c:when test="${orderInfo.status<3}">
                         审核中</li>
                        </c:when>
                        <c:when test="${orderInfo.status ==3}">
                            <li class="tj">通过审核、查询中</li>
                        </c:when>
                        <c:when test="${orderInfo.status eq '4'}">
                            <li class="tj">等待查询结果</li>
                        </c:when>
                        <c:when test="${orderInfo.status eq '5'}">
                            <li class="tj">成功</li>
                        </c:when>
                        <c:when test="${orderInfo.status eq '6'}">
                            <li class="tj">无查询结果</li>
                        </c:when>
                        <c:when test="${orderInfo.status eq '7'}">
                            <li class="tj">未通过审核</li>
                        </c:when>
                        <c:when test="${orderInfo.status eq '8'}">
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
        <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table2" style="margin-top:0px;">
            <tr class="sub_tr1">
                <th>序号</th>
                <th>查询对象</th>
                <th>状态</th>
                <th>&nbsp;</th>
            </tr>
            <c:forEach  var="obj" items="${objects.list}"   varStatus="status">
                <tr class="sub_tr1">
                    <td>${object.page*5+status.count}</td>
                    <td>${obj.objCode } |  ${obj.objName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${obj.status<3}">
                                <li class="tj">审核中</li>
                            </c:when>
                            <c:when test="${obj.status eq '3'}">
                                <li class="tj">通过审核</li>
                            </c:when>
                            <c:when test="${obj.status eq '4'}">
                                <li class="tj">查询中</li>
                            </c:when>
                            <c:when test="${obj.status eq '5'}">
                                <li class="tj">成功</li>
                            </c:when>
                            <c:when test="${obj.status eq '6'}">
                                <li class="tj">无查询结果</li>
                            </c:when>
                            <c:when test="${obj.status eq '7'}">
                                <li class="tj">未通过审核</li>
                            </c:when>
                            <c:when test="${obj.status eq '8'}">
                                <li class="tj">账户支付失败</li>
                            </c:when>
                        </c:choose>
                    </td>
                    <td> <c:if test="${obj.status eq '5'}"><a href="/order/result?id=${obj.id}&orderType=${orderInfo.orderType}">查看结果</a></c:if>&nbsp;</td>
                </tr>
            </c:forEach>

            <tr class="sub_tr1">
                <td colspan="4">

                    <ul>

                        <li><a href="/order/detail?id=${orderInfo.id}&page=${objects.page -1}"  title="上一页"> < </a></li>



                        <c:if test="${objects.page <= 9}">
                            <c:forEach var="i" begin="${1}" end="${objects.page-1}" step="1">
                                <li><a href="/order/detail?id=${orderInfo.id}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <c:if test="${objects.page > 9}">
                            <c:forEach var="i" begin="${objects.page-5}" end="${objects.page-1}" step="1">
                                <li><a href="/order/detail?id=${orderInfo.id}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <li><a href="/order/detail?id=${orderInfo.id}&page=${objects.page}" style="color:#FF0000">${objects.page}</a></li>


                        <c:forEach var="j" begin="${objects.page+1}" end="${objects.page + 5}" step="1">
                            <c:if test="${j <= objects.totalpage}">
                                <li><a href="/order/detail?id=${orderInfo.id}&page=${j}">${j}</a></li>
                            </c:if>
                        </c:forEach>

                        <li><a href="/order/detail?id=${orderInfo.id}&page=${objects.page+1}" title="下一页"> > </a></li>
                        <li><span >共 ${objects.totalitem }条 ，当前第 <strong> ${objects.page }</strong> / <span> <strong>${objects.totalpage}</strong> </span> 页 </span> </li>
                    </ul>

                </td>
            </tr>
        </table>
    </div>

</div>

</body>
</html>