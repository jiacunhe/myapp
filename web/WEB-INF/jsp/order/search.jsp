<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
    <style>
     
        .nav{background-color:#ff359a;width:565px;height:21px; float:left}
        .nav a{text-decoration:none;float:left;text-align:center;width:140px;height:20px;
            color:#000;margin-top:1px;margin-left:1px;background-color:white;border-bottom:1px solid #ff359a}
        .content{border:1px solid #ff359a;border-top:0;width:100%;height:300px;padding:1px; margin-top:5px; float:left}
		td{ border: 1px #FFCC66 solid}
    </style>
    <script type="text/javascript" language="javascript"   src="/js/calendar.js/calendar.js"></script>
</head>
<body>
<div style="width: 100%; height: 40px;">

    <form action="/order/search" method="post">
        type:<select name="type">
        <option value="">全部</option>
        <c:forEach  var="obj" items="${orderTypeList}"   varStatus="status">
            <option value="${obj.id}">${obj.orderName}</option>
        </c:forEach>
        </select>
        date:<input type="text" name="sday" id="sday" onFocus="ShowCalendar(this.id)"> - <input type="text" id="eday" name="eday"onfocus="ShowCalendar(this.id)">
        id:<input type="text" name="id">
        <input type="submit" value="Search">
        <input type="hidden" name="submit" value="1">
    </form>

</div>


<div>
    <div class="nav" id="nav" onClick="tabCard(); return false;">
        <a href="#" style="border-bottom: none">全部订单</a>
        <a href="#">已完成订单</a>
        <a href="#">未完成订单</a>
        <a href="#">未查到订单</a>
    </div>
    <div class="content" id="content">

	</div>
</div>
<!------------------------------------------all       --------------------------------------------- -->
<div class="content" id="content1" style="display:none">

    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; border: 1px #FFCC66 solid ">
        <tr height="25px;">
            <td rowspan="2">订单编号</td>
            <td rowspan="2">订单类型</td>
            <td rowspan="2">下单时间</td>
            <td rowspan="2">订单状态</td>
            <td height="26" colspan="3" align="center">查询条数（条）</td>
        </tr>
        <tr>
            <td>查询总条数</td>
            <td>已查到条数</td>
            <td>未查到条数</td>
        </tr>

        <c:forEach  var="obj" items="${all.list}"   varStatus="status">
            <tr>
                <td><a href="/order/detail?id=${obj.id}">${obj.id}</a></td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.status}</td>
                <td>${obj.total}</td>
                <td>${obj.doneNum}</td>
                <td>${obj.total - obj.doneNum }</td>
            </tr>

        </c:forEach>


        <tr>
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


                    <li><a href="javascript:search('all',${all.page})" style="color:#FF0000">${all.page}</a></li>


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


</div>


  <!--------------------------------------------done--------------------------------------------------- -->

<div class="content" id="content2" style="display:none">

    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; border: 1px #FFCC66 solid ">
        <tr height="25px;">
            <td rowspan="2">订单编号</td>
            <td rowspan="2">订单类型</td>
            <td rowspan="2">下单时间</td>
            <td height="26" colspan="3" align="center">查询条数（条）</td>
        </tr>
        <tr>
            <td>查询总条数</td>
            <td>已查到条数</td>
            <td>未查到条数</td>
        </tr>

        <c:forEach  var="obj" items="${done.list}"   varStatus="status">
            <tr>
                <td>${obj.id}</td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.total}</td>
                <td>${obj.doneNum}</td>
                <td>${obj.total - obj.doneNum }</td>
            </tr>

        </c:forEach>


        <tr>
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


                    <li><a href="javascript:search('done',${done.page})" style="color:#FF0000">${done.page}</a></li>


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


</div>

<!-----------------------------------------------------undone --------------------------------- -->
<div class="content" id="content3" style="display:none">

    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; border: 1px #FFCC66 solid ">
        <tr height="25px;">
            <td>订单编号</td>
            <td>订单类型</td>
            <td>下单时间</td>
            <td height="26" align="center">查询条数（条）</td>
        </tr>


        <c:forEach  var="obj" items="${undone.list}"   varStatus="status">
            <tr>
                <td>${obj.id}</td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.total}</td>
            </tr>

        </c:forEach>


        <tr>
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


                    <li><a href="javascript:search('undone',${undone.page})" style="color:#FF0000">${undone.page}</a></li>


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


</div>



<!-----------------------------------------nothing------------------------------------ -->
<div class="content" id="content4" style="display:none">


    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; border: 1px #FFCC66 solid ">
        <tr height="25px;">
            <td>订单编号</td>
            <td>订单类型</td>
            <td>下单时间</td>
            <td height="26" align="center">查询条数（条）</td>
        </tr>


        <c:forEach  var="obj" items="${nothing.list}"   varStatus="status">
            <tr>
                <td>${obj.id}</td>
                <td>${obj.orderType}</td>
                <td>${obj.createTime}</td>
                <td>${obj.total}</td>
            </tr>

        </c:forEach>


        <tr>
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


                    <li><a href="javascript:search('nothing',${nothing.page})" style="color:#FF0000">${nothing.page}</a></li>


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



</div>



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

        for(i=0;i<document.getElementById("nav").childNodes.length;i++)
        {
            if(document.getElementById("nav").childNodes.item(i).nodeName=="A"){
                document.getElementById("nav").childNodes.item(i).style.borderBottom = "1px solid #ff359a";
            }

        }
        e.style.borderBottom = 'none';
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


    var statuscode;
    function search(status,page){
        statuscode = status;
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
                    // alert(rest);
                    var jsonObj=eval('('+rest+')');
                    if(statuscode=="all"){
                        document.getElementById("content1").innerHTML = createContent(jsonObj);
                        document.getElementById("content").innerHTML = document.getElementById("content1").innerHTML;
                    }
                }
            }
        }
    }

    function createContent(obj){

        var content='<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; border: 1px #FFCC66 solid "> ';
        content+='<tr height="25px;">';
        content+='<td rowspan="2">订单编号</td>';
        content+='<td rowspan="2">订单类型</td>';
        content+='<td rowspan="2">下单时间</td>';
        content+='<td rowspan="2">订单状态</td>';
        content+='<td height="26" colspan="3" align="center">查询条数（条）</td>';
        content+='</tr>';
        content+='<tr>';
        content+='<td>查询总条数</td>';
        content+='<td>已查到条数</td>';
        content+='<td>未查到条数</td>';
        content+='</tr>';

               for(var i=0;i<obj.list.length;i++){
                content+='<tr>';
                content+='<td>'+obj.list[i].id+'</td>';
                content+='<td>'+obj.list[i].orderType+'</td>';
                content+='<td>'+obj.list[i].createTime+'</td>';
                content+='<td>'+obj.list[i].status+'</td>';
                content+='<td>'+obj.list[i].total+'</td>';
                content+='<td>'+obj.list[i].doneNum+'</td>';
                content+='<td>'+(obj.list[i].total - obj.list[i].doneNum) +'</td>';
                content+='</tr>';
				}


        content+='<tr>';
        content+='<td colspan="7">';
               content+='<ul>';

                content+='<li><a href="javascript:search(\''+statuscode+'\','+(obj.page-1)+')">Prev</a></li>';


				if(obj.page<=9){
					for(var i=1;i<obj.page-1;i++){
						content+='<li><a href="javascript:search(\''+statuscode+'\','+i+')">'+i+'</a></li>';
					}
				}

				if(obj.page>9){
					for(var i=obj.page-5;i<obj.page-1;i++){
						content+='<li><a href="javascript:search(\''+statuscode+'\','+i+')">'+i+'</a></li>';
					}
				}



                content+='<li><a href="javascript:search(\''+statuscode+'\','+obj.page+')" style="color:#FF0000">'+obj.page+'</a></li>';

				for(var i=obj.page-1+2;i<obj.page+5;i++){
					if(i<=obj.totalpage){
						content+='<li><a href="javascript:search(\''+statuscode+'\','+i+')">'+i+'</a></li>';
					}
					
				}
   

                content+='<li><a href="javascript:search(\''+statuscode+'\','+(obj.page-1+2)+')">Next</a></li>';
                content+='<li><span >共 '+obj.totalitem+' 条 ，当前第 <strong>  '+obj.page+' </strong> / <span> <strong> '+obj.totalpage+' </strong> </span> 页 </span> </li>';
                content+='</ul>';

                content+='</td>';
                content+='</tr>';
        content+='</table>';
        return content;
    }


</script>
</body>
</html>