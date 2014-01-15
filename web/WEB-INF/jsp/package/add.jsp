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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
    <title>套餐制定</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>套餐制定</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/manage/images/ht_ico06.png" /><p>新增</p></h4>

        <form action="/package/add"  method="post" class="ht_sub_form5">

            <span><p>套餐名称：</p><input id="packageName" name="packageName" type="text" class="ht_sub_input11"/></span>
            <span><p>套餐价格：</p><input id="price" name="price" type="text" class="ht_sub_input11"/>元</span>
                             <input id="userId" name="userId" type="hidden"/>

            <span><p>套餐类型：</p><select  name="type" id="type">
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

                                    <li><p style="width:100px">查询条数：</p><input  id="quantity" name="quantity" type="text" />条</li>
                                    <li><p style="width:100px">备注：</p><input  id="remark2" name="remark2" type="text" style=" margin-top:12px;" /></li>
                                    <li><p style="width:100px">企业或人员监控：</p><input id="quantity2" name="quantity2" type="text" />条/年</li>
                                    <li><p style="width:100px">备注：</p><input  id="remark3" name="remark3" type="text"  style=" margin-top:12px;" /></li>
                                </ul>
                            </div>
                        </span>
            <div class="clear"></div>
            <input  type="submit" value="确定"  class="ht_but_qd0" style="margin-left:220px;"/>
            <input type="reset" value="取消"  class="ht_but_qx0" />
        </form>
        <div class="ht_sub_yangshi" style="height:60px;"></div>
    </div>

</div>



</body>
</html>






<!--<html>
<head>
    <title></title>
</head>
<body>


        <form action="/package/insert"  method="post" >
            <table>
                <tr><td>包名</td><td><input id="packageName" name="packageName" type="text"/></td></tr>
                <tr><td>价格</td><td><input id="price" name="price" type="text"/></td></tr>
                <tr><td>用户名</td><td><input id="userId" name="userId" type="text"/></td></tr>
                <tr><td>类型</td><td><select type="select" name="type" id="type">
                    <option value="public">
                        公有套餐
                    </option>
                    <option value="private">
                        私有套餐
                    </option>
                    <option value="vip">
                        大客户套餐
                    </option>
                </select> </td></tr>
                <tr><td>查询类型</td><td>查询 </td></tr>
                <tr><td>数量</td><td><input id="quantity" name="quantity" type="text"/></td></tr>
                <tr><td>备注</td><td><input id="remark2" name="remark2" type="text"/></td></tr>
                <tr><td>查询类型</td><td>监控</td></tr>
                <tr><td>数量</td><td><input id="quantity2" name="quantity2" type="text"/></td></tr>
                <tr><td>备注</td><td><input id="remark3" name="remark3" type="text" /></td></tr>

            </table>
            <input type="submit" value="提交">


</form>
</body>
</html>