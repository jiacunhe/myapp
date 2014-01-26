<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
    <link rel="stylesheet" type="text/css" media="all" href="${basePath}/css/jsDatePick_ltr.min.css" />
    <script type="text/javascript" src="${basePath}/js/jsDatePick.min.1.3.js"></script>

    <link rel="stylesheet" type="text/css"  href="${basePath}/images/dialog/dialog.css">
    <script  type="text/javascript"  src="${basePath}/images/dialog/dialog.js"></script>
    <style type="text/css">

        .page ul{ width: 97%; float: left}
        .page ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
        .page ul li a img{padding-top: 7px;}
        .tdcc{text-align: left; padding-left: 4px;white-space:nowrap;

            word-break:keep-all;

            overflow:hidden;

            text-overflow:ellipsis;       width: 300px;
        }
    </style>
    <title>我的查询</title>

    <script type="text/javascript">
        window.onload = function(){   new JsDatePick({ useMode:2,  target:"sday",  dateFormat:"%Y-%m-%d" });  new JsDatePick({  useMode:2, target:"eday",  dateFormat:"%Y-%m-%d" }); }
    </script>
</head>

<body>


<div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>我的查询</span></p>
    </div>

    <div class="content_right_nr0" style="height:465px;margin-top:16px;">

    <div class="content_right_nr01">


        <h4 class="sub_title1"><p class="sub_p5">搜索</p></h4>
        <div style="height:120px;">
            <form method="post" action="${basePath}/order/search" class="sub_form3">

                <p style="width: 80px">查询时间：</p>
                <input type="text"  class="sub_input01" style="background:url(${basePath}/images/ico013.jpg) right no-repeat;width: 160px;  " name="sday" id="sday" value="${sday}" >
                <span class="span1" style="float:left; display:inline;">至</span>
                <input type="text"  class="sub_input01"  style="background:url(${basePath}/images/ico013.jpg) right no-repeat;width: 160px; " id="eday" name="eday" value="${eday}">
                <p style="width: 50px">类型：</p>
                <span class="span03">
                    <select class="sub_input013" name="type" style="width: 162px;">
                        <option value="">全部</option>
                        <c:forEach  var="obj" items="${orderTypeList}">
                            <option value="${obj.id}" <c:if test="${type eq obj.id}">selected </c:if> >${obj.orderName}</option>
                        </c:forEach>
                    </select>
                </span>

                <div class="clear"></div>
                <p style="width: 80px">证件号：</p>
                <input type="text" name="code" value="${code}" class="sub_input01" style="width: 160px"/>
                <p style="width: 50px;"> 名称：</p>
                <input type="text" name="name" value="${name}" class="sub_input01" style="width: 160px"/>
                <input type="hidden" name="submit" value="1">
                <input type="submit" value="查询"  class="but_cx0" style="margin-left:30px"/>
            </form>
        </div>
    </div>



    <div class="content_right_nr01" id="qc_sell_tab">
       

        <dl class="sub_dl2">
                <dt><h4 class="sub_title1" id="select_table" onclick="tabCard(); return false;" >

                    <a id="searchResultTab1" href="#">查询信息</a>
                    <a id="searchResultTab2" href="#">监控信息</a>
                </h4></dt>



                <div class="sub_nr">

                    <dd style="display:block;" id="content">
                    </dd>

                </div>

        </dl>
    </div>

</div>




<dd style="display:none;" id="content2">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="10%">序号</th>
            <th width="12%">查询类型</th>
            <th width="42%">查询对象</th>
            <th width="16%">查询时间</th>
            <th width="12%">状态</th>
            <th width="8%">数据</th>
        </tr>

        <c:forEach  var="obj" items="${disposable.list}"   varStatus="status">
            <tr style="text-align: center; width: 749px;">
                <td>${(disposable.page-1)*5+status.count}</td>
                <td>${obj.orderTypeName}</td>
                <td title="${obj.objCode} | ${obj.objName}"><div class="tdcc">${obj.objCode} | ${obj.objName}</div></td>
                <td>${obj.createTime}</td>
                <td>${obj.statusName}</td>
                <td>
                    <c:if test="${obj.status eq '2'}">
                        <a href="${basePath}/order/result?id=${obj.id}"><img src="${basePath}/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                    </c:if>
                    <c:if test="${obj.status ne '2'}">
                       <img src="${basePath}/images/nomessage.png"  height="20" width="20">
                    </c:if>
                </td>
            </tr>

        </c:forEach>
        <tr class="page">
            <td colspan="6">
                <ul>

                    <li>页次：<strong> ${disposable.page }</strong>/<span><strong>${disposable.totalpage}</strong></span> 页 </span> <span >总记录数：${disposable.totalitem }条 </li>

                    <li><a href="javascript:search('disposable',1)"><img src="${pageContext.request.contextPath}/images/firstPage.png"/></a></li>



                    <c:forEach var="i" begin="${disposable.page - 5>=1?disposable.page - 5:1}" end="${disposable.page + 4}" step="1">
                    <c:if test="${i <= disposable.totalpage}">
                        <li> <a href="javascript:search('disposable',${i})"  <c:if test="${i == disposable.page}">style="color:#000000; font-weight: 600;"     </c:if>>${i}</a>  </li>
                    </c:if>
                    </c:forEach>

                    <li><a href="javascript:search('disposable',${disposable.totalpage})"><img src="${pageContext.request.contextPath}/images/lastPage.png"/></a></li>
                    <li>

                         转到第 <input id="pn" onFocus="this.select();" maxlength="5" type="text" value="1" name="currPage" tabindex="0" style="width: 33px; height: 14px; text-align: center; text-indent: 0"/> 页
                         <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="search('disposable',document.getElementById('pn').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>

                    </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>
<dd style="display:none;" id="content3">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="6%">序号</th>
            <th width="10%">查询类型</th>
            <th width="39%">查询对象</th>
            <th width="25%">监控区间</th>
            <th width="8%">状态</th>
            <th width="6%">动态</th>
            <th width="6%">数据</th>
        </tr>
        <c:forEach  var="obj" items="${recyclable.list}"   varStatus="status">
            <tr style="text-align: center;width: 749px">
                <td>${(recyclable.page-1)*5+status.count}</td>
                <td>${obj.orderTypeName}</td>
                <td title="${obj.objCode} | ${obj.objName}"><div class="tdcc">${obj.objCode} | ${obj.objName}</div></td>
                <td>
                    ${obj.createTime}  &nbsp; ${obj.monitorOverTime}

                </td>
                <td>${obj.statusName}</td>
                <td>

                    <c:choose>
                        <c:when  test="${obj.status eq '6'}">
                            <a href="javascript:openDetail(${obj.id},${obj.orderType})"><img src="${basePath}/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:when  test="${obj.status eq '2'}">
                            <a href="javascript:openDetail(${obj.id},${obj.orderType})"><img src="${basePath}/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:otherwise>
                            <img src="${basePath}/images/bobo.png"  height="20" width="20">
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>

                    <c:choose>
                        <c:when  test="${obj.status eq '6'}">
                            <a href="${basePath}/order/result?id=${obj.id}"><img src="${basePath}/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:when  test="${obj.status eq '2'}">
                            <a href="${basePath}/order/result?id=${obj.id}"><img src="${basePath}/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:otherwise>
                            <img src="${basePath}/images/nomessage.png"  height="20" width="20">
                        </c:otherwise>
                    </c:choose>


                </td>
            </tr>
        </c:forEach>

        <tr class="page">
            <td colspan="7">
                <ul>
                    <li>页次：<strong> ${recyclable.page }</strong>/<span><strong>${recyclable.totalpage}</strong></span> 页 </span> <span >总记录数：${recyclable.totalitem }条 </li>
                    <li><a href="javascript:search('recyclable',1)"><img src="${pageContext.request.contextPath}/images/firstPage.png"/></a></li>

                    <c:forEach var="i" begin="${recyclable.page - 5>=1?recyclable.page - 5:1}" end="${recyclable.page + 4}" step="1">
                        <c:if test="${i <= recyclable.totalpage}">
                            <li> <a href="javascript:search('recyclable',${i})"  <c:if test="${i == recyclable.page}">style="color:#000000; font-weight: 600;"     </c:if>>${i}</a>  </li>
                        </c:if>
                    </c:forEach>

                    <li><a href="javascript:search('recyclable',${recyclable.totalpage})"><img src="${pageContext.request.contextPath}/images/lastPage.png"/></a></li>
                    <li> 转到第 <input id="pn2" onFocus="this.select();" maxlength="5" type="text" value="1" name="currPage" tabindex="0" style="width: 33px; height: 14px; text-align: center; text-indent: 0"/> 页
                        <input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="search('recyclable',document.getElementById('pn2').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>

                    </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>







<script type="text/javascript">
    if('${type}'=='4' || '${type}'=='5'){
        document.getElementById("searchResultTab2").style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab2").style.color = "#fd7d00";
        document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
    }else{
        document.getElementById("searchResultTab1").style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab1").style.color = "#fd7d00";
        document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
    }

    var lastTabl;
    function tabCard(){
        var e = window.event ? window.event.srcElement:e.target;
        if(e.innerText == "查询信息"){
            document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
        }else if(e.innerText == "监控信息"){
            document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
        }

        for(i=0;i<document.getElementById("select_table").childNodes.length;i++)
        {
            if(document.getElementById("select_table").childNodes.item(i).nodeName=="A"){
             //   alert(document.getElementById("select_table").childNodes.item(i).id);
                document.getElementById("select_table").childNodes.item(i).style.background = "none";
                document.getElementById("select_table").childNodes.item(i).style.color = "#3f3f3f";
               // display:block;width:187px;height:34px;line-height:34px;float:left;margin-top:1px;text-align:center;font-weight:bold;font-size:12px; display:inline; color:#3f3f3f;
            }

        }
        if(e.nodeName=="A"){
            lastTabl = e;
            e.style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
            e.style.color = "#fd7d00";

            e.blur();          //Chrome和Opera不需要
        }else{
            lastTabl.style.background = "url(${basePath}/images/sub_ttbg4.gif) no-repeat";
            lastTabl.style.color = "#fd7d00";

            lastTabl.blur();          //Chrome和Opera不需要
        }

    }
</script>

<script type="text/javascript">
    var request;
    try{
        request=new XMLHttpRequest();
    }catch (e){
        try{
            request=new ActiveXObject("Msxml2.XMLHTTP");
        }catch (e){
            try{
                request=new ActiveXObject("Microsoft.XMLHTTP");
            }catch (e) {
                alert("您的浏览器不支持AJAX！");
            }
        }
    }
  //  request.setRequestHeader("Content-Type", "utf-8");

    //var statuscode;
    function search(monitor,page){
     //   statuscode = status;
        var url = '${basePath}/order/searchForAjax';
        request.open("POST", url, "true");

        var post = "type=${type}&eday=${eday}&sday=${sday}&code=${code}&submit=true&page="+page+"&status=${status}&name=${name}&businessType="+monitor;
        //    post = encodeURI(post);
        //    post = encodeURI(post);
        request.setRequestHeader("Cache-Control","no-cache");
        request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        request.onreadystatechange = searchResult;//隐性的循环
        request.send(post);
    }


    function searchResult(){
        if (request.readyState == 4) {
            if (request.status == 200) {
                var rest = request.responseText;
                if (rest != "") {
                    var jsonObj=eval('('+rest+')');
                    if(jsonObj.businessType == 'disposable'){
                        document.getElementById("content2").innerHTML = createContent(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
                    }else if(jsonObj.businessType == 'recyclable'){
                        document.getElementById("content3").innerHTML = createContentRecyclable(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
                    }
                }
            }
        }
    }

    function createContent(obj){

        var content=' <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="10%">序号</th>';
        content+='<th width="12%">查询类型</th>';
        content+='<th width="42%">查询对象</th>';
        content+='<th width="16%">查询时间</th>';
        content+='<th width="12%">状态</th>';
        content+='<th width="8%">数据</th>';
        content+='</tr>';


        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td>'+((obj.page-1)*5+i+1)+'</td>';
            content+='<td>'+obj.list[i].orderTypeName+'</td>';
            content+='<td title="'+obj.list[i].objCode+' | '+obj.list[i].objName+'"><div class="tdcc">'+obj.list[i].objCode+' | '+obj.list[i].objName+'</div></td>';
            content+='<td>'+obj.list[i].createTime+'</td>';
            content+='<td>'+obj.list[i].statusName+'</td>';


            if(obj.list[i].status == '2'){
                content+='<td> <a href="${basePath}/order/result?id='+obj.list[i].id+'"><img src="${basePath}/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="${basePath}/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="6">';


        content+='<ul>';
        content+=' <li>页次：<strong>'+obj.page+'</strong>/<span><strong>'+obj.totalpage+'</strong></span> 页 </span> <span >总记录数： '+obj.totalitem+'条 </li>';
        content+='<li><a href="javascript:search(\''+obj.businessType+'\',1)"><img src="${pageContext.request.contextPath}/images/firstPage.png"/></a></li>';
        var styl="";
        var i = obj.page - 5>=1?obj.page - 5:1;
        for(;i<obj.page+4;i++){
            if(i==obj.page){styl="color:#000000; font-weight: 600;";} else{styl=""}
            if(i<=obj.totalpage)  {
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')" style="'+styl+'">'+i+'</a></li>';
            }
        }

        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+obj.totalpage+')"><img src="${pageContext.request.contextPath}/images/lastPage.png"/></a></li>';
        content+='<li> 转到第 <input id="pnpp" onFocus="this.select();" maxlength="5" type="text" value="1" name="currPage" tabindex="0" style="width: 33px; height: 14px; text-align: center; text-indent: 0"/> 页 ';
        content+='<input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="search(\''+obj.businessType+'\',document.getElementById(\'pnpp\').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>  ';
        content+='</ul>';



        content+='</td>';
        content+='</tr>';
        content+='</table>';
        return content;
    }

    function createContentRecyclable(obj){

        var content=' <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="7%">序号</th>';
        content+='<th width="10%">查询类型</th>';
        content+='<th width="40%">查询对象</th>';
        content+='<th width="19%">监控区间</th>';
        content+='<th width="10%">状态</th>';
        content+='<th width="7%">动态</th>';
        content+='<th width="7%">数据</th>';
        content+='</tr>';


        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td>'+((obj.page-1)*5+i+1)+'</td>';
            content+='<td>'+obj.list[i].orderTypeName+'</td>';
            content+='<td title="'+obj.list[i].objCode+' | '+obj.list[i].objName+'"><div class="tdcc">'+obj.list[i].objCode+' | '+obj.list[i].objName+'<div></td>';
            content+='<td>'+obj.list[i].createTime +" &nbsp; "+ obj.list[i].monitorOverTime+'</td>';
            content+='<td>'+obj.list[i].statusName+'</td>';
            if(obj.list[i].status == '2'|| obj.list[i].status == '6'){
                content+=' <td><a href="javascript:openDetail('+obj.list[i].id+','+obj.list[i].orderType+')"><img src="${basePath}/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="${basePath}/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            if(obj.list[i].status == '2'|| obj.list[i].status == '6'){
                content+='<td> <a href="${basePath}/order/result?id='+obj.list[i].id+'"><img src="${basePath}/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="${basePath}/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="7">';

        content+='<ul>';
        content+=' <li>页次：<strong>'+obj.page+'</strong>/<span><strong>'+obj.totalpage+'</strong></span> 页 </span> <span >总记录数： '+obj.totalitem+'条 </li>';
        content+='<li><a href="javascript:search(\''+obj.businessType+'\',1)"><img src="${pageContext.request.contextPath}/images/firstPage.png"/></a></li>';
        var styl="";
        var i = obj.page - 5>=1?obj.page - 5:1;
        for(;i<obj.page+4;i++){
            if(i==obj.page){styl="color:#000000; font-weight: 600;";} else{styl=""}
            if(i<=obj.totalpage)  {
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')" style="'+styl+'">'+i+'</a></li>';
            }
        }

        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+obj.totalpage+')"><img src="${pageContext.request.contextPath}/images/lastPage.png"/></a></li>';
        content+='<li> 转到第 <input id="pnpp" onFocus="this.select();" maxlength="5" type="text" value="1" name="currPage" tabindex="0" style="width: 33px; height: 14px; text-align: center; text-indent: 0"/> 页 ';
        content+='<input type="button" name="goBtn" value="前往" class="MiddleButtonStyle" onclick="search(\''+obj.businessType+'\',document.getElementById(\'pnpp\').value)" style="width: 32px; height: 20px; border: 1px solid #218bc6; background: #27a5ec; color: #fff;"/>  ';
        content+='</ul>';
        content+='</td>';
        content+='</tr>';
        content+='</table>';
        return content;

    }
</script>



<script type="text/javascript">
    var dialog;
    function openDetail(id,orderType){
        dialog=new Dialog("查看监控信息");
        dialog.SetRange(500,300);
        dialog.SetXY((window.document.body.clientWidth -500)/2,150);
        dialog.OpenWindow("${basePath}/order/subsidiary?id="+id+"&orderType="+orderType);
    }

</script>
</div>
</body>
</html>
