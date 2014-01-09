<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    </style>
    <title>我的订单</title>

    <script type="text/javascript">
        window.onload = function(){
            new JsDatePick({
                useMode:2,
                target:"sday",
                dateFormat:"%Y-%m-%d"
            });
            new JsDatePick({
                useMode:2,
                target:"eday",
                dateFormat:"%Y-%m-%d"
                /*selectedDate:{				This is an example of what the full configuration offers.
                 day:5,						For full documentation about these settings please see the full version of the code.
                 month:9,
                 year:2006
                 },
                 yearsRange:[1978,2020],
                 limitToToday:false,
                 cellColorScheme:"beige",
                 dateFormat:"%m-%d-%Y",
                 imgPath:"img/",
                 weekStartDay:1*/
            });
        }
    </script>
</head>

<body>


<div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <span>我的订单</span></p>
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
        <h4 class="sub_title1"><p class="sub_p5">订单查询</p></h4>
        <div style="height:120px;">
            <form method="post" action="/order/search" class="sub_form3">
                <p>订单类型： </p>
                            <span class="span03">
                                <select class="sub_input013" name="type">
                                    <option value="">全部</option>
                                    <c:forEach  var="obj" items="${orderTypeList}">
                                        <option value="${obj.id}" <c:if test="${status eq obj.id}">selected </c:if> >${obj.orderName}</option>
                                    </c:forEach>
                                </select>
                            </span>
                <p>订单时间：</p>
                <input type="text"  class="sub_input01" style="background:url(/images/ico013.jpg) right no-repeat  " name="sday" id="sday" value="${sday}" >
                <span class="span1" style="float:left; display:inline;">至</span>
                <input type="text"  class="sub_input01"  style="background:url(/images/ico013.jpg) right no-repeat " id="eday" name="eday" value="${eday}">
                <div class="clear"></div>
                <p>订单编号:</p>
                <input type="text" name="id" value="${id}" class="sub_input01" style="width: 260px"/>
                <input type="hidden" name="submit" value="1">
                <input type="submit" value="查询"  class="but_cx0" style="margin-left:30px"/>
            </form>
        </div>
    </div>



    <div class="content_right_nr" id="qc_sell_tab">
        <dl class="sub_dl2">
                <dt><h4 class="sub_title1" id="select_table" onclick="tabCard(); return false;" >
                    <a href="#" style=" background:url(../images/sub_ttbg4.gif) no-repeat; color:#fd7d00;">全部订单</a>
                    <a href="#">已完成订单</a>
                    <a href="#">未完成订单</a>
                    <a href="#">未查到订单</a>
                </h4></dt>



                <div class="sub_nr">

                    <dd style="display:block;" id="content">
                    </dd>
                </div>

        </dl>
    </div>

</div>




<dd style="display:none;" id="content1">
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1" >
            <th width="33%" rowspan="2">订单编号</th>
            <th width="17%" rowspan="2"><p>订单类型</p></th>
            <th width="22%" rowspan="2">下单时间</th>
            <th width="10%" rowspan="2">订单状态</th>
            <th colspan="3">查询条数（条）</th>
        </tr>
        <tr class="sub_tr1">
            <th width="6%" style=" line-height: 18px; padding: 0;">查询总条数</th>
            <th width="6%" style=" line-height: 18px; padding: 0;">已查到条数</th>
            <th width="6%" style=" line-height: 18px; padding: 0;">未查到条数</th>
        </tr>

        <c:forEach  var="obj" items="${all.list}"   varStatus="status">
            <tr style="text-align: center">
                <td><a href="/order/detail?id=${obj.id}">${obj.id}</a></td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.statusName}</td>
                <td>${obj.total}</td>
                <td <c:if test="${obj.doneNum > 0}">onclick="openDetail('${obj.id}','done')" style="cursor:hand; color:#fd7d00; text-decoration: underline " </c:if>>${obj.doneNum}</td>
                <td <c:if test="${obj.total > obj.doneNum }">onclick="openDetail('${obj.id}','undone')" style="cursor:hand; color:#fd7d00; text-decoration: underline " </c:if>>${obj.total - obj.doneNum }</td>
            </tr>

        </c:forEach>
        <tr class="page">
            <td colspan="7">
                <ul>
                    <li><a href="javascript:search('all',${all.page -1})">Prev</a></li>
                    <c:if test="${all.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${all.page-1}" step="1">
                            <li><a href="javascript:search('all',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${all.page > 9}">
                        <c:forEach var="i" begin="${all.page-5}" end="${all.page-1}" step="1">
                            <li><a href="javascript:search('all',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('all',${all.page})" class="nowpage">${all.page}</a></li>
                    <c:forEach var="j" begin="${all.page+1}" end="${all.page + 5}" step="1">
                        <c:if test="${j <= all.totalpage}">
                            <li><a href="javascript:search('all',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('all',${all.page + 1})">Next</a></li>
                    <li><span >共 ${all.totalitem }条 ，当前第 <strong> ${all.page }</strong> / <span> <strong>${all.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>

    </table>
</dd>
<dd style="display:none;" id="content2">
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="33%" rowspan="2">订单编号</th>
            <th width="17%" rowspan="2"><p>订单类型</p></th>
            <th width="22%" rowspan="2">下单时间</th>
            <th width="10%" rowspan="2">订单状态</th>
            <th colspan="3">查询条数（条）</th>
        </tr>
        <tr class="sub_tr1">
            <th width="6%" style=" line-height: 18px; padding: 0;">查询总条数</th>
            <th width="6%" style=" line-height: 18px; padding: 0;">已查到条数</th>
            <th width="6%" style=" line-height: 18px; padding: 0;">未查到条数</th>
        </tr>
        <c:forEach  var="obj" items="${done.list}"   varStatus="status">
            <tr style="text-align: center">
                <td><a href="/order/detail?id=${obj.id}">${obj.id}</a></td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.statusName}</td>
                <td>${obj.total}</td>
                <td <c:if test="${obj.doneNum > 0}">onclick="openDetail('${obj.id}','done')" style="cursor:hand; color:#fd7d00; text-decoration: underline " </c:if>>${obj.doneNum}</td>
                <td <c:if test="${obj.total > obj.doneNum }">onclick="openDetail('${obj.id}','undone')" style="cursor:hand; color:#fd7d00; text-decoration: underline " </c:if>>${obj.total - obj.doneNum }</td>

            </tr>

        </c:forEach>
        <tr class="page">
            <td colspan="6">
                <ul>
                    <li><a href="javascript:search('done',${done.page -1})">Prev</a></li>
                    <c:if test="${done.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${done.page-1}" step="1">
                            <li><a href="javascript:search('done',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${done.page > 9}">
                        <c:forEach var="i" begin="${done.page-5}" end="${done.page-1}" step="1">
                            <li><a href="javascript:search('done',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('done',${done.page})" class="nowpage">${done.page}</a></li>
                    <c:forEach var="j" begin="${done.page+1}" end="${done.page + 5}" step="1">
                        <c:if test="${j <= done.totalpage}">
                            <li><a href="javascript:search('done',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('done',${done.page + 1})">Next</a></li>
                    <li><span >共 ${done.totalitem }条 ，当前第 <strong> ${done.page }</strong> / <span> <strong>${done.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>
<dd style="display:none;" id="content3">
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="45%">订单编号</th>
            <th width="20%">订单类型</th>
            <th width="25%">下单时间</th>
            <th width="10%">查询条数</th>
        </tr>
        <c:forEach  var="obj" items="${undone.list}"   varStatus="status">
            <tr style="text-align: center">
                <td><a href="/order/detail?id=${obj.id}">${obj.id}</a></td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.total}</td>
            </tr>
        </c:forEach>

        <tr class="page">
            <td colspan="4">
                <ul>
                    <li><a href="javascript:search('undone',${undone.page -1})">Prev</a></li>
                    <c:if test="${undone.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${undone.page-1}" step="1">
                            <li><a href="javascript:search('undone',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${undone.page > 9}">
                        <c:forEach var="i" begin="${undone.page-5}" end="${undone.page-1}" step="1">
                            <li><a href="javascript:search('undone',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('undone',${undone.page})" class="nowpage">${undone.page}</a></li>
                    <c:forEach var="j" begin="${undone.page+1}" end="${undone.page + 5}" step="1">
                        <c:if test="${j <= undone.totalpage}">
                            <li><a href="javascript:search('undone',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('undone',${undone.page + 1})">Next</a></li>
                    <li><span >共 ${undone.totalitem }条 ，当前第 <strong> ${undone.page }</strong> / <span> <strong>${undone.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>
<dd style="display:none;" id="content4">
    <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
        <tr class="sub_tr1">
            <th width="45%">订单编号</th>
            <th width="20%">订单类型</th>
            <th width="25%">下单时间</th>
            <th width="10%">查询条数</th>
        </tr>
        <c:forEach  var="obj" items="${nothing.list}"   varStatus="status">
            <tr style="text-align: center">
                <td><a href="/order/detail?id=${obj.id}">${obj.id}</a></td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.total}</td>
            </tr>
        </c:forEach>


        <tr class="page">
            <td colspan="4">
                <ul>
                    <li><a href="javascript:search('nothing',${nothing.page -1})">Prev</a></li>
                    <c:if test="${nothing.page <= 9}">
                        <c:forEach var="i" begin="${1}" end="${nothing.page-1}" step="1">
                            <li><a href="javascript:search('nothing',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${nothing.page > 9}">
                        <c:forEach var="i" begin="${nothing.page-5}" end="${nothing.page-1}" step="1">
                            <li><a href="javascript:search('nothing',${i})">${i}</a></li>
                        </c:forEach>
                    </c:if>
                    <li><a href="javascript:search('nothing',${nothing.page})" class="nowpage">${nothing.page}</a></li>
                    <c:forEach var="j" begin="${nothing.page+1}" end="${nothing.page + 5}" step="1">
                        <c:if test="${j <= nothing.totalpage}">
                            <li><a href="javascript:search('nothing',${j})">${j}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="javascript:search('nothing',${nothing.page + 1})">Next</a></li>
                    <li><span >共 ${nothing.totalitem }条 ，当前第 <strong> ${nothing.page }</strong> / <span> <strong>${nothing.totalpage}</strong> </span> 页 </span> </li>
                </ul>
            </td>
        </tr>
    </table>
</dd>







<script type="text/javascript">
    document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;

    function tabCard(){
        var e = window.event?window.event.srcElement:e.target;

        if(e.innerText == "全部订单"){
            document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
        }else if(e.innerText == "已完成订单"){
            document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
        }else if(e.innerText == "未完成订单"){
            document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
        }else if(e.innerText == "未查到订单"){
            document.getElementById("content").innerHTML = document.getElementById("content4").innerHTML;
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
    function search(status,page){
     //   statuscode = status;
        var url = '/order/searchForAjax';
        request.open("POST", url, "true");

        var post = "type=${type}&eday=${eday}&sday=${sday}&id=${id}&submit=true&page="+page+"&status="+status;
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
                    if(jsonObj.status == 'all'){
                        document.getElementById("content1").innerHTML = createContent(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
                    }else if(jsonObj.status == 'done'){
                        document.getElementById("content2").innerHTML = createContent(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content2").innerHTML;
                    }else if(jsonObj.status == 'undone'){
                        document.getElementById("content3").innerHTML = createContent2(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content3").innerHTML;
                    }else if(jsonObj.status == 'nothing'){
                        document.getElementById("content4").innerHTML = createContent2(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content4").innerHTML;
                    }
                }
            }
        }
    }

    function createContent(obj){

        var content=' <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="33%" rowspan="2">订单编号</td>';
        content+='<th width="17%" rowspan="2">订单类型</td>';
        content+='<th width="22%" rowspan="2">下单时间</td>';
        content+='<th width="10%" rowspan="2">订单状态</td>';
        content+='<th colspan="3" align="center">查询条数</td>';
        content+='</tr>';
        content+='<tr>';
        content+='<th width="6%" style=" line-height: 18px; padding: 0;">查询总条数</td>';
        content+='<th width="6%" style=" line-height: 18px; padding: 0;">已查到条数</td>';
        content+='<th width="6%" style=" line-height: 18px; padding: 0;">未查到条数</td>';
        content+='</tr>';

        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td><a href="/order/detail?id='+obj.list[i].id+'">'+obj.list[i].id+'</a></td>';
            content+='<td>'+obj.list[i].orderType+'</td>';
            content+='<td>'+obj.list[i].createTime+'</td>';
            content+='<td>'+obj.list[i].statusName+'</td>';
            content+='<td>'+obj.list[i].total+'</td>';




           if(obj.list[i].doneNum>0){
               content+='<td onclick="openDetail(\''+obj.list[i].id+'\',\'done\')" style="cursor:hand; color:#fd7d00; text-decoration: underline ">'+obj.list[i].doneNum+'</td>';
           }else{
               content+='<td>'+obj.list[i].doneNum+'</td>';
           }

           if(obj.list[i].total > obj.list[i].doneNum){
               content+='<td onclick="openDetail(\''+obj.list[i].id+'\',\'undone\')" style="cursor:hand; color:#fd7d00; text-decoration: underline ">'+(obj.list[i].total - obj.list[i].doneNum) +'</td>';
           }else{
               content+='<td>'+(obj.list[i].total - obj.list[i].doneNum) +'</td>';
           }

            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="7">';
        content+='<ul>';
        content+='<li><a href="javascript:search(\''+obj.status+'\','+(obj.page-1)+')">Prev</a></li>';
        if(obj.page<=9){
            for(var i=1;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        if(obj.page>9){
            for(var i=obj.page-5;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.status+'\','+obj.page+')" class="nowpage">'+obj.page+'</a></li>';
        for(var i=obj.page-1+2;i<obj.page+5;i++){
            if(i<=obj.totalpage){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.status+'\','+(obj.page-1+2)+')">Next</a></li>';
        content+='<li><span >共 '+obj.totalitem+' 条 ，当前第 <strong>  '+obj.page+' </strong> / <span> <strong> '+obj.totalpage+' </strong> </span> 页 </span> </li>';
        content+='</ul>';

        content+='</td>';
        content+='</tr>';
        content+='</table>';
        return content;
    }

    function createContent2(obj){

        var content=' <table width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1"> ';

        content+='<tr class="sub_tr1">';
        content+='<th width="45%">订单编号</td>';
        content+='<th width="20%">订单类型</td>';
        content+='<th width="25%">下单时间</td>';
        content+='<th width="10%">查询条数</td>';
        content+='</tr>';


        for(var i=0;i<obj.list.length;i++){
            content+='<tr style="text-align: center">';
            content+='<td><a href="/order/detail?id='+obj.list[i].id+'">'+obj.list[i].id+'</a></td>';
            content+='<td>'+obj.list[i].orderType+'</td>';
            content+='<td>'+obj.list[i].createTime+'</td>';
            content+='<td>'+obj.list[i].total+'</td>';
            content+='</tr>';
        }


        content+='<tr class="page">';
        content+='<td colspan="4">';
        content+='<ul>';
        content+='<li><a href="javascript:search(\''+obj.status+'\','+(obj.page-1)+')">Prev</a></li>';
        if(obj.page<=9){
            for(var i=1;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        if(obj.page>9){
            for(var i=obj.page-5;i<obj.page-1;i++){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.status+'\','+obj.page+')" class="nowpage">'+obj.page+'</a></li>';
        for(var i=obj.page-1+2;i<obj.page+5;i++){
            if(i<=obj.totalpage){
                content+='<li><a href="javascript:search(\''+obj.status+'\','+i+')">'+i+'</a></li>';
            }
        }
        content+='<li><a href="javascript:search(\''+obj.status+'\','+(obj.page-1+2)+')">Next</a></li>';
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
    function openDetail(id,type){
        dialog=new Dialog("查看内容");
        dialog.SetRange(500,300);
        dialog.SetXY((window.document.body.clientWidth -500)/2,150);
        dialog.OpenWindow("/order/subsidiary?orderId="+id+"&type="+type);
    }
</script>
</body>
</html>
