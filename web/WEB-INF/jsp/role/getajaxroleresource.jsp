<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-3
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <LINK TYPE="text/css" REL="stylesheet" HREF="${basePath}/css/jquery.treeview.css" />
    <SCRIPT LANGUAGE="javascript" SRC="${basePath}/js/jquery.min.js"></SCRIPT>
    <SCRIPT LANGUAGE="javascript" SRC="${basePath}/js/jquery.treeview.js"></SCRIPT>




    <SCRIPT TYPE="text/javascript">
        // 选择所有


        $(function(){
            $("#tree").treeview()

            // 点击某项时应做相应的选择或取消上下级的操作

        });

    </SCRIPT>



</head>
<body>



<!-- 标题显示 -->








    <table>


        <tr>
            <td>

                <DIV ID=MainArea>
                    <!-- 表单内容显示 -->
                    <DIV CLASS="ItemBlockBorder">
                        <DIV CLASS="ItemBlock">
                            <TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">


                                <!--显示数据列表-->
                                <TBODY ID="TableData">
                                <TR CLASS="TableDetail1">
                                    <!-- 显示权限树 -->
                                    <TD>

                                        <%--
                                        <c:forEach items="${resourceList}" var="resource">
                                            <input type="checkbox" name="resourceIds" value="${resource.id}">${resource.name }<br>
                                            <html:multibox property="resourceIds" styleId="cb_${resource.id}" value="${resource.id}"/><label for="cb_${resource.id}">${resource.name }</label><br>
                                        </c:forEach>
                                        --%>

                                        <!-- 第一级 -->
                                        <ul id="tree"><c:forEach items="${topList}" var="top">
                                            <li><input type="checkbox" name="resourceIds" id="cb_${top.id}" value="${top.id}" disabled
                                                    <c:forEach var="roleresource" items="${role.resources}" >
                                                        <c:if test="${roleresource.id==top.id}" >
                                                            checked="checked"
                                                        </c:if>
                                                    </c:forEach>

                                                    />
                                                <label for="cb_${top.id}"><span class="folder">${top.resourceName}</span></label>

                                                <!-- 第二级 -->
                                                <ul><c:forEach items="${top.children}" var="level2">
                                                    <li><input type="checkbox" name="resourceIds" id="cb_${level2.id}" value="${level2.id}" disabled

                                                            <c:forEach var="roleresource" items="${role.resources}" >
                                                                <c:if test="${roleresource.id==level2.id}" >
                                                                    checked="checked"
                                                                </c:if>
                                                            </c:forEach>


                                                            />
                                                        <label for="cb_${level2.id}"><span class="folder">${level2.resourceName }</span></label>

                                                        <!-- 第三级 -->

                                                        <c:if test="${!empty level2.children}">
                                                        <ul> <li><c:forEach items="${level2.children}" var="level3">
                                                           <input type="checkbox" name="resourceIds" id="cb_${level3.id}" value="${level3.id}" disabled
                                                                    <c:forEach var="roleresource" items="${role.resources}" >
                                                                        <c:if test="${roleresource.id==level3.id}" >
                                                                            checked="checked"
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    />
                                                                <label for="cb_${level3.id}"><span class="folder">${level3.resourceName }</span></label>

                                                        </c:forEach>
                                                        </li>
                                                        </ul>
</c:if>
                                                    </li>
                                                </c:forEach>
                                                </ul>

                                            </li>
                                        </c:forEach>
                                        </ul>

                                    </TD>
                                </TR>
                                </TBODY>
                            </TABLE>
                        </DIV>
                    </DIV>



                </DIV>


                <br/>
                <!--
                  <c:forEach var="resourceslist" items="${allSysResource}" varStatus="statu" >
                  <input type="checkbox" name="resource" id="resource" value="${resourceslist.id}"

                     <c:forEach var="roleresource" items="${role.resources}" >
                        <c:if test="${roleresource.id==resourceslist.id}" >
                       checked="checked"
                          </c:if>
                        </c:forEach>
                          >

                     ${resourceslist.resourceName}
                  </c:forEach>
                           -->

            </td>

        </tr>

    </table>



</body>
</html>