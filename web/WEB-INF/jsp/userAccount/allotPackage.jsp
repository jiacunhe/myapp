<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>

    <title>包月套餐分配</title>
    <c:if test="${ !empty message }">
        <script type="text/javascript">
            alert("${message}");
        </script>
    </c:if>

</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">包月套餐</a> >> <span>包月套餐分配</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico06.png" /><p>新增分配</p></h4>
        <form method="post" action="${basePath}/userAccount/allotPackage" class="ht_sub_form5" id="formAllotPack">
                <span><p>分配账号：</p>
                    <select class="ht_sub_input013" name="receiver">

                        <c:forEach  var="obj" items="${subUserList}">
                            <option value="${obj.userId}">${obj.userId}|${obj.userName}</option>
                        </c:forEach>
                    </select>
                </span>
                <span style="margin-left:-34px;"><p style="width:100px;">生效方式：</p>
                    <select class="ht_sub_input013" name="effectiveType">
                            <option value="1">立即生效</option>
                            <option value="2">下月生效</option>
                    </select>
                </span>
            </span>
            <%--<span><p>套餐状态：</p><a href="#"><img src="../images/ht_kq.jpg" /><img src="../images/ht_sx.jpg" /></a></span>--%>
                        <span class="neirong"><p>分配规则：</p>
                        	<div class="ht_sub_tcnr1" style="height: 300px;">
                                <ul>
                                    <li>账户可用条数：${availableNum}</li>
                                    <div class="clear"></div>
                                    <li><p>条数：</p><input type="text" id="quantity" name="quantity"/>条 &nbsp;&nbsp;注：可进行企业查询、人员查询、对外投资查询</li>
                                    <div class="clear"></div>
                                    <li><p style="float: left">有效期：</p>
                                    <select class="ht_sub_input015" style="float: left; margin-left: 10px; height: 26px; width: 80px;" name="duration" id="duration" onchange="manageMonth(this.value)">
                                        <option value="-1"> 长 期 </option>
                                        <option value="1"> 一次性 </option>
                                        <option value="2"> 自定义 </option>
                                    </select> <span  id="durationMonth" style="display: none; width:200px; margin-left: 20px;margin-top: 6px; float: left">
                                               <input type="text" id="month" name="month" value="-1" style=" width: 50px; ">输入分配持续月数</span>
                                    </li>
                                </ul>
                            </div>
                        </span>
            <div class="clear"></div>
            <input type="button" value="确定"  class="ht_but_qd0" style="margin-left:220px;" onclick=" checkData()"/>
            <input type="button" value="取消"  class="ht_but_qx0" onclick="history.back(-1)" />
            <input type="hidden" name="submitttt" value="1">
        </form>
        <div class="ht_sub_yangshi" style="height:60px;"></div>
    </div>

</div>

 <script type="text/javascript">
     function manageMonth(val){
          if(val==2){
              document.getElementById("durationMonth").style.display="block";
              document.getElementById("month").value="";
          }else{
              document.getElementById("durationMonth").style.display="none";
              document.getElementById("month").value=val;
          }
     }


     function checkData(){

           var inputQuantity = document.getElementById("quantity").value;
           if(inputQuantity==""){
               alert("亲，你还没有填写分配数量");
               return false;
           }
           var availableNum = ${availableNum}; if("${availableNum}"=="")availableNum=0;
           if(inputQuantity > availableNum){
                  alert("亲，您的分配数量太大了");
                  return false;
            }

            if( document.getElementById("month").value==""){
                alert("亲，你还没有填写月数");
                return false;
            }
            document.getElementById("formAllotPack").submit();

     }
 </script>

</body>
</html>
