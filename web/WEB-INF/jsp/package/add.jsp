<%--
  Created by IntelliJ IDEA.
  User: huanghe
  Date: 13-12-30
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>套餐制定</title>
    <script language="javascript">
        function hide(str){
              if(str=='vip'){
            document.getElementById('a').style.display = "none";
            document.getElementById('b').style.display = "none";
            document.getElementById('quantity2').value ="0";
            document.getElementById('remark3').value ="";
              }
            else{
                  document.getElementById('a').style.display = "block";
                  document.getElementById('b').style.display = "block"
              }
        }
    </script>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>套餐制定</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico06.png" /><p>新增</p></h4>

        <form action="${basePath}/package/add" id="addPackage" method="post" class="ht_sub_form5">

            <span><p>套餐名称：</p><input id="packageName" name="packageName" type="text" class="ht_sub_input11" maxlength="20"/></span>
            <span><p>套餐价格：</p><input id="price" name="price" type="text" class="ht_sub_input11" value="0" maxlength="8"/>元</span>
                             <input id="userId" name="userId" type="hidden"/>

            <span><p>套餐类型：</p><select  name="type" id="type" onchange="hide(this.value)">
                                    <option value="public">
                                        公有套餐
                                    </option>
                                    <option value="vip">
                                        包月套餐
                                    </option>
                                </select></span>
                        <span class="neirong"><p>套餐内容：</p>
                        	<div class="ht_sub_tcnr">
                                <ul>

                                    <li><p style="width:100px">查询条数：</p><input  id="quantity" name="quantity" type="text" value="0" maxlength="8" />条</li>
                                    <li><p style="width:60px">备注：</p><input  id="remark2" name="remark2" type="text" style=" margin-top:12px;width:130px" /></li>
                                    <li id="a" style="display: block"><p style="width:100px">企业或人员监控：</p><input id="quantity2" name="quantity2" type="text" value="0" maxlength="8"/>条/年</li>
                                    <li id="b" style="display: block"><p style="width:60px">备注：</p><input  id="remark3" name="remark3" type="text"  style=" margin-top:12px;width:130px" /></li>

                                </ul>

                            </div>
                            (查询包含：企业查询，人员查询和对外投资查询)
                        </span>
            <div class="clear"></div>
            <input  type="button" value="确定"  class="ht_but_qd0" onclick="submitPackage()" style="margin-left:220px;"/>
            <input type="reset" value="取消"  class="ht_but_qx0" />
        </form>
        <div class="ht_sub_yangshi" style="height:60px;"></div>
    </div>

</div>

<script type="text/javascript">
    function JTrim(s)
    {
        return s.replace(/(^\s*)|(\s*$)/g, "");
    }

    function submitPackage(){
        if(JTrim($("#packageName").val())=="")
        {
            alert("套餐名称不能为空！"); return;}
        else if(JTrim($("#price").val())==""){
            alert("套餐价格不能为空！"); return; }
        else if(JTrim($("#quantity").val())==""){
            alert("查询数量不能为空！"); return;}
        else if(JTrim($("#quantity2").val())=="")  {
            alert("监控数量不能为空！"); return;}
        else {$("#addPackage").submit();}
    }



</script>


</body>
</html>






