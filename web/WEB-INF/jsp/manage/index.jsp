<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>首页</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">

    <div class="ht_sub_nr1" style="margin-top:20px; height: 614px;">
        <ul class="ht_sylist" style="margin-top: 40px;">
      <hyrt:privilege uri="/customer/list">
            <li><a href="${basePath}/customer/list" class="ht_sykh">客户管理</a></li>
      </hyrt:privilege>
      <hyrt:privilege uri="/orderManage/search">
            <li><a href="${basePath}/orderManage/search" class="ht_sydd">订单查询</a></li>
      </hyrt:privilege>
           <!-- <li><a href="#" class="ht_syxxjk">信息监控列表</a></li>  -->
      <hyrt:privilege uri="/package/list">
            <li><a href="${basePath}/package/list" class="ht_sytczd">套餐制定</a></li>
      </hyrt:privilege>
      <hyrt:privilege uri="/userAccount/search">
            <li><a href="${basePath}/userAccount/search" class="ht_sytcsy">用户账户信息</a></li>
      </hyrt:privilege>
      <hyrt:privilege uri="/userAccount/allotSearch">
            <li><a href="${basePath}/userAccount/allotSearch" class="ht_sybytc">包月套餐分配</a></li>
      </hyrt:privilege>
       <hyrt:privilege uri="/userAccount/rechargeSearch">
            <li><a href="${basePath}/userAccount/rechargeSearch" class="ht_syfkmx">付款明细</a></li>
       </hyrt:privilege>
       <hyrt:privilege uri="/manage/analysis">
            <li><a href="${basePath}/manage/images/ht_ico8.png" class="ht_sytjfx">统计分析</a></li>
       </hyrt:privilege>
       <hyrt:privilege uri="/manage/userOperation">
            <li><a href="${basePath}/manage/userOperation" class="ht_syrz">操作日志</a></li>
       </hyrt:privilege>
       <hyrt:privilege uri="/manager/list">
            <li><a href="#" class="ht_syxtgl">系统管理</a></li>
       </hyrt:privilege>
        </ul>
        <div class="ht_yangshi" style="width:100%; height:30px; overflow:hidden;"></div>
    </div>


</div>


</body>
</html>
