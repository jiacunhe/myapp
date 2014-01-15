<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" media="all" href="/css/jsDatePick_ltr.min.css" />
    <script type="text/javascript" src="/js/jsDatePick.min.1.3.js"></script>

    <link rel="stylesheet" type="text/css"  href="/images/dialog/dialog.css">
    <script  type="text/javascript"  src="/images/dialog/dialog.js"></script>
    <style type="text/css">

        .page ul{ width: 80%; float: left}
        .page ul li{ float: left; margin-left: 0px; margin-left: 5px; padding: 3px;}
        .nowpage{ color:#000000; font-weight: 600;}
        .flleft{text-align: left; padding-left: 4px;}
    </style>
    <title>用户查询</title>

    <script type="text/javascript">
        window.onload = function(){   new JsDatePick({ useMode:2,  target:"sday",  dateFormat:"%Y-%m-%d" });  new JsDatePick({  useMode:2, target:"eday",  dateFormat:"%Y-%m-%d" }); }
    </script>
</head>

<body>


<div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>我的查询</span></p>
    </div>
<!--div class="content_right_nr">
    <h4 class="sub_title1"><p class="sub_p8">提 醒</p></h4>
    <div class="sub_nr" style="height:60px;">
        <ul class="dd_list1">
            <li>已完成的订单：<span>（<b>1</b>）</span></li>
            <li>未完成的订单：<span>（<b>0</b>）</span></li>
            <li>未查到的订单：<span>（<b>0</b>）</span></li>
        </ul>
    </div>
</div-->

    <div class="content_right_nr" style=" margin-top:16px;">
        <h4 class="sub_title1"><p class="sub_p5">搜索</p></h4>
        <div style="height:120px;">
            <form method="post" action="/orderManage/search" class="sub_form3">

                <p style="width: 80px">查询时间：</p>
                <input type="text"  class="sub_input01" style="background:url(/images/ico013.jpg) right no-repeat;width: 160px;  " name="sday" id="sday" value="${sday}" >
                <span class="span1" style="float:left; display:inline;">至</span>
                <input type="text"  class="sub_input01"  style="background:url(/images/ico013.jpg) right no-repeat;width: 160px; " id="eday" name="eday" value="${eday}">
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
                <p style="width: 80px;"> 用户帐号：</p>
                <input type="text" name="userId" value="${userId}" class="sub_input01" style="width: 160px"/>
<%--                <p style="width: 80px">证件号：</p>
                <input type="text" name="code" value="${code}" class="sub_input01" style="width: 160px"/>
                <p style="width: 50px;"> 名称：</p>
                <input type="text" name="name" value="${name}" class="sub_input01" style="width: 160px"/>--%>
                <input type="hidden" name="submit" value="1">
                <input type="submit" value="查询"  class="but_cx0" style="margin-left:30px"/>
            </form>
        </div>
    </div>



    <div class="content_right_nr" id="qc_sell_tab">
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
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="7%">序号</th>
            <th width="11%">用户ID</th>
            <th width="10%">查询类型</th>
            <th width="41%">查询对象</th>
            <th width="14%">查询时间</th>
            <th width="10%">状态</th>
            <th width="7%">数据</th>
        </tr>

        <c:forEach  var="obj" items="${disposable.list}"   varStatus="status">
            <tr style="text-align: center">
                <td>${(disposable.page-1)*5+status.count}</td>
                <td>${obj.userId}</td>
                <td>${obj.orderTypeName}</td>
                <td  class="flleft">${obj.objCode} | ${obj.objName}</td>
                <td>${obj.createTime}</td>
                <td>${obj.statusName}</td>
                <td>
                    <c:if test="${obj.status eq '2'}">
                        <a href="/order/result?id=${obj.id}"><img src="/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                    </c:if>
                    <c:if test="${obj.status ne '2'}">
                       <img src="/images/nomessage.png"  height="20" width="20">
                    </c:if>
                </td>
            </tr>

        </c:forEach>
        <tr class="page">
            <td colspan="7">
                <ul>
                    <li><a href="javascript:search('disposable',${disposable.page -1})">Prev</a></li>
                    <c:if test="${disposable.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${disposable.page-1}" step="1">
                            <li><a href="javascript:search('disposable',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${disposable.page > 9}">
                        <c:forEach var="i" begin="${disposable.page-5}" end="${disposable.page-1}" step="1">
                            <li><a href="javascript:search('disposable',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('disposable',${disposable.page})" class="nowpage">${done.page}</a></li>
                    <c:forEach var="j" begin="${disposable.page+1}" end="${disposable.page + 5}" step="1">
                        <c:if test="${j <= disposable.totalpage}">
                            <li><a href="javascript:search('disposable',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('disposable',${disposable.page + 1})">Next</a></li>
                    <li><span >共 ${disposable.totalitem }条 ，当前第 <strong> ${disposable.page }</strong> / <span> <strong>${disposable.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>
<dd style="display:none;" id="content3">
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="5%">序号</th>
            <th width="10%">用户ID</th>
            <th width="10%">查询类型</th>
            <th width="40%">查询对象</th>
            <th width="13%">查询时间</th>
            <th width="10%">状态</th>
            <th width="6%">动态</th>
            <th width="6%">数据</th>
        </tr>
        <c:forEach  var="obj" items="${recyclable.list}"   varStatus="status">
            <tr style="text-align: center">
                <td>${(recyclable.page-1)*5+status.count}</td>
                <td>${obj.userId}</td>
                <td>${obj.orderTypeName}</td>
                <td class="flleft">${obj.objCode} | ${obj.objName}</td>
                <td>${obj.createTime}</td>
                <td>${obj.statusName}</td>
                <td>

                    <c:choose>
                        <c:when  test="${obj.status eq '6'}">
                            <a href="javascript:openDetail(${obj.id},${obj.orderType})"><img src="/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:when  test="${obj.status eq '2'}">
                            <a href="javascript:openDetail(${obj.id},${obj.orderType})"><img src="/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:otherwise>
                            <img src="/images/bobo.png"  height="20" width="20">
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>

                    <c:choose>
                        <c:when  test="${obj.status eq '6'}">
                            <a href="/order/result?id=${obj.id}"><img src="/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:when  test="${obj.status eq '2'}">
                            <a href="/order/result?id=${obj.id}"><img src="/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a>
                        </c:when>
                        <c:otherwise>
                            <img src="/images/nomessage.png"  height="20" width="20">
                        </c:otherwise>
                    </c:choose>


                </td>
            </tr>
        </c:forEach>

        <tr class="page">
            <td colspan="8">
                <ul>
                    <li><a href="javascript:search('recyclable',${recyclable.page -1})">Prev</a></li>
                    <c:if test="${recyclable.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${recyclable.page-1}" step="1">
                            <li><a href="javascript:search('recyclable',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${recyclable.page > 9}">
                        <c:forEach var="i" begin="${recyclable.page-5}" end="${recyclable.page-1}" step="1">
                            <li><a href="javascript:search('recyclable',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('recyclable',${recyclable.page})" class="nowpage">${undone.page}</a></li>
                    <c:forEach var="j" begin="${recyclable.page+1}" end="${undone.page + 5}" step="1">
                        <c:if test="${j <= recyclable.totalpage}">
                            <li><a href="javascript:search('recyclable',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('recyclable',${recyclable.page + 1})">Next</a></li>
                    <li><span >共 ${recyclable.totalitem }条 ，当前第 <strong> ${recyclable.page }</strong> / <span> <strong>${recyclable.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>







<script type="text/javascript">
    if('${type}'=='4' || '${type}'=='5'){
        document.getElementById("searchResultTab2").style.background = "url(/images/sub_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab2").style.color = "#fd7d00";
        document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
    }else{
        document.getElementById("searchResultTab1").style.background = "url(/images/sub_ttbg4.gif) no-repeat";
        document.getElementById("searchResultTab1").style.color = "#fd7d00";
        document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
    }


    function tabCard(){
        var e = window.event?window.event.srcElement:e.target;

        if(e.innerText == "查询信息"){
            document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
        }else if(e.innerText == "监控信息"){
            document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
        }

        for(i=0;i<document.getElementById("select_table").childNodes.length;i++)
        {
            if(document.getElementById("select_table").childNodes.item(i).nodeName=="A"){
                document.getElementById("select_table").childNodes.item(i).style.background = "none";
                document.getElementById("select_table").childNodes.item(i).style.color = "#3f3f3f";
               // display:block;width:187px;height:34px;line-height:34px;float:left;margin-top:1px;text-align:center;font-weight:bold;font-size:12px; display:inline; color:#3f3f3f;
            }

        }
        e.style.background = "url(/images/sub_ttbg4.gif) no-repeat";
        e.style.color = "#fd7d00";

        e.blur();			//Chrome和Opera不需要
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
        var url = '/orderManage/searchForAjax';
        request.open("POST", url, "true");

        var post = "userId=${userId}&type=${type}&eday=${eday}&sday=${sday}&code=${code}&submit=true&page="+page+"&status=${status}&name=${name}&businessType="+monitor;
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

        var content=' <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="7%">序号</th>';
        content+='<th width="11%">用户ID</th>';
        content+='<th width="10%">查询类型</th>';
        content+='<th width="41%">查询对象</th>';
        content+='<th width="14%">查询时间</th>';
        content+='<th width="10%">状态</th>';
        content+='<th width="7%">数据</th>';
        content+='</tr>';


        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td>'+((obj.page-1)*5+i)+'</td>';
            content+='<td>'+obj.list[i].userId+'</td>';
            content+='<td>'+obj.list[i].orderTypeName+'</td>';
            content+='<td class="flleft">'+obj.list[i].objCode+'| '+obj.list[i].objName+'</td>';
            content+='<td>'+obj.list[i].createTime+'</td>';
            content+='<td>'+obj.list[i].statusName+'</td>';


            if(obj.list[i].status == '2'){
                content+='<td> <a href="/order/result?id='+obj.list[i].id+'"><img src="/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="7">';
        content+='<ul>';
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+(obj.page-1)+')">Prev</a></li>';
        if(obj.page<=9){
            for(var i=1;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        if(obj.page>9){
            for(var i=obj.page-5;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+obj.page+')" class="nowpage">'+obj.page+'</a></li>';
        for(var i=obj.page-1+2;i<obj.page+5;i++){
            if(i<=obj.totalpage){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+(obj.page-1+2)+')">Next</a></li>';
        content+='<li><span >共 '+obj.totalitem+' 条 ，当前第 <strong>  '+obj.page+' </strong> / <span> <strong> '+obj.totalpage+' </strong> </span> 页 </span> </li>';
        content+='</ul>';

        content+='</td>';
        content+='</tr>';
        content+='</table>';
        return content;
    }

    function createContentRecyclable(obj){

        var content=' <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="5%">序号</th>';
        content+='<th width="10%">用户ID</th>';
        content+='<th width="10%">查询类型</th>';
        content+='<th width="40%">查询对象</th>';
        content+='<th width="13%">查询时间</th>';
        content+='<th width="10%">状态</th>';
        content+='<th width="6%">动态</th>';
        content+='<th width="6%">数据</th>';
        content+='</tr>';


        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td>'+((obj.page-1)*5+i)+'</td>';
            content+='<td>'+obj.list[i].userId+'</td>';
            content+='<td>'+obj.list[i].orderTypeName+'</td>';
            content+='<td class="flleft">'+obj.list[i].objCode+'| '+obj.list[i].objName+'</td>';
            content+='<td>'+obj.list[i].createTime+'</td>';
            content+='<td>'+obj.list[i].statusName+'</td>';
            if(obj.list[i].status == '2'|| obj.list[i].status == '6'){
                content+='<td> <a href="javascript:openDetail('+obj.list[i].id+','+obj.list[i].orderType+')"><img src="/images/kaka.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            if(obj.list[i].status == '2'|| obj.list[i].status == '6'){
                content+='<td> <a href="/order/result?id='+obj.list[i].id+'"><img src="/images/newmessage.png" alt="查看" title="查看" height="20" width="20"></a></td>';
            }else{
                content+='<td><img src="/images/nomessage.png" alt="查看" title="查看" height="20" width="20"></td>';
            }

            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="8">';
        content+='<ul>';
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+(obj.page-1)+')">Prev</a></li>';
        if(obj.page<=9){
            for(var i=1;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        if(obj.page>9){
            for(var i=obj.page-5;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+obj.page+')" class="nowpage">'+obj.page+'</a></li>';
        for(var i=obj.page-1+2;i<obj.page+5;i++){
            if(i<=obj.totalpage){
                content+='<li><a href="javascript:search(\''+obj.businessType+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.businessType+'\','+(obj.page-1+2)+')">Next</a></li>';
        content+='<li><span >共 '+obj.totalitem+' 条 ，当前第 <strong>  '+obj.page+' </strong> / <span> <strong> '+obj.totalpage+' </strong> </span> 页 </span> </li>';
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
        dialog.OpenWindow("/order/subsidiary?id="+id+"&orderType="+orderType);
    }

</script>
</body>
</html>
