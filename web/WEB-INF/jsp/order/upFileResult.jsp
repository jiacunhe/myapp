<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
</head>
<body>
<table width="600" border="0">
  <tr>
    <td>code</td>
    <td>name</td>
    <td>remark</td>
  </tr>
  
  <c:forEach  var="obj" items="${upObjList}"   varStatus="status"> 
  <tr>
    <td>${obj[0]}</td>
    <td>${obj[1]}</td>
    <td>${obj[2]}</td>
  </tr>
</c:forEach>
</table>

</body>
</html>