<%--
  Created by IntelliJ IDEA.
  User: huanghe
  Date: 13-12-30
  Time: 下午2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   <form action="${basePath}/package/update"  method="post" >
    <table>
        <tr><td>包名</td><td><input id="packageName" name="packageName" type="text" value="${p.packageName}"/></td></tr>
        <tr><td>价格</td><td><input id="price" name="price" type="text" value="${p.price}"/></td></tr>
        <tr><td>类型</td><td><select type="select" name="type" id="type">

            <option value="public" <c:if test="${p._type=='public'}">selected="selected"</c:if>>
                公有套餐
            </option>
            <option value="private" <c:if test="${p._type=='private'}">selected="selected"</c:if>>
                私有套餐
            </option>
            <option value="vip" <c:if test="${p._type=='vip'}">selected="selected"</c:if>>
                大客户套餐
            </option>
        </select> </td></tr>

        <tr><td>用户ID</td><td><input id="userId" name="userId" type="text" value="${p.userId}"/></td></tr>
        <tr><td>备注</td><td><input id="remark" name="remark" type="text" value="${p.remark}"/></td></tr>


        <tr><td>查询类型</td><td>${p.businessNameA}</td></tr>
        <tr><td>数量</td><td><input id="quantity" name="quantity" type="text" value="${p.quantityA}"/></td></tr>
        <tr><td>备注</td><td><input id="remark2" name="remark2" type="text" value="${p.detailRemarkA}"/></td></tr>



        <tr><td>查询类型</td><td>${p.businessNameB}</td></tr>
        <tr><td>数量</td><td><input id="quantity2" name="quantity2" type="text" value="${p.quantityB}"/></td></tr>
        <tr><td>备注</td><td><input id="remark3" name="remark3" type="text" value="${p.detailRemarkB}"/></td></tr>

    </table>
     <input type="submit" value="提交">
       <input type="hidden" name="id" value="${p.id}">
       <input type="hidden" name="Aid" value="${p.detailIdA}">
       <input type="hidden" name="Bid" value="${p.detailIdB}">

   </form>
</body>
</html>

