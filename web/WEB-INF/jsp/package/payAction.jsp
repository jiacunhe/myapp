<%@ page import="com.hyrt.saic.upop.PayConf" %>
<%@ page import="com.hyrt.saic.bean.User" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.hyrt.saic.bean.RechargeRecord" %>
<%@ page import="com.hyrt.saic.util.Config" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-3-10
  Time: 下午4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <base target=_self>
    <title></title>
    <script type="text/javascript">
       window.onload=function(){
        var obj = window.dialogArguments;
         obj.packageId;
         obj.packageName;
        }


    </script>


</head>
<body onkeydown="if(event.keyCode==116){reload.click()}">

     正在转向支付页面····

   <%=request.getAttribute("html")%>


</form>
</body>
</html>