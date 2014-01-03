<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
</head>
   <body>
      <table>
          <c:forEach var="p" items="${list}"  varStatus="status">
              <tr>
                  <td>${p.packageName}</td>
                  <td>${p.price}</td>
                  <td>${p._type}</td>
                  <td>${p.userId}</td>
                  <td>${p.remark}</td>
                  <td>${p.businessNameA}</td>
                  <td>${p.quantityA}</td>
                  <td>${p.detailRemarkA}</td>
                  <td>${p.businessNameB}</td>
                  <td>${p.quantityB}</td>
                  <td>${p.detailRemarkB}</td>
                  <td><input type="button" value="修改" onclick="javascript:location.href='/package/change?id=${p.id}'"></td>
                  <td><input type="button" value="删除" onclick="javascript:location.href='/package/delete?id=${p.id}'"></td>
              </tr>

          </c:forEach>
          <td><input type="button" value="新增" onclick="javascript:location.href='/packageInsert.jsp'"></td>
      </table>
   </body>
</html>