<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>

    <title>套餐分配</title>
    <style type="text/css">

        .pagination{ width: 100%; height: 33px; line-height: 33px;}
        .pagination ul{width: 100%; height: 33px; line-height: 33px; padding-left: 20px;}
        .pagination ul li{ list-style: none; float: left}
        .pagination ul li a{ padding: 3px; width: 20px;}
        .gy_foot{ height: 20px; line-height: 20px; overflow: hidden; margin-top: 30px; margin-bottom: 15px;}
        .gy_foot a{ padding: 3px; float: left}
    </style>

</head>

<body>

<form action="${basePath}/package/assignUser" method="post">
<div class="content_right" style="height:666px">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">客户管理</a> >> <span>套餐分配</span></p>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p3">套餐分配</p></h4>
        <div class="sub_nr">
            <input id="userId" name="userId" value="${userId}" type="hidden" />
            <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1" style="margin-top:40px;">
                <tr align="center">
                    <th width="80"></th>
                    <th width="100">套餐名称</th>
                    <th><p>套餐内容</p></th>
                    <th width="100">套餐价格</th>
                </tr>
                <c:forEach var="p" items="${list}"  varStatus="status">
                    <tr align="center">
                        <td><input type="radio" id="packageId" name="packageId" value="${p.id}"   /></td>
                        <td>${p.packageName}</td>
                        <td><p>查询条数${p.quantityA}条(查询包含：按公司查询、按个人查询以及对外投资查询)</p></td>
                        <td>${p.price}元</td>
                    </tr>
                </c:forEach>
            </table>





            <div class="pagination" >




                <div class="gy_foot">
                    <div style="float: left; margin-left: 20px; display: inline;">
                        页次：${page}/${totalpage}页 &nbsp;
                        总记录数：${totalitem}条
                    </div>
                    <div style="float: right; margin-right: 20px; display: inline">
                        <a href="javascript:go2Page(1)" title="首页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/firstPage.png" style="float: left; margin: 3px;"/>
                        </a>
                        <c:forEach var="i" begin="${page - 5>=1?page - 5:1}" end="${page + 4}" step="1">
                            <c:if test="${i <= totalpage}">

                                <a href="javascript:go2Page(${i});"  <c:if test="${i == page}">style="color:#000000; font-weight: 600;"     </c:if>>${i}</a>

                            </c:if>
                        </c:forEach>
                        <a href="javascript: go2Page(${totalpage})" title="尾页" style="cursor: hand;">
                            <img src="${pageContext.request.contextPath}/images/lastPage.png" style="float: left; margin: 3px 8px 3px 3px;"/>
                        </a>

                        转到第 <input id="pn" onFocus="this.select();" maxlength="2" type="text" value="1" name="currPage" tabindex="0" style="width: 18px; height: 14px; text-align: center; text-indent: 0"/> 页
                        <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="go2Page(document.getElementById('pn').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>
                    </div>
                </div>
                <script type="text/javascript">
                    function go2Page(pageNo) {
                        if(pageNo == undefined || pageNo==null || pageNo=="")pageNo=1;
                        window.location.href="${basePath}/package/buy?page="+pageNo;
                    }
                </script>



            </div>
            <p class="button2" style="padding-left:110px; margin-top:40px;"><input id="assign" type="submit" value="分配" class="but_qd" /><input type="reset" value="取消" class="but_qx" /></p>
            <h4 class="sub_tx1" style=" margin:20px 0px 30px 0px;"><p>享受更多优惠套餐，请<a href="#">联系客服</a></p></h4>


        </div>
    </div>






</div>
</form>

</body>
</html>
