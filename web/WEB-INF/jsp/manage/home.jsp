<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>


    <title>工商企业查询管理系统</title>
</head>
<frameset rows="93,*,41"  frameborder="NO" border="0" framespacing="0">
    <frame src="${basePath}/htIframeTop" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
    <frameset cols="250,*"  rows="100%,*" id="frame">
        <frame src="${basePath}/htIframeLeft" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" target="main" />
        <frame src="${basePath}/index" name="main" marginwidth="0" marginheight="0" frameborder="0" target="_self"  />
    </frameset>
    <frame src="${basePath}/htIframeBottom" noresize="noresize" frameborder="NO" name="footFrame" scrolling="no" marginwidth="0" marginheight="0" />
    <noframes>
        <body></body>
    </noframes>




</html>
