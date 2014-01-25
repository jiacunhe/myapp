<%--
  Created by IntelliJ IDEA.
  User: yang
  Date: 13-12-31
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <title>我的订单</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>订单详细</span></p>
    </div>
    <div class="content_right_nr" style="margin-top:16px;">
        <h4 class="sub_title1"><p class="sub_p9"><span class="sub_ddxx">订单详细</span> <span class="sub_button"><a href="#"><img src="../images/button7.jpg" /></a><a href="#"><img src="../images/button8.jpg" /></a></span></p></h4>
        <div class="sub_nr">

            <div class="ddjg_content">
                <h5>企业法定代表人

                </h5>
                <table width="707" border="1" cellpadding="0" cellspacing="" class="sub_table2">
                    <tr>
                        <th scope="col">查询人姓名</th>
                        <th scope="col">企业(机构)名称</th>
                        <th scope="col">注册号</th>
                        <th scope="col">企业(机构)类型</th>
                        <th scope="col">注册资本(万元)</th>
                        <th scope="col">企业状态</th>
                    </tr>
<c:forEach var="pR" items="${personResult}" >
     <c:if test="${pR.personType=='legal'}">
                    <tr align="center">
                        <td>${pR.a}</td>
                        <td>${pR.b}</td>
                        <td>${pR.c}</td>
                        <td>${pR.d}</td>
                        <td>${pR.e}</td>
                        <td>${pR.f}</td>
                    </tr>
     </c:if>
</c:forEach>
                </table>

                <h5>企业股东</h5>
                <table width="707" border="1" cellpadding="0" cellspacing="0" class="sub_table2">
                    <tr>
                        <th scope="col">查询人姓名</th>
                        <th scope="col">企业(机构)名称</th>
                        <th scope="col">注册号</th>
                        <th scope="col">企业(机构)类型</th>
                        <th scope="col">注册资本(万元)</th>
                        <th scope="col">认缴出资额(万元) </th>
                        <th scope="col">企业状态</th>
                    </tr>
                    <c:forEach var="pR" items="${personResult}" >
                        <c:if test="${pR.personType=='shareholder'}">
                            <tr align="center">
                                <td>${pR.a}</td>
                                <td>${pR.b}</td>
                                <td>${pR.c}</td>
                                <td>${pR.d}</td>
                                <td>${pR.e}</td>
                                <td>${pR.f}</td>
                                <td>${pR.g}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>

                <h5>企业主要管理人员</h5>
                <table width="707" border="1" cellpadding="0" cellspacing="0" class="sub_table2">
                    <tr>
                        <th scope="col">查询人姓名</th>
                        <th scope="col">企业(机构)名称</th>
                        <th scope="col">注册号</th>
                        <th scope="col">企业(机构)类型</th>
                        <th scope="col">注册资本(万元)</th>
                        <th scope="col">企业状态</th>
                        <th scope="col">职务</th>
                    </tr>

                    <c:forEach var="pR" items="${personResult}" >
                        <c:if test="${pR.personType=='senior'}">
                            <tr align="center">
                                <td>${pR.a}</td>
                                <td>${pR.b}</td>
                                <td>${pR.c}</td>
                                <td>${pR.d}</td>
                                <td>${pR.e}</td>
                                <td>${pR.f}</td>
                                <td>${pR.g}</td>
                            </tr>
                        </c:if>
                    </c:forEach>

                </table>

                <p class="ddjg_p1">注意：本报告仅供商业决策参考之用，不作法律依据。在 任何情况下，对由于使用本报告所造成的损失，本公司不承担任何责任.</p>
                <div class="yangshi"></div>
            </div>





        </div>
    </div>


</div>


</body>
</html>