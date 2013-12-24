<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title></title>
  </head>
  <body>
                    Hello,${name};
                    <c:if test="${name eq 'jsp'}"> haha</c:if>
  </body>
</html>