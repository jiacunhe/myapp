<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css"  href="${basePath}/images/dialog/dialog.css">
    <script src="${basePath}/images/dialog/dialog.js" type="text/javascript"></script>

    <title>企业查询</title>
    <style type="text/css">
        .addMonitor{float: left; width: 75px; text-align: center}
        .removeMonitor{display: none; float: left; width:75px; text-align: center; color: #0e6999}
        .deleteLine{text-align:center; width:35px; margin-left:10px; float:left;}


        .input_for_addline{background:none; border:#eee 1px solid; width:90%; height: 20px; margin-left: 1%;}
    </style>


</head>

<body>
      <div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">信息查询</a> >> <span>企业查询</span></p>
    </div>
    <div class="sub_rttop">
      <!--  <a href="#" class="first" style="float: right"><img src="../images/button1.jpg" /></a> -->
        <a href="#" onclick="insRow()" style="float: right"><img src="${basePath}/images/button3.jpg" /></a>
        <a href="#" onclick="openUpFile()" style="float: right"><img src="${basePath}/images/button2.jpg" /></a>

    </div>
    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p5">企业查询</p></h4>
        <div class="sub_nr">
            <table  id="gtb" width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1" >
                <tr class="sub_tr1">
                 <!--   <th width="64"><input type="checkbox" /></th>     -->
                    <th width="180">注册号*</th>
                    <th width="236"><p>企业名称*</p></th>
                    <th width="200"><p>备 注</p></th>
                    <th width="160">操 作</th>
                </tr>
                <tr align="center">
                  <!--  <td valign="bottom">
                        <input type="checkbox" id="checkbox1" value="1">
                    </td>   -->
                    <td>
                        <input type="text" id="groupcode1"  name="groupcode1" class="input_for_addline">
                    </td>
                    <td>
                        <input type="text" id="groupname1"  name="groupname1"  class="input_for_addline">
                    </td>
                    <td>
                        <input type="text" id="groupremark1"  name="groupremark1"  class="input_for_addline">
                    </td>
                    <td align="center"><div style="width:120px; margin: auto"><input type="hidden" id="group1monitor" name="group1monitor" value="0"><a  href="javascript:monitoradd('group1')" id="group1add" class="addMonitor">加入监控</a> <a id="group1remove" href="javascript:monitorremove('group1')" class="removeMonitor">取消监控</a>  <a href="#" onclick="delrow(this)" class="deleteLine">删除</a></div></td>
                </tr>
            </table>
            <!--p class="cxjg">本次查询条数：<span>2</span>条</p>
            <p ><a href="#">提交订单</a></p -->
            <form action="${basePath}/order/submit" method="post" id="groupfrom">
                <p class="tijiao1"> <a href="#" onclick="return checkdata()">提交订单</a>   </p>
                    <input type="hidden" value="${businessTypeId}" name="businessType">
                    <input type="hidden" value="${orderTypeId}" name="orderType">
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






<p></p>


<script type="text/javascript">

/*
* 操作表格,为表格添加行,删除行操作
*/
function delrow(obj){



	var i=document.getElementById('gtb').rows.length;
	if(i<3){
        alert("对不起！您不能再删除了..."); return false;
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
        alert("对不起！您不能再增加了...");return false;

//            dialog=new Dialog("提示");
//            dialog.SetXY(200,200);
//            dialog.OpenWindow2("<p class='msg'><span>Sorry！您不能再增加了...</span></p>");
    }
//    var i=document.getElementById('gtb').rows.length;
    var row=document.getElementById('gtb').insertRow(j);
        row.align='center';
	i++;
   // var z=row.insertCell(0);z.vAlign='bottom';
    var y=row.insertCell(0);
    var x=row.insertCell(1);
    var w=row.insertCell(2);
    var v=row.insertCell(3);v.vAlign='bottom';
	v.align = "center";
  //  z.innerHTML=' <input type="checkbox" name="checkbox'+i+'" value="'+i+'">';
    y.innerHTML='<input type="text" id="groupcode'+i+'" name="groupcode'+i+'"  class="input_for_addline">';
	x.innerHTML='<input type="text" id="groupname'+i+'" name="groupname'+i+'"  class="input_for_addline">';
	w.innerHTML='<input type="text" id="groupremark'+i+'" name="groupremark'+i+'"  class="input_for_addline">';
	v.innerHTML='<div style="width:120px; margin:auto"><input type="hidden" id="group'+i+'monitor" name="group'+i+'monitor" value="0"> <a href="javascript:monitoradd(\'group'+i+'\')" id="group'+i+'add" class="addMonitor">加入监控</a> <a id="group'+i+'remove"  href="javascript:monitorremove(\'group'+i+'\')" class="removeMonitor">取消监控</a>  <a href="#" onclick="delrow(this)" class="deleteLine">删除</a></div>';

}


function checkdata(){

	var groupcode="";
	var groupname="";
	var groupremark="";
	var groupmonitor="";
	for(k=1;k<i+1;k++){
		if(document.getElementById('groupcode'+k) == undefined || document.getElementById('groupcode'+k).value == "" || document.getElementById('groupname'+k).value == undefined || document.getElementById('groupname'+k).value == ""){

        }else{
            if(groupcode.indexOf(document.getElementById('groupcode'+k).value)>=0){
                alert("对不起！您添加数据有问题请检查...");return false;
                break;
            }
		  groupcode += document.getElementById('groupcode'+k).value+",";
		  groupname += document.getElementById('groupname'+k).value+",";
		  groupremark += document.getElementById('groupremark'+k).value+",";
		  groupmonitor += document.getElementById('group'+k+"monitor").value+",";
		}
	}

	if(groupcode==""){
		 alert("对不起！您没有添加任何可用数据...");return false;
	}else{
//		document.getElementById('groupcode').value=	groupcode.length>0?groupcode.substring(0,groupcode.length-1):"";
//		document.getElementById('groupname').value= groupname.length>0?groupname.substring(0,groupname.length-1):"";
//		document.getElementById('groupremark').value= groupremark.length>0?groupremark.substring(0,groupremark.length-1):"";
//		document.getElementById('groupmonitor').value= groupmonitor.length>0?groupmonitor.substring(0,groupmonitor.length-1):"";

        document.getElementById('groupcode').value=	groupcode+"--";
        document.getElementById('groupname').value= groupname+"--";
        document.getElementById('groupremark').value= groupremark+"--";
        document.getElementById('groupmonitor').value= groupmonitor+"--";
	/*	
		alert(document.getElementById('groupcode').value);
		alert(document.getElementById('groupname').value);
		alert(document.getElementById('groupremark').value);
		alert(document.getElementById('groupmonitor').value);*/
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

 
 
</script>
<script type="text/javascript">
var dialog;
function openUpFile(){
	dialog=new Dialog("上传文件");
	dialog.SetRange(500,200);
	dialog.SetXY((window.document.body.clientWidth -500)/2,150);
	dialog.OpenWindow("${basePath}/order/upFile?type=1");
}
</script>
</body>
</html>