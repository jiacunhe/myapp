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
    <title>套餐购买</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>套餐购买</span></p>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p3">套餐购买</p></h4>
        <div class="sub_nr">
            <ul class="tcgm_list">
                <li>套餐名称
                    <span>套餐内容</span>
                    <td>价格</td>
                </li>
              <c:forEach var="p" items="${list}"  varStatus="status">
                 <li><input type="checkbox" />${p.packageName}
                     <span>（查询条数${p.quantityA}条、监控企业或个人条数${p.quantityB}条）</span>
                     <td>${p.price}元</td>
                 </li>
              </c:forEach>
            </ul>


            <div class="pagination" style="height:30px; line-height:30px;">
                <ul>

                    <li><a href="/package/buy?page=${page - 1}">前一页</a></li>



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

                    <li><a href="/package/buy?page=${page + 1}">下一页</a></li>
                    <li><span class="STYLE4">共 ${totalitem }条 ，当前第 <strong> ${page }</strong> / <span class="STYLE22"> <strong>${totalpage}</strong> </span> 页 </span> </li>
                </ul>


            </div>
            <p class="button2" style="padding-left:110px; margin-top:40px;"><input type="button" value="购买" class="but_qd" /><input type="button" value="取消" class="but_qx" /></p>
            <h4 class="sub_tx1" style=" margin:20px 0px 30px 0px;"><p>享受更多优惠套餐，请<a href="#">联系客服</a></p></h4>
        </div>
    </div>






</div>


</body>
</html>
