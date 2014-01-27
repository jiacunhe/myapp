<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>


    <title>工商企业查询管理系统</title>
    <style type="text/css">
        body {
            overflow-x : hidden;
        }
    </style>
</head>

<frameset rows="94,*,45"  frameborder="NO" border="0" framespacing="0">
    <frame src="${basePath}/iframeTop" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
    <frameset cols="220,*"  rows="100%,*" id="frame">
        <frame src="${basePath}/iframeLeft" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" target="mainIframe" />
        <frame src="${basePath}/welcome.jsp" name="mainIframe" marginwidth="0" marginheight="0" frameborder="0" target="_self"  />
    </frameset>
    <frame src="${basePath}/iframeBottom" noresize="noresize" frameborder="NO" name="footFrame" scrolling="no" marginwidth="0" marginheight="0" />
    <noframes>
        <body></body>
    </noframes>

<script type="text/javascript">
    function SetWinHeight(obj){
        var win=obj;
        if (document.getElementById){
            if (win && !window.opera) {
                if (win.contentDocument && win.contentDocument.body.offsetHeight)
                    win.height = win.contentDocument.body.offsetHeight+100>660?win.contentDocument.body.offsetHeight+100:660;
                else if(win.Document && win.Document.body.scrollHeight)
                    win.height = win.Document.body.scrollHeight+100>660? win.Document.body.scrollHeight+100:660;
            }
        }
    }

    function goHome(){
        document.getElementById("mainIframe").src="${basePath}/welcome.jsp";
    }
</script>
</html>
