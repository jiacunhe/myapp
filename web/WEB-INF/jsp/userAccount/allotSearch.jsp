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
        .gy_foot{ height: 20px; line-height: 20px; overflow: hidden; margin-top: 30px; margin-bottom: 15px;}
        .gy_foot a{ padding: 3px; float: left}
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
            <li><a href="/userAccount/allotPackage"><img src="/manage/images/ht_ico02.png" /><p>新增分配</p></a></li>
        </ul>
    </div>

    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="/manage/images/ht_ico09.png" /><p>查询</p></h4>
        <form method="post" action="/userAccount/allotSearch" class="ht_sub_form3" >
<c:if test="${thisUserType eq 'MANAGER' }">  <p>分配者： </p>
                        <span class="ht_span03">
                            <input type="text" name="allocatee"  class="ht_sub_input01" value="${result.allocatee}">
                        </span>
</c:if>
            <p>分配账号： </p>
                        <span class="ht_span03">
                              <input type="text" name="receiver" class="ht_sub_input01" value="${result.receiver}">

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
                <td><c:if test="${obj.status eq '1' }"><a href="/userAccount/allotStop?id=${obj.id}&status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page=${result.page}"><img style="width:42px; height:22px;  " src="/manage/images/ht_sx2.jpg" /></a></c:if></td>
            </tr>
  </c:forEach>
            <tr class="sub_tr1">
                <td colspan="<c:if test="${thisUserType eq 'MANAGER' }">8</c:if><c:if test="${thisUserType ne 'MANAGER' }">7</c:if>">



                    <div class="gy_foot">
                        <div style="float: left; margin-left: 20px; display: inline;">
                            页次：${result.page}/${result.totalPage}页 &nbsp;
                            总记录数：${result.countItem}条
                        </div>
                        <div style="float: right; margin-right: 20px; display: inline">
                            <a href="javascript:go2Page(1)" title="首页" style="cursor: hand;">
                                <img src="${pageContext.request.contextPath}/images/firstPage.png" style="float: left; margin: 3px;"/>
                            </a>
                            <c:forEach var="i" begin="${result.page - 5>=1?result.page - 5:1}" end="${result.page + 4}" step="1">
                                <c:if test="${i <= result.totalPage}">

                                    <a href="javascript:go2Page(${i});"  <c:if test="${i == result.page}">style="color:#000000; font-weight: 600;"     </c:if>>${i}</a>

                                </c:if>
                            </c:forEach>
                            <a href="javascript: go2Page(${result.totalPage})" title="尾页" style="cursor: hand;">
                                <img src="${pageContext.request.contextPath}/images/lastPage.png" style="float: left; margin: 3px 8px 3px 3px;"/>
                            </a>

                            转到第 <input id="pn" onFocus="this.select();" maxlength="2" type="text" value="1" name="currPage" tabindex="0" style="width: 18px; height: 14px; text-align: center; text-indent: 0"/> 页
                            <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="go2Page(document.getElementById('pn').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>
                        </div>
                    </div>
                    <script type="text/javascript">
                        function go2Page(pageNo) {
                            if(pageNo == undefined || pageNo==null || pageNo=="")pageNo=1;
                            window.location.href="/userAccount/allotSearch?status=${result.status}&allocatee=${result.allocatee}&receiver=${result.receiver}&page="+pageNo;
                        }
                    </script>

                </td>
            </tr>

        </table>
    </div>
</div>



</body>
</html>
