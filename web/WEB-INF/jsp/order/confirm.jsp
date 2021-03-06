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

    <title>查询订单确认</title>


</head>
<body style="background:none;background-color: #eeeeee">

    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">${businessTypeName}</a> >> <span>${orderTypeName}</span></p>
    </div>
    <div class="content_right_nr1" style="height:530px;overflow-y: scroll">

        <h4 class="sub_title3">订单信息</h4>
        <c:if test="${countA >0}">
        <ul class="cxzf_list">
            <li><span>查询类型：</span>${orderTypeNameA}</li>
            <li><span>订单条数：</span>${countA}条</li>
            <li><span>查询列表：</span>
                <table width="438" cellpadding="0" cellspacing="0" border="1" class="sub_table2">
                    <tr>

                        <th width="80">
                            <c:if test="${orderTypePP eq  1}">注册号</c:if>
                            <c:if test="${orderTypePP eq  2}">证件号</c:if>
                            <c:if test="${orderTypePP eq  3}">注册号</c:if>
                            <c:if test="${orderTypePP eq  4}">注册号</c:if>
                            <c:if test="${orderTypePP eq  5}">证件号</c:if>
                        </th>
                        <th width="200">
                            <c:if test="${orderTypePP eq  1}">企业名称</c:if>
                            <c:if test="${orderTypePP eq  2}">姓名</c:if>
                            <c:if test="${orderTypePP eq  3}">企业名称</c:if>
                            <c:if test="${orderTypePP eq  4}">企业名称</c:if>
                            <c:if test="${orderTypePP eq  5}">姓名</c:if>

                        </th>
                        <th><p>备 注</p></th>
                    </tr>

                    <c:forEach   var="order" items="${orderBeans}">
                        <c:if test="${order.getClass().getName() eq 'com.hyrt.saic.bean.order.OrderDetail'}">
                        <c:if test="${order.monitorType eq  '1'}">
                            <tr>
                                <td>${order.objCode}</td>
                                <td>${order.objName}</td>
                                <td><p>${order.remark}</p></td>
                            </tr>
                        </c:if>
                        </c:if>
                    </c:forEach>
                </table>
            </li>
        </ul>
        </c:if>

        <c:if test="${countB >0}">
            <ul class="cxzf_list">
                <li><span>查询类型：</span>${orderTypeNameB}</li>
                <li><span>订单条数：</span>${countB}条</li>
                <li><span>查询列表：</span>
                    <table width="438" cellpadding="0" cellspacing="0" border="1" class="sub_table2">
                        <tr>
                            <th width="80">
                                <c:if test="${orderTypePP eq  1}">注册号</c:if>
                                <c:if test="${orderTypePP eq  2}">证件号</c:if>
                                <c:if test="${orderTypePP eq  3}">注册号</c:if>
                                <c:if test="${orderTypePP eq  4}">注册号</c:if>
                                <c:if test="${orderTypePP eq  5}">证件号</c:if>
                            </th>
                            <th width="200">
                                <c:if test="${orderTypePP eq  1}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  2}">姓名</c:if>
                                <c:if test="${orderTypePP eq  3}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  4}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  5}">姓名</c:if>

                            </th>
                            <th><p>备 注</p></th>
                        </tr>

                        <c:forEach   var="order" items="${orderBeans}">
                            <c:if test="${order.getClass().getName() eq 'com.hyrt.saic.bean.order.OrderDetail'}">
                            <c:if test="${order.monitorType eq  '2'}">
                                <tr>
                                    <td>${order.objCode}</td>
                                    <td>${order.objName}</td>
                                    <td><p>${order.remark}</p></td>
                                </tr>
                            </c:if>
                            </c:if>
                        </c:forEach>

                    </table>
                </li>
            </ul>
        </c:if>
        <c:if test="${countC >0}">
            <ul class="cxzf_list">
                <li><span>查询类型：</span>${orderTypeNameA}</li>
                <li><span>订单条数：</span>${countC}条</li>
                <li><span>查询列表：</span>
                    <table width="438" cellpadding="0" cellspacing="0" border="1" class="sub_table2">
                        <tr>
                            <th width="80">
                                <c:if test="${orderTypePP eq  1}">注册号</c:if>
                                <c:if test="${orderTypePP eq  2}">证件号</c:if>
                                <c:if test="${orderTypePP eq  3}">注册号</c:if>
                                <c:if test="${orderTypePP eq  4}">注册号</c:if>
                                <c:if test="${orderTypePP eq  5}">证件号</c:if>
                            </th>
                            <th width="200">
                                <c:if test="${orderTypePP eq  1}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  2}">姓名</c:if>
                                <c:if test="${orderTypePP eq  3}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  4}">企业名称</c:if>
                                <c:if test="${orderTypePP eq  5}">姓名</c:if>

                            </th>
                            <th><p>备 注</p></th>
                        </tr>

                        <c:forEach   var="order" items="${orderBeans}">
                            <c:if test="${order.getClass().getName() eq 'com.hyrt.saic.bean.order.OrderDetail'}">
                                <c:if test="${order.monitorType eq  '2'}">
                                    <tr>
                                        <td>${order.objCode}</td>
                                        <td>${order.objName}</td>
                                        <td><p>${order.remark}</p></td>
                                    </tr>
                                </c:if>
                            </c:if>
                        </c:forEach>

                    </table>
                </li>
            </ul>
        </c:if>
        <div style="clear: both; width: 100%"></div>

            <form action="${basePath}/order/confirm" method="get">
                <input type="submit" value="订单确认" class="but_qd"  />
            </form>

        <div class="sub_tx2">
            <span><b>特别声明：</b><p>用户请认真核实、填写查询条件和联系信息，点击“提交订单”后不能更改，因客户填写订单失误产生的查询损失责任自负，产生的相关费用不予退还。</p></span>
        </div>
        <div style="clear: both; width: 100%; height: 25px;"></div>
    </div>

</body>
</html>