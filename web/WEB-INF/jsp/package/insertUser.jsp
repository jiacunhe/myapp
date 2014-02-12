<%--
  Created by IntelliJ IDEA.
  User: huanghe
  Date: 13-12-30
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script language=javascript src="${basePath}/js/ht_select.js" id=clientEventHandlersJS> </script>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>套餐制定</title>
</head>

<body>

<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>套餐分配</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/images/ht_ico06.png" /><p>新增</p></h4>

        <form action="${basePath}/package/insert"  method="post" class="ht_sub_form5">
            <span><p>用户名称：</p>${userId}</span>
            <span><p>套餐类型：</p>私有套餐</span>
            <span><p>套餐名称：</p><input id="packageName" name="packageName" type="text" class="ht_sub_input11"/></span>
            <span><p>套餐价格：</p><input id="price" name="price" type="text" class="ht_sub_input11"/>元</span>
            <input id="type" name="type" type="hidden" value="private"/>
            <input id="userId" name="userId" type="hidden" value="${userId}"/>

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






