<%--
  Created by IntelliJ IDEA.
  User: huanghe
  Date: 13-12-30
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


        <form action="/package/insert"  method="post" >
            <table>
                <tr><td>包名</td><td><input id="packageName" name="packageName" type="text"/></td></tr>
                <tr><td>价格</td><td><input id="price" name="price" type="text"/></td></tr>
                <tr><td>价格</td><td><input id="userId" name="userId" type="text"/></td></tr>
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