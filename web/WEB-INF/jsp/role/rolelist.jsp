<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-10
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/manage/commons.jspf" %>
  


    <script language=javascript src="${basePath}/js/ht_select.js" id=clientEventHandlersJS> </script>
    <!--The pop-up page-->
    <script language=javascript src="${basePath}/js/tanchu.js" id=clientEventHandlersJS> </script>

        <SCRIPT TYPE="text/javascript">
            // 选择所有
            function selectAll(checkedValue){

                $("[id=roleid]").attr("checked", checkedValue);
            }
        </script>

    <title>角色管理</title>
</head>
<body>
<!--content-->

<div class="ht_content_rightnr">
    <div class="ht_yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">系统管理</a> >> <span>角色管理</span></p>
    </div>
    <div class="ht_kongbai"></div>
    <div class="ht_rtbut">
        <ul>
            <hyrt:privilege  uri="/role/insert/UI">
            <li><a href="${basePath}/role/insert/UI"><img src="${basePath}/images/ht_ico02.png" /><p>增 加</p></a></li>
            </hyrt:privilege>
            <hyrt:privilege  uri="/role/editup/UI">
            <li><a href="javascript:roleeditform()"><img src="${basePath}/images/ht_ico03.png" /><p>修 改</p></a></li>
            </hyrt:privilege>
            <hyrt:privilege uri="/role/deleterole">
            <li><a href="javascript:roledeleteform()"><img src="${basePath}/images/ht_ico04.png" /><p>删 除</p></a></li>
            </hyrt:privilege>
        </ul>
    </div>
    <div class="ht_sub_nr1">
        <h4 class="ht_sub_title0"><img src="${basePath}/images/ht_ico05.png" /><p>列表</p></h4>
        <form id="rolemanager" action="###" method="post">
        <table width="768" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="ht_sub_table1" style="font-size:12px">

            <tr class="ht_sub_tr1">
                <th width="80"><input type="checkbox" id="allchecked" onClick="selectAll(this.checked)"/></th>

                <th width="80">角色名称</th>
                <th><p>备注</p></th>
                <th width="90">操作</th>
                <div id="massage_box">
                    <div class="massage">
                        <div class="header" onmousedown=MDown(massage_box)>
                            <div style="display:inline; position:absolute">权限信息</div>
                            <span onClick="massage_box.style.visibility='hidden'; mask.style.visibility='hidden'" style="float:right; display:inline; cursor:pointer;">×</span>
                        </div>
                        <div id="ajaxresoure"
                             style=" height: 420px; overflow:auto; overflow-x:hidden;   scrollbar-3dlight-color:#D4D0C8;
  scrollbar-highlight-color:#fff;
  scrollbar-face-color:#E4E4E4;
  scrollbar-arrow-color:#666;
  scrollbar-shadow-color:#808080;
  scrollbar-darkshadow-color:#D7DCE0;
  scrollbar-base-color:#D7DCE0;
  scrollbar-track-color:#;
"
                                ></div>
                    </div>
                </div>
                <div id="mask"></div>
            </tr>

            <c:forEach var="roles" items="${roleList}" varStatus="status">
            <tr align="center">
                <td><input type="checkbox" id="roleid" name="roleid" value="${roles.id}" />
                </td>

                <td>${roles.roleName}</td>
                <td><p>${roles.remark}</p></td>
                <td>
                    <span onClick="mask.style.visibility='visible';massage_box.style.visibility='visible'" style="cursor:hand">
                        <a href="javascript:ajaxreuquset(${roles.id})" id="ajaxresourelist"

                                >权 限</a></span>

                </td>
            </tr>
            </c:forEach>
<tr>
    <td>



                </td>
            </tr>
        </table>
        </form>
    </div>

</div>

</body>

<script type="text/javascript">
  function  ajaxreuquset(ajaxresourceids){
//alert('/role/getajaxroledetail?roleid='+ajaxresourceids);
      htmlobj=$.ajax({
          url:'${basePath}/role/getajaxroledetail?roleid='+ajaxresourceids,async:false});
   // alert(htmlobj.responseText);
  $("#ajaxresoure").html(htmlobj.responseText);
  }
  function  roleeditform(){
      if($("[id=roleid]:checked").length>1){
          alert("请选择一个角色进行编辑");
         return;
      }else   if($("[id=roleid]:checked").length==0){
          alert("请选择一个角色进行编辑");
          return;
      }
      $("#rolemanager").attr("action","/role/editup/UI")
      $("#rolemanager").submit();
//      $("#form").attr("action","deployResult.jsp");
//      $("#form").attr("target","_blank");
//      $("#form").attr("method","GET");

  }

          function  roledeleteform(){
              if($("[id=roleid]:checked").length==0){
                  alert("请自少选择一个角色删除");
                  return;
              }
              $("#rolemanager").attr("action","/role/deleterole");
              if(confirm("您确定删除吗？")){
              $("#rolemanager").submit();
              }
          }



</script>
</html>