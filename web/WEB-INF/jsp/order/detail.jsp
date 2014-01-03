<%--
  Created by IntelliJ IDEA.
  User: yang
  Date: 13-12-31
  Time: 下午1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
    <script src="/images/dialog/dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="all"  href="/images/dialog/dialog.css">
</head>
<body>                         <pre>
订单号：${orderInfo.id}
状态：  ${orderInfo.status}
createTime: ${orderInfo.createTime}
verifyTime: ${orderInfo.verifyTime}
finishTime: ${orderInfo.finishTime}
                                </pre>


             <pre>
订单类型：${orderInfo.orderTypeName}
条数： <a href="javascript:openContent()"> ${orderInfo.total} </a>
                                </pre>

 <div id="content" style="display:none">
      <table style="font-size: 12px">
     <tr>
         <td>序号</td>
         <td>查询对象</td>
         <td>状态</td>
         <td>&nbsp;</td>
     </tr>
     <c:forEach  var="obj" items="${objects.list}"   varStatus="status">
         <tr>
             <td>${object.page*5+status.count}</td>
             <td>${obj.objCode }: ${obj.objName}</td>
             <td>${obj.status}</td>
             <td><a href="/order/result?id=${obj.id}&orderType=${orderInfo.orderType}">查看结果</a></td>
         </tr>
     </c:forEach>

          <tr>
                  <td colspan="4">

                      <ul>

                          <li><a href="javascript:search('nothing',${objects.page -1})">Prev</a></li>



                          <c:if test="${objects.page <= 9}">
                              <c:forEach var="i" begin="${1}" end="${objects.page-1}" step="1">
                                  <li><a href="javascript:search('nothing',${i})">${i}</a></li>
                              </c:forEach>
                          </c:if>


                          <c:if test="${objects.page > 9}">
                              <c:forEach var="i" begin="${objects.page-5}" end="${objects.page-1}" step="1">
                                  <li><a href="javascript:search('nothing',${i})">${i}</a></li>
                              </c:forEach>
                          </c:if>


                          <li><a href="javascript:search('nothing',${objects.page})" style="color:#FF0000">${objects.page}</a></li>


                          <c:forEach var="j" begin="${objects.page+1}" end="${objects.page + 5}" step="1">
                              <c:if test="${j <= objects.totalpage}">
                                  <li><a href="javascript:search('nothing',${j})">${j}</a></li>
                              </c:if>
                          </c:forEach>

                          <li><a href="javascript:search('nothing',${objects.page + 1})">Next</a></li>
                          <li><span >共 ${objects.totalitem }条 ，当前第 <strong> ${objects.page }</strong> / <span> <strong>${objects.totalpage}</strong> </span> 页 </span> </li>
                      </ul>

                  </td>
          </tr>
      </table>
 </div>
<script type="text/javascript">
    var dialog;
    function openContent(){
        dialog=new Dialog("查询条目");
        dialog.SetRange(600,300);
        dialog.SetXY((window.document.body.clientWidth -600)/2,50);
        //dialog.OpenWindow("http://www.baidu.com");

        dialog.OpenWindow2(document.getElementById("content").innerHTML);
    }
</script>
</body>
</html>