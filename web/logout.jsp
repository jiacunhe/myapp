<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-25
  Time: 下午3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    // http://localhost:8080/saic
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <title></title>
    <script type="text/javascript">

       if('<%=request.getParameter("manage")%>'=='true')
       window.open ('${basePath}/manage','_top');
        else
       window.open ('${basePath}/','_top');

    </script>
</head>
<body>

</body>
</html>