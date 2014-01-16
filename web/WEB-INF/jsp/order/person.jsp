<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
    <meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <meta HTTP-EQUIV="expires" CONTENT="0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css"  href="/images/dialog/dialog.css">
    <script src="/images/dialog/dialog.js" type="text/javascript"></script>

    <title>人员查询</title>
    <style type="text/css">
        .addMonitor{float: left; width: 70px; text-align: center}
        .removeMonitor{display: none; float: left; width:70px; text-align: center; color: #0e6999}
        .deleteLine{text-align:center; width:35px; margin-left:5px; float:left;}
        .input_for_addline{background:none; border:#eee 1px solid; width:90%; height: 20px; margin-left: 1%;}
        .select_for_addline{background:none; border:#eee 1px solid; width:90%; height: 20px; margin-left: 1%;}
    </style>

</head>

<body>
<div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">信息查询</a> >> <span>人员查询</span></p>
    </div>
    <div class="sub_rttop">
     <!--   <a href="#" class="first" style="float: right"><img src="../images/button1.jpg" /></a>   -->

        <a href="#" onclick="insRow()" style="float: right"><img src="../images/button3.jpg" /></a>
        <a href="#" onclick="openUpFile()" style="float: right"><img src="../images/button2.jpg" /></a>

    </div>
    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p5">人员查询</p></h4>
        <div class="sub_nr">
            <table  id="gtb" width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
                <tr class="sub_tr1">
                   <!-- <th width="8%"><input type="checkbox" /></th>    -->
                    <th width="19%">证件类型*</th>
                    <th width="19%">证件号*</th>
                    <th width="20%"><p>名称*</p></th>
                    <th width="19%"><p>备 注</p></th>
                    <th width="15%">操 作</th>
                </tr>
                <tr align="center">
                 <!--   <td  valign="bottom">
                        <input type="checkbox" id="checkbox1" value="1">
                    </td>     -->

                    <td>
                        <select id="certificate1"  name="certificate1" class="select_for_addline">
                            <option value="身份证">身份证</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" id="groupcode1"  name="groupcode1" class="input_for_addline">
                    </td>
                    <td>
                        <input type="text" id="groupname1"  name="groupname1" class="input_for_addline">
                    </td>
                    <td>
                        <input type="text" id="groupremark1"  name="groupremark1" class="input_for_addline">
                    </td>
                    <td valign="bottom" align="center"><div style="width:120px; margin: auto"><input type="hidden" id="group1monitor" name="group1monitor" value="0"><a  href="javascript:monitoradd('group1')" id="group1add" class="addMonitor">加入监控</a> <a id="group1remove" href="javascript:monitorremove('group1')" class="removeMonitor">取消监控</a>  <a href="#" onclick="delrow(this)" class="deleteLine">删除</a></div></td>
                </tr>
            </table>
            <!--p class="cxjg">本次查询条数：<span>2</span>条</p>
            <p ><a href="#">提交订单</a></p -->
            <form action="/order/submit" method="post" id="groupfrom">
                <p class="tijiao1"> <a href="#" onclick="return checkdata()">提交订单</a>   </p>
                <input type="hidden" value="${businessTypeId}" name="businessType">
                <input type="hidden" value="${orderTypeId}" name="orderType">
                <input type="hidden" id="certificate" name="certificate" value="">
                <input type="hidden" id="groupcode" name="groupCode" value="">
                <input type="hidden" id="groupname" name="groupName" value="">
                <input type="hidden" id="groupremark" name="groupRemark" value="">
                <input type="hidden" id="groupmonitor" name="groupMonitor" value="">

            </form>


            <p class="zhushi" style="border-bottom:none;"><span>注：</span>5条以上查询，请使用批量导入功能。</p>
        </div>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p2">查询介绍</p></h4>
        <div class="sub_nr">
            <ul class="cxjs">
                <li>提供使用企业登记名称或营业执照号码进行查询企业相关信息。</li>
                <li>其信息内容涵盖营业执照信息、股东及出资信息、主要人员任职信息、年检信息、企业变更信息等。<a href="#">查看样本</a></li>
            </ul>
        </div>
    </div>
</div>



 <!--
<div id="upfile" style="display:none;">

    <fieldset id="upview" style="width: 95%;height:90%; padding-top: 6px;padding-left: 10px; background-color:#FFFFFF">
        <div style="width:100%;height:100%; background-color:#FFFFFF">
            <form action="/order/upFile" method="post" enctype="multipart/form-data">
                <input type="hidden" value="1" name="businessType">
                <input type="file" name="file">
                <input type="submit" value="上传"  onclick="showResview()">
            </form>
        </div>
    </fieldset>

    <fieldset id="resview" style="width: 95%;height:90%; padding-top: 6px; display: none;padding-left: 10px; background-color:#FFFFFF">

        <div id="up" style="float: left;width:60%; height:100%; padding-top:10px ">


            上传进度：

        </div>
        <div id="pro" style="float: left; width: 30%; height:90%;  padding-top:10px"></div>

    </fieldset>

</div>

<script type="text/javascript">
    /*
     上传进度处理
     */
    function showResview() {
        document.getElementById("upview").style.display = 'none';
        document.getElementById("resview").style.display = 'block';
        progress();
    }

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
    function progress() {

        var url = '/order/progress';
        request.open("GET", url, "true");
        request.onreadystatechange = writeprogress;//隐性的循环
        request.send(null);
    }

    function writeprogress() {
        if (request.readyState == 4) {
            if (request.status == 200) {
                var rest = request.responseText;
                if (rest != "") {
                    document.getElementById("pro").innerHTML = rest;
                    if (rest != "100%")
                        window.setTimeout("progress()", 2000);
                    //endloop();
                }
            }
        }
    }
</script>     -->
<script type="text/javascript">

    /*
     操作表格,为表格添加行,删除行操作
     */
    function delrow(obj){



        var i=document.getElementById('gtb').rows.length;
        if(i<3){
            alert("Sorry！您不能再删除了..."); return false;
        }

        var j=((obj.parentNode).parentNode).parentNode.rowIndex;

        document.getElementById('gtb').deleteRow(j);

    }

    i=3;
    function insRow()
    {

        var j=document.getElementById('gtb').rows.length;
        //alert(i);
        if(j>5){
            alert("Sorry！您不能再增加了...");return false;

//            dialog=new Dialog("提示");
//            dialog.SetXY(200,200);
//            dialog.OpenWindow2("<p class='msg'><span>Sorry！您不能再增加了...</span></p>");
        }
//    var i=document.getElementById('gtb').rows.length;
        var row=document.getElementById('gtb').insertRow(j);
        row.align='center';
        i++;
     //   var z=row.insertCell(0);z.vAlign='bottom';
        var y=row.insertCell(0);
        var x=row.insertCell(1);
        var w=row.insertCell(2);
        var v=row.insertCell(3);
        var u=row.insertCell(4);u.vAlign='bottom';
        u.align = "center";
      //  z.innerHTML=' <input type="checkbox" name="checkbox'+i+'" value="'+i+'">';
        y.innerHTML='<select id="certificate'+i+'"  name="certificate'+i+'" class="select_for_addline"> <option value="身份证">身份证</option> </select>';
        x.innerHTML='<input type="text" id="groupcode'+i+'" name="groupcode'+i+'" class="input_for_addline">';
        w.innerHTML='<input type="text" id="groupname'+i+'" name="groupname'+i+'" class="input_for_addline">';
        v.innerHTML='<input type="text" id="groupremark'+i+'" name="groupremark'+i+'" class="input_for_addline">';
        u.innerHTML='<div style="width:120px; margin:auto"><input type="hidden" id="group'+i+'monitor" name="group'+i+'monitor" value="0"> <a href="javascript:monitoradd(\'group'+i+'\')" id="group'+i+'add" class="addMonitor">加入监控</a> <a id="group'+i+'remove"  href="javascript:monitorremove(\'group'+i+'\')" class="removeMonitor">取消监控</a>  <a href="#" onclick="delrow(this)" class="deleteLine">删除</a></div>';

    }


    function checkdata(){

        var groupcode="";
        var groupname="";
        var groupremark="";
        var groupmonitor="";
        var certificate="";
        for(k=1;k<i+1;k++){
            if(document.getElementById('groupcode'+k) == undefined || document.getElementById('groupcode'+k).value == ""){
            }else{
                groupcode += document.getElementById('groupcode'+k).value+",";
                groupname += document.getElementById('groupname'+k).value+",";
                groupremark += document.getElementById('groupremark'+k).value+",";
                certificate += document.getElementById('certificate'+k).value+",";
                groupmonitor += document.getElementById('group'+k+"monitor").value+",";
            }
        }
        if(groupcode==""){
            alert("Sorry！您没有添加任何可用数据...");return false;
        }else{
            document.getElementById('groupcode').value=	groupcode+"--";
            document.getElementById('groupname').value= groupname+"--";
            document.getElementById('groupremark').value= groupremark+"--";
            document.getElementById('groupmonitor').value= groupmonitor+"--";
            document.getElementById('certificate').value= certificate+"--";
            document.getElementById('groupfrom').submit();
        }

    }

    function monitoradd(id){
        document.getElementById(id+'remove').style.display='block';
        document.getElementById(id+'add').style.display='none';
        document.getElementById(id+'monitor').value=1;
    }
    function monitorremove(id){
        document.getElementById(id+'remove').style.display='none';
        document.getElementById(id+'add').style.display='block';
        document.getElementById(id+'monitor').value=0;
    }
    /*	 var tdObj;
     try{
     tdObj = event.srcElement;
     }catch (e){

     try{
     tdObj = event.target;
     }catch (e) {
     alert("您的浏览器不支持！");
     }

     }



     var trObj,tableObj;

     while(tdObj.tagName != 'td'){
     tdObj = tdObj.parentNode;
     }
     trObj = tdObj.parentNode;
     tableObj = trObj.parentNode;

     var rowIndex = trObj.rowIndex;
     tableObj.deleteRow(rowIndex);
     */


</script>
<script type="text/javascript">
    var dialog;
    function openUpFile(){
        dialog=new Dialog("上传文件");
        dialog.SetRange(500,200);
        dialog.SetXY((window.document.body.clientWidth -500)/2,150);
        dialog.OpenWindow("/order/upFile?type=2");
    }
</script>
</body>
</html>