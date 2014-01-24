<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>企业查询</title>


</head>

<body>

          	<div class="sy_right">
            	<ul>
                	<li>
                    	<img src="${basePath}/images/ico02.jpg" />
                        <span class="sy_span1">
                        	<h2><b>企业查询</b><a href="${basePath}/order/group">入口</a></h2>
                            <div class="clear"></div>
                       		<p>功能介绍：提供使用企业登记名称或营业执照号码进行查询企业相关信息。</p>
                        </span>                        
                    </li>
                    <li>
                    	<img src="${basePath}/images/ico03.jpg" />
                        <span class="sy_span1">
                        	<h2><b>人员查询</b><a href="${basePath}/order/person">入口</a></h2>
                            <div class="clear"></div>
                       		<p>功能介绍：提供使用自然人各类证件号码进行查询该人员相关的企业信息。</p>
                        </span>   
                    </li>
                    <li>
                    	<img src="${basePath}/images/ico04.jpg" />
                        <span class="sy_span1">
                        	<h2><b>企业对外投资查询</b></h2><a href="${basePath}/order/investment">入口</a>
                            <div class="clear"></div>
                       		<p style="margin-top:10px;">功能介绍：提供使用企业登记名称或营业执照号码进行对该企业对外投資查詢.</p>
                        </span>  
                    </li>
                    <li>
                    	<img src="${basePath}/images/ico03.jpg" />
                        <span class="sy_span2">
                        	<h2><b>云监控</b><a href="${basePath}/order/personMonitor">人员监控入口</a></h2><a href="${basePath}/order/groupMonitor">企业监控入口</a>
                            <div class="clear"></div>
                       		<p>功能介绍：“云”服务分为按企业进行长期跟踪监控和按人员进行长...</p>
                        </span>  
                    </li>
                </ul>
            </div>
</body>
</html>