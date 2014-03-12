<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
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
    <script type="text/javascript">
        $(document).ready(function(){
            $("#determin").click(function(){
                $("#area").show();
                $("#zhanshi").hide();
                topwin();
                <!--$("#area").toggle();-->
            });
        });



    </script>
    <title>订单购买确认</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">套餐购买</a> >> <span>订单确认</span></p>
    </div>
    <div class="content_right_nr1">
        <h4 class="sub_title1"><p class="sub_p3">套餐购买</p></h4>
        <div class="sub_nr">

        <div id="zhanshi">
            <h4 class="sub_title3">订单信息</h4>
             <form action="${basePath}/pay/action" method="post" target="_blank">
        <ul class="cxzf_list">
            <input type="hidden" id="packageId" name="packageId" value="${p.id}" />
            <li><span>套餐名称：</span>${p.packageName}</li>
            <li><span>套餐类型：</span>公用套餐</li>
            <li><span>套餐价格：</span>${p.price}元</li>
            <li><span>套餐内容：</span>单条查询条数<strong>${p.quantityA}</strong>条、按年监控企业或按年监控个人条数<strong>${p.quantityB}</strong>条</li>
           <input type="hidden" id="packageName" name="packageName" value="${p.packageName}" readonly /></li>
           <input type="hidden" id="packageType" name="packageType" value="公用套餐" readonly/></li>
           <input type="hidden" id="packagePrice" name="packagePrice" value="${p.price}" readonly/></li>

            <li><span>支付方式：</span><input type="radio"  checked name="payMethod" value="bank" style=" float: left; margin: 12px 10px 0px 0px;"><img src="${basePaht}/images/upoplogo.gif">

        </ul>
            <div class="clear"></div>
        <p class="button2" style="padding-left:50px; margin-top:0px;"><input type="button" id="determin" value="确定购买" class="but_qd" />
            <input type="button" value="取消订单" class="but_qx" onclick="history.go(-1)"/></p>
        <div class="sub_tx2">
            <span><b>特别声明：</b><p>用户请认真核实订单信息，点击“确定购买”后不能更改，因客户填写订单失误产生的查询损失责任自负，产生的相关费用不予退还。</p></span>
        </div>
            </form>
    </div>

    </div>


    <div style=" height:auto; overflow:hidden; display:none;" id="area">
        <h4 class="sub_successful_title1">套餐信息</h4>
        <ul class="cxzf_list">
            <li><span>购买套餐：</span>${p.packageName}   （查询条数<strong>${p.quantityA}</strong>条、监控企业条数或监控人员条数<strong>${p.quantityB}</strong>条</li>
            <li><span>套餐金额：</span>${p.price}元</li>
            <li><span>付款金额：</span>${p.price}元</li>
        </ul>
        <div class="clear"></div>
        <p class="button2" style="padding-left:110px; margin-top:80px;"><input type="button" value="付款完成" onclick="javascript:window.location.href='${basePath}/bill/rechargeRecord'" class="but_qd"  /></p>
    </div>
        <div class="kongbai"></div>
</div>

</div>
</body>
<script>
    function topwin(){
        var obj = new Object();
        obj.packageId=${p.id};



        var stringurl="packageId=${p.id}";
        //alert("${basePath}/pay/showModalDialog?"+stringurl);

       //中文传值与转码
        window.showModalDialog("${basePath}/pay/action?"+stringurl,obj,"dialogWidth:500px;dialogHeight:500px;scroll:yes;status:no")
    }
</script>
</html>
