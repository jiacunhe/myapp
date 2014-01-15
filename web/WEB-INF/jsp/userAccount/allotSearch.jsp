<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/manage/css/ht_public.css" rel="stylesheet" type="text/css" />
    <link href="/manage/css/ht_sub.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .sub_tr1 ul{ width: 80%; float: left}
        .sub_tr1 ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
    </style>

    <title>包月套餐分配查询</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">包月套餐</a> >> <span>包月套餐分配</span></p>
    </div>
    <div class="ht_kongbai"></div>
    <div class="ht_rtbut">
        <ul>
            <li><img src="/manage/images/ht_ico02.png" /><p><a href="/userAccount/allotPackage">新增分配</a></p></li>
            <%--<li><img src="/manage/images/ht_ico03.png" /><p><a href="#">修改分配</a></p></li>
            <li><img src="/manage/images/ht_ico04.png" /><p><a href="#">删 除</a></p></li>--%>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="/manage/images/ht_ico09.png" /><p>查询</p></h4>
        <form method="post" action="/userAccount/allotSearch" class="ht_sub_form3" >
<c:if test="${thisUserType eq 'MANAGER' }">  <p>分配者： </p>
                        <span class="ht_span03">
                            <input type="text" name="allocatee"  class="ht_sub_input01" value="${result.allocatee}">
           <%--                 <select class="ht_sub_input013">
                            <option>全部</option>
                            <option>大客户一</option>
                            <option>大客户二</option>
                        </select>--%>
                        </span>
</c:if>
            <p>使用者： </p>
                        <span class="ht_span03">
                              <input type="text" name="receiver" class="ht_sub_input01" value="${result.receiver}">
        <%--                    <select class="ht_sub_input013">
                            <option>全部</option>
                            <option>大客户一</option>
                            <option>大客户二</option>
                        </select>--%>

                        </span>
            <p>套餐状态： </p>
                        <span class="ht_span03"><select class="ht_sub_input013" name="status">
                            <option value="1" <c:if test="${result.status eq '1' }">selected</c:if> >正常</option>
                            <option value="2" <c:if test="${result.status eq '2' }">selected</c:if> >失效</option>
                            <option value="" <c:if test="${ empty result.status }">selected</c:if>>全部</option>
                        </select></span>

            <input type="submit" value="开始查询"  class="ht_but_cx0" style="margin-left:10px;" />
        </form>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="/manage/images/ht_ico05.png" /><p>分配列表</p></h4>
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1">
            <tr class="ht_sub_tr1">
<c:if test="${thisUserType eq 'MANAGER' }">                 <th width="100">分配者</th> </c:if>
                <th width="100">分配账号</th>
                <th width="120">分配日期</th>
                <th width="120">生效方式</th>
                <th width="120">有效期(月)</th>
                <th width="80">分配条数</th>
                <th width="80">状态</th>
                <th>操作</th>
            </tr>
            <c:forEach  var="obj" items="${result.list}"   varStatus="status">
            <tr align="center"  <c:if test="${status.count%2==0}">class="ht_sub_tr1"</c:if> >

<c:if test="${thisUserType eq 'MANAGER' }">                 <td>${obj.assignorId}</td> </c:if>
                <td>${obj.userId}</td>
                <td>${obj.createTime}</td>
                <td><c:if test="${obj.effectiveType ==1 }">立即生效</c:if><c:if test="${obj.effectiveType==2}">次月生效</c:if></td>
                <td><c:if test="${obj.durationMonths < 0 }">长期</c:if><c:if test="${obj.durationMonths>0}">${obj.durationMonths}</c:if></td>
                <td>${obj.quantity}</td>
                <td><c:if test="${obj.status eq '1' }">正常</c:if><c:if test="${obj.status eq '2' }">失效</c:if></td>
                <td><c:if test="${obj.status eq '1' }"><a href="/userAccount/allotStop?id=${obj.id}&status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${result.page}"><img src="/manage/images/ht_sx.jpg" /></a></c:if></td>
            </tr>
  </c:forEach>
            <tr class="sub_tr1">
                <td colspan="<c:if test="${thisUserType eq 'MANAGER' }">8</c:if><c:if test="${thisUserType ne 'MANAGER' }">7</c:if>">

                    <ul>

                        <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${result.page -1}"  title="上一页"> < </a></li>



                        <c:if test="${result.page <= 9}">
                            <c:forEach var="i" begin="${1}" end="${result.page-1}" step="1">
                                <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <c:if test="${result.page > 9}">
                            <c:forEach var="i" begin="${result.page-5}" end="${result.page-1}" step="1">
                                <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${i}">${i}</a></li>
                            </c:forEach>
                        </c:if>


                        <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${result.page}" style="color:#FF0000">${result.page}</a></li>


                        <c:forEach var="j" begin="${result.page+1}" end="${result.page + 5}" step="1">
                            <c:if test="${j <= result.totalPage}">
                                <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${j}">${j}</a></li>
                            </c:if>
                        </c:forEach>

                        <li><a href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${result.page+1}" title="下一页"> > </a></li>
                        <li><span >共 ${result.countItem }条 ，当前第 <strong> ${result.page }</strong> / <span> <strong>${result.totalPage}</strong> </span> 页 </span> </li>
                    </ul>

                </td>
            </tr>

        </table>
    </div>
</div>



</body>
</html>
