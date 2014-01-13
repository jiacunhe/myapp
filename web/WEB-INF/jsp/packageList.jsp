<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="../css/ht_sub.css" rel="stylesheet" type="text/css" />

    <title>套餐制定</title>
    <script>
        function Function1(id,type,userId,order,page)
        {

            var r=confirm("您确定要暂停这个套餐吗？");
            if(r==true){
                window.location.href='/package/updateStatus?id='+id+'&type='+type+'&userId='+userId+'&order='+order+'&page='+page+'&status=${status}&status2=off';
            }
        }
    </script>
    <script>
        function Function2(id,type,userId,order,page)
        {
            var r=confirm("您确定要开启这个套餐吗？");
            if(r==true){
                window.location.href='/package/updateStatus?id='+id+'&type='+type+'&userId='+userId+'&order='+order+'&page='+page+'&status=${status}&status2=on';
            }
        }
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>套餐制定</span></p>
    </div>
    <div class="ht_kongbai"></div>
    <div class="ht_rtbut">
        <ul>
            <li><img src="../images/ht_ico02.png" /><p><a href="/packageInsert.jsp" >新 增</a></p></li>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="../images/ht_ico09.png" /><p>查询</p></h4>
        <form method="post" action="/package/list" class="ht_sub_form3" >
            <p>套餐状态： </p>
                        <span class="ht_span03"><select  name="status" class="ht_sub_input014">
                            <option value="" >全部</option>
                            <option value="on" <c:if test="${status eq 'on'}">selected </c:if> >开通</option>
                            <option value="off"<c:if test="${status eq 'off'}">selected </c:if>>失效</option>
                        </select></span>
            <p>套餐类型： </p>
                        <span class="ht_span03"><select name="type" class="ht_sub_input013">
                            <option value="">全部</option>
                            <option value="public" <c:if test="${type eq 'public'}">selected </c:if>>公有套餐</option>
                            <option value="private" <c:if test="${type eq 'private'}">selected </c:if>>私有套餐</option>
                            <option value="vip" <c:if test="${type eq 'vip'}">selected </c:if>>大客户套餐</option>

                        </select></span>
            <p>价格排序： </p>
                        <span class="ht_span03"><select name="order" value="${order}" class="ht_sub_input013">
                            <option value="">不排序</option>
                            <option value="down" <c:if test="${order eq 'down'}">selected </c:if>>价格从高到低</option>
                            <option value="up" <c:if test="${order eq 'up'}">selected </c:if>>价格从低到高</option>

                        </select></span>
            <p style="margin-left:0px;">用户名：</p>
            <input name="userId" id="userId" type="text" value="${userId}" class="ht_sub_input01"/><br />
            <input type="submit" value="开始查询"  class="ht_but_cx"/>
        </form>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="../images/ht_ico05.png" /><p>列表</p></h4>
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1">
            <tr class="ht_sub_tr1">
                <th width="60">套餐编号</th>
                <th width="60">用户ID</th>
                <th width="100">套餐名称</th>
                <th width="100">套餐类型</th>
                <th width="100">查询类型</th>
                <th width="100">查询数量</th>
                <th width="100">查询类型</th>
                <th width="100">查询数量</th>
                <th width="70">价格（元）</th>
                <th width="70">套餐状态</th>
                <th width="130">操作</th>
            </tr>


        <c:forEach var="p" items="${list}"  varStatus="status">

            <tr align="center">
                <td>${(page-1)*5+status.count}</td>

                <td>${p.userId}</td>
                <td>${p.packageName}</td>
                <td> <c:if test="${p._type eq 'public'}">公有套餐</c:if>
                    <c:if test="${p._type  eq 'private'}">私有套餐</c:if>
                    <c:if test="${p._type  eq 'vip'}">大客户套餐</c:if>
               </td>
                <td>${p.businessNameA}</td>
                <td>${p.quantityA}</td>
                <td>${p.businessNameB}</td>
                <td>${p.quantityB}</td>
                <td>${p.price}</td>
                <td><c:choose><c:when test="${p.status=='on'}">开通</c:when>
                    <c:otherwise>失效</c:otherwise>
                </c:choose></td>
                <c:choose>
                    <c:when test="${p.status=='on'}">
                        <td><input type="button" value="" onclick="Function1(${p.id},'${type}','${userId}','${order}',${page})" class="ht_sub_iput002">
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td><input type="button" value="" onclick="Function2(${p.id},'${type}','${userId}','${order}',${page})" class="ht_sub_iput001">
                        </td>
                    </c:otherwise>
                </c:choose>
              </tr>
         </c:forEach>



        </table>
    </div>


<div class="pagination" style="height:30px; line-height:30px;">
    <ul>

        <li><a href="/package/list?page=${page - 1}">前一页</a></li>



        <c:if test="${page <= 9}">
            <c:forEach var="i" begin="${1}" end="${page-1}" step="1">
                <li><a href="/package/list?page=${i}">${i}</a></li>
            </c:forEach>
        </c:if>


        <c:if test="${page > 9}">
            <c:forEach var="i" begin="${page-5}" end="${page-1}" step="1">
                <li><a href="/package/list?page=${i}">${i}</a></li>
            </c:forEach>
        </c:if>


        <li><a href="/package/list?page=${page}" style="color:#FF0000">${page}</a></li>


        <c:forEach var="j" begin="${page+1}" end="${page + 5}" step="1">
            <c:if test="${j <= totalpage}">
                <li><a href="/package/list?page=${j}">${j}</a></li>
            </c:if>
        </c:forEach>

        <li><a href="/package/list?page=${page + 1}">下一页</a></li>
        <li><span class="STYLE4">共 ${totalitem }条 ，当前第 <strong> ${page }</strong> / <span class="STYLE22"> <strong>${totalpage}</strong> </span> 页 </span> </li>
    </ul>
 </div>
</div>


</body>
</html>
