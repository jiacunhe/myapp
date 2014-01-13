<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/public.css" rel="stylesheet" type="text/css" />
    <link href="../css/sub.css" rel="stylesheet" type="text/css" />
    <script src="../js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="../js/1.js" id=clientEventHandlersJS> </script>
    <title>个人中心</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>查询资费</span></p>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p3">查询资费</p></h4>
        <div class="sub_nr">
            <ul class="cxzf_list">
                <table>
                    <tr>
                        普通查询表
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td>查询类型</td>
                        <td>剩余条数</td>
                        <td>总条数</td>
                        <td>备注</td>
                    </tr>
                    <c:forEach var="p" items="${list}"  varStatus="status">
                        <tr>
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

                <table>
                    <tr>
                        包月查询表
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td>查询类型</td>
                        <td>分配者</td>
                        <td>有效月份</td>
                        <td>总条数</td>
                        <td>剩余条数</td>
                        <td>备注</td>
                    </tr>
                    <c:forEach var="p" items="${list2}"  varStatus="status">
                        <tr>
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
            </ul>
            <div class="clear"></div>
            <h4 class="sub_tx1"><p>享受更多优惠套餐，请<a href="#">联系客服</a></p></h4>
        </div>
    </div>


</div>


</body>
</html>





