<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-10
  Time: 下午1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>

    <LINK TYPE="text/css" REL="stylesheet" HREF="${basePath}/css/jquery.treeview.css" />

    <SCRIPT LANGUAGE="javascript" SRC="${basePath}/js/jquery.treeview.js"></SCRIPT>

    <script language=javascript src="${basePath}/manage/js/treecheckbox.js"> </script>


    <title>用户角色增加</title>
</head>
<body>
<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>角色管理</span></p>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/images/ht_ico06.png" /><p>更新</p></h4>




        <form id="editrole" action="${basePath}/role/editup" method="post" class="ht_sub_form00">
<input name="roleid" type="hidden" value="${role.id}" />
            <p>*角色名称：</p>
            <input type="text" id="rolename" name="rolename" value="${role.roleName}"  class="ht_sub_input1" style="height:28px; overflow:hidden; line-height:28px;"/><br />
            <p id="nullmessage"></p>
            <div class="clear"></div>
            <p>备注：
            <div id="massage_box" style=" margin:-100px 0px 0px 110px; left:9%; top:45%;">
                <div class="massage" style=" height: 420px; overflow:auto; overflow-x:hidden;   scrollbar-3dlight-color:#D4D0C8;
  scrollbar-highlight-color:#fff;
  scrollbar-face-color:#E4E4E4;
  scrollbar-arrow-color:#666;
  scrollbar-shadow-color:#808080;
  scrollbar-darkshadow-color:#D7DCE0;
  scrollbar-base-color:#D7DCE0;
  scrollbar-track-color:#;
">
                    <div class="header" onmousedown=MDown(massage_box)>
                        <div style="display:inline;"><span style="width: 100%; padding-left:10px;">请选择权限</span></div>
                        <span onClick="massage_box.style.visibility='hidden'; mask.style.visibility='hidden'" style="float:right; display:inline; cursor:pointer;">×</span>
                    </div>
                    <DIV ID=MainArea>
                        <!-- 表单内容显示 -->
                        <DIV CLASS="ItemBlockBorder">
                            <DIV CLASS="ItemBlock">
                                <TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
                                    <!--表头-->
                                    <THEAD>
                                    <TR ALIGN="LEFT" VALIGN="MIDDLE" ID="TableTitle">
                                        <TD WIDTH="300px" STYLE="padding-left: 7px;">
                                            <!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
                                            <INPUT TYPE="CHECKBOX" ID="cbSelectAll" onClick="selectAll(this.checked)"/>
                                            <LABEL FOR="cbSelectAll">全选</LABEL>
                                        </TD>
                                    </TR>
                                    </THEAD>

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
                                                <li><input type="checkbox" name="resourceIds" id="cb_${top.id}" value="${top.id}"
                                                        <c:forEach var="roleresource" items="${role.resources}" >
                                                            <c:if test="${roleresource.id==top.id}" >
                                                                checked="checked"
                                                            </c:if>
                                                        </c:forEach>

                                                        />
                                                    <label for="cb_${top.id}"><span class="folder">${top.resourceName}</span></label>

                                                    <!-- 第二级 -->
                                                    <ul><c:forEach items="${top.children}" var="level2">
                                                        <li><input type="checkbox" name="resourceIds" id="cb_${level2.id}" value="${level2.id}"

                                                                <c:forEach var="roleresource" items="${role.resources}" >
                                                                    <c:if test="${roleresource.id==level2.id}" >
                                                                        checked="checked"
                                                                    </c:if>
                                                                </c:forEach>


                                                                />
                                                            <label for="cb_${level2.id}"><span class="folder">${level2.resourceName }</span></label>

                                                            <!-- 第三级 -->
                                                            <c:if test="${!empty level2.children}">


                                                                <ul> <c:forEach items="${level2.children}" var="level3">
                                                                    <li> <input type="checkbox" name="resourceIds" id="cb_${level3.id}" value="${level3.id}"
                                                                            <c:forEach var="roleresource" items="${role.resources}" >
                                                                                <c:if test="${roleresource.id==level3.id}" >
                                                                                    checked="checked"
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            />
                                                                    <label for="cb_${level3.id}"><span class="folder">${level3.resourceName }</span></label>
                                                                    </li>
                                                                </c:forEach>

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
                </div>
            </div>
            <div id="mask"></div>
            </p>
            <textarea class="ht_sub_input2" id="rolermark" name="rolermark" style="height:200px; overflow:hidden; line-height:28px; ">${role.remark}</textarea><br />
            <p>权限设置：</p>


            <span onClick="mask.style.visibility='visible';massage_box.style.visibility='visible'" style="cursor:hand"><a href="#"><img src="${basePath}/images/ht_ico07.jpg" class="ht_img1" /></a></span>





            <!-- <img src="${basePath}/images/ht_ico07.jpg" class="ht_img1" />--><br />
            <div class="clear"></div>
            <input type="button" value="更新"  class="ht_but_qd" onclick="editrolesubmit()"/>
            <input type="button" value="取消"  class="ht_but_qx" onclick="window.open('${basePath}/role/manager','_self')" />
        </form>
    </div>

</div>
<script type="text/javascript">
    function editrolesubmit(){

        if($("#rolename").val()==""){
            $("#rolename").attr("style","border:1px solid red; height:28px; overflow:hidden; line-height:28px;");
            $("#nullmessage").html("<font color=red>请输入角色名称</font>");
//            if(confirm("角色名称不能为空")){
//                return;
//            }
        }else if($("#rolename").val()=='${role.roleName}'){

            $("#editrole").submit();
        }else{

            $.ajax({
                url: "${basePath}/role/ajaxrolenameexist?roleName="+$("#rolename").val(),
                success: function (data) {
                    if(data.rolenameexist==true){
                        $("#nullmessage").html("<font color=red>角色名称已存在</font>");
                    }else
                    {
                        $("#editrole").submit();

                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }



</script>
</body>
</html>