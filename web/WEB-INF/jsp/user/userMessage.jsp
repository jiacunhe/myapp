<%--
  Created by IntelliJ IDEA.
  User: hyrt001
  Date: 14-1-26
  Time: 上午10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <script language=javascript src="${basePath}/manage/js/tanchu.js"> </script>

    <title>我的消息</title>
</head>

<body>


<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">个人中心</a> >> <span>我的消息</span></p>
    </div>

    <div id="messageTableDiv" class="content_right_nr">
        <h4 class="sub_title40">

                <SELECT id="recentTime1" name="recentTime1">
                    <OPTION style=" font-size: 12px;">选择时间段</OPTION>
                    <OPTION value="oneWeek" <c:if test="${page.recentTime=='oneWeek'}">selected="true" </c:if> >近一星期</OPTION>
                    <OPTION value="oneMonth" <c:if test="${page.recentTime=='oneMonth'}">selected="true" </c:if> >近一个月</OPTION>
                    <OPTION value="threeMonth" <c:if test="${page.recentTime=='threeMonth'}">selected="true" </c:if> >近三个月</OPTION>
                    <OPTION value="beforThreeMonth" <c:if test="${page.recentTime=='beforThreeMonth'}">selected="true" </c:if> >三个月前</OPTION>
                </SELECT>
                <!-- 对定的值在Config类中有定义静态变量  -->
                <SELECT id="messageStatus1" name="messageStatus1" class="u121">
                    <OPTION >选择状态</OPTION>
                    <OPTION value="n" <c:if test="${page.messageStatus=='n'}">selected="true" </c:if> >新提醒</OPTION>
                    <OPTION value="d" <c:if test="${page.messageStatus=='d'}">selected="true" </c:if> >已读信息</OPTION>
                </SELECT>

                <SELECT id="messageType1" name="messageType1" class="u122">
                    <OPTION >选择类型</OPTION>
                    <OPTION value="s" <c:if test="${page.messageType=='s'}">selected="true" </c:if> >系统通知</OPTION>
                    <OPTION value="r" <c:if test="${page.messageType=='r'}">selected="true" </c:if> >咨询回复</OPTION>
                    <OPTION value="o" <c:if test="${page.messageType=='o'}">selected="true" </c:if> >订单通知</OPTION>
                </SELECT>

                <input type="button" value="标记为已读" onclick="chanageReaded();" class="sub_input4" />
                <input type="button" value="删除" onclick="deleteMessagebyIds();" class="sub_input5"/>
              </h4>



        <div class="sub_nr">
            <form name="userMessageForm" id="userMessageForm" method="post" action="${basePath}/user/message">
                <input type="hidden" id="pageNo" name="pageNo" value="1"/>
                <input type="hidden" id="recentTime" name="recentTime" value="${page.recentTime}"/>
                <input type="hidden" id="messageStatus" name="messageStatus" value="${page.messageStatus}"/>
                <input type="hidden" id="messageType" name="messageType" value="${page.messageType}"/>
            <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1" style="table-layout: fixed;">
                <tr class="sub_tr1">
                    <th width="50"><input type="checkbox" id="allMessageCheck" name="allMessageCheck" onclick="selectAll(this.checked)"/></th>
                    <th width="90">状 态</th>
                    <th width="90">类 型</th>
                    <th><p>内 容</p></th>
                    <th width="160">时间</th>
                    <th width="160">操 作</th>
                </tr>
                <c:forEach items="${page.results}" var="sm" varStatus="status">
                    <tr align="center">
                        <td><input name="messageIds" id="messageIds"type="checkbox" value="${sm.id}"/></td>
                        <c:choose>
                            <c:when test="${sm.status=='n'}">
                                <td>新提醒</td>
                            </c:when>
                            <c:when test="${sm.status=='d'}">
                                <td>已读信息</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sm.type=='s'}">
                                <td>系统通知</td>
                            </c:when>
                            <c:when test="${sm.type=='r'}">
                                <td>问答回复</td>
                            </c:when>
                            <c:when test="${sm.type=='o'}">
                                <td>订单消息</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>


                        </c:choose>

                        <td style="width: 50%;"><p style="width: 90%;margin-right:5%;overflow:hidden;
        white-space:nowrap;
        text-overflow:ellipsis;
        -o-text-overflow:ellipsis;
        -icab-text-overflow: ellipsis;
        -khtml-text-overflow: ellipsis;
        -moz-text-overflow: ellipsis;
        -webkit-text-overflow: ellipsis; ">${sm.content}</p></td>
                        <td>    <fmt:formatDate value="${sm.createTime}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></td></td>
                        <td >
                        <span ><a id="readMessage"  style=" cursor: pointer;">查看</a></span>
                        </td>
                    </tr>
                </c:forEach>
                <div id="massage_box">
                    <div class="massage">
                        <div class="header" onmousedown=MDown(massage_box)>
                            <div style="display:inline; position:absolute">消息详细</div>
                            <span onClick="massage_box.style.visibility='hidden'; mask.style.visibility='hidden'" style="float:right; display:inline; cursor:pointer;">×</span>
                        </div>
                        <div><p id="messageDetails"  style="margin-right: 10px; word-break:break-all;">



                        </p></div>
                    </div>
                </div>
                <div id="mask"></div>
            </table>

            <div class="gy_foot">
                <%@ include file="/WEB-INF/jsp/public/page.jspf" %>
            </div>
            </form>
            <div class="yangshi"></div>


        </div>
    </div>


</div>


</body>

<script type="text/javascript">
//绑定select的onchange事件

$(document).ready(function(){
    $('#recentTime1').change(function(){
        $('#recentTime').val($(this).children('option:selected').val());
        $('#userMessageForm').submit();
    })
    $('#messageStatus1').change(function(){
        $('#messageStatus').val($(this).children('option:selected').val());
        $('#userMessageForm').submit();
    })
    $('#messageType1').change(function(){
        $('#messageType').val($(this).children('option:selected').val());
        $('#userMessageForm').submit();

    })
    $("[id=readMessage]").click(function(){


                $("[id=massage_box]").css("visibility","visible");
                $("[id=mask]").css("visibility","visible");
                var $thisTD=$(this).parents("span").parents("td").parents("tr").find("td:eq(3)")//下标0开始的
                $("[id=messageDetails]").html($thisTD.text());

               // alert($thisTD.text());
            }


    )


})
function selectAll(checkedValue){
    $("[id=messageIds]").attr("checked", checkedValue);
}


function chanageReaded(){
    if($('input[name="messageIds"]:checked').length>0){

        $.ajax({url:'/user/changeMessageStatusAjax',
            type:'post',
            dataType:'json',
            data:$('#userMessageForm').serialize(),
            cache : false,
            success:function(json){
                if(json.res=='success'){
                    alert('标记成功');
//                    $('input[name="messageIds"]:checked').each(function(){
//                        var $thisTD=$(this).parents("tr").find("td:eq(1)")//下标0开始的
//                      $thisTD.html("已读信息")//改变内容为 已读信息
//                        $(this).attr("checked", false);
//                    });
                    go2Page( ${page.pageNo});


                }
            }
        });
    }else{
        alert("请选择要标记的消息");
    }
    }
    function   deleteMessagebyIds(){
        if($('input[name="messageIds"]:checked').length>0){
        if(confirm("确定删除?")){
        $.ajax({url:'/user/deleteMessageByIdsAjax',
            type:'post',
            dataType:'json',
            data:$('#userMessageForm').serialize(),
            cache : false,
            success:function(json){
                if(json.res=='success'){
                    alert('删除成功');

                    go2Page( ${page.pageNo});
                }
            }
        });
        }
        }else{
            alert("请选择要删除的消息");

        }
    }

</script>
</html>