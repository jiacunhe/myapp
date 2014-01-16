<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${basePath}/css/public.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/css/sub.css" rel="stylesheet" type="text/css" />
    <script src="${basePath}/js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input,dt');
    </script>
    <script language=javascript src="${basePath}/js/1.js" id=clientEventHandlersJS> </script>
    <title>套餐购买</title>
    <style type="text/css">

        .pagination{ width: 100%; height: 33px; line-height: 33px;}
        .pagination ul{width: 100%; height: 33px; line-height: 33px; padding-left: 20px;}
        .pagination ul li{ list-style: none; float: left}
        .pagination ul li a{ padding: 3px; width: 20px;}
    </style>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>套餐购买</span></p>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p3">套餐购买</p></h4>
        <div class="sub_nr">

            <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1" style="margin-top:40px;">
                <tr align="center">
                    <th width="80"></th>
                    <th width="100">套餐名称</th>
                    <th><p>套餐内容</p></th>
                    <th width="100">套餐价格</th>
                </tr>
               <c:forEach var="p" items="${list}"  varStatus="status">
                <tr align="center">
                    <td><input type="checkbox" /></td>
                    <td>${p.packageName}</td>
                    <td><p>（查询条数${p.quantityA}条、监控企业或个人条数${p.quantityB}条）</p></td>
                    <td>${p.price}元</td>
                </tr>
               </c:forEach>
            </table>





            <div class="pagination" >
                <ul>

                    <li><a href="/package/buy?page=${page - 1}"> 上一页</a></li>



                    <c:if test="${page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${page-1}" step="1">
                            <li><a href="/package/buy?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <c:if test="${page > 9}">
                        <c:forEach var="i" begin="${page-5}" end="${page-1}" step="1">
                            <li><a href="/package/buy?page=${i}">${i}</a></li>
                        </c:forEach>
                    </c:if>


                    <li><a href="/package/buy?page=${page}" style="color:#FF0000">${page}</a></li>


                    <c:forEach var="j" begin="${page+1}" end="${page + 5}" step="1">
                        <c:if test="${j <= totalpage}">
                            <li><a href="/package/buy?page=${j}">${j}</a></li>
                        </c:if>
                    </c:forEach>

                    <li><a href="/package/buy?page=${page + 1}"> 下一页 </a></li>
                    <li><span class="STYLE4" style="margin-left: 20px">共 ${totalitem } 条  当前第 <strong> ${page }</strong> / <span class="STYLE22"> <strong>${totalpage}</strong> </span> 页 </span> </li>
                </ul>


            </div>
            <p class="button2" style="padding-left:110px; margin-top:40px;"><input type="button" value="购买" class="but_qd" /><input type="button" value="取消" class="but_qx" /></p>
            <h4 class="sub_tx1" style=" margin:20px 0px 30px 0px;"><p>享受更多优惠套餐，请<a href="#">联系客服</a></p></h4>
        </div>
    </div>






</div>


</body>
</html>
