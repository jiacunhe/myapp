<%--
  Created by IntelliJ IDEA.
  User: yang
  Date: 13-12-27
  Time: 上午9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
		String sn = java.util.UUID.randomUUID().toString();
		org.apache.commons.fileupload.ObjectPool pool = org.apache.commons.fileupload.ObjectPool.getPool();
		pool.p.put(sn, new org.apache.commons.fileupload.UpfileProgress());
        request.getSession().setAttribute("fileSerialNumber", sn);
%>
<html>
<head>
    <title>xxxxxxxxx</title>
	<script src="/images/dialog/dialog.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="all"  href="/images/dialog/dialog.css">
</head>
<body>


<input type="button"  value="批量上传" onClick="openUpFile()" align="middle">
<p></p>

<input type="button" value="增加一行" onClick="insRow()">

<table id="gtb" width="741" border="1" cellpadding="0" cellspacing="0" style="font-size:12px">
  <tr>
    <td width="21">&nbsp;</td>
    <td width="151">注册号*</td>
    <td width="151">企业名称</td>
    <td width="151">备注</td>
    <td width="245" align="center">操作</td>
    </tr>
  <tr>
    <td>
      <input type="checkbox" id="checkbox1" value="1">
    </td>
    <td><label>
      <input type="text" id="groupcode1"  name="groupcode1" style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">
    </label></td>
    <td><label>
      <input type="text" id="groupname1"  name="groupname1" style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">
    </label></td>
    <td><label>
      <input type="text" id="groupremark1"  name="groupremark1"  style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">
    </label></td>
    <td align="center"><div style="width:150px; margin:auto"><input type="hidden" id="group1monitor" name="group1monitor" value="0"><input type="button" value="加入监控" onClick="monitoradd('group1')" id="group1add" style="width:80px; background:#999999; border:none; color:#FFFFFF; float:left;"> <input type="button" style="display:none;width:80px; background:#999999; border:none; float:left; color:#FF0000" value="取消监控" id="group1remove"  onClick="monitorremove('group1')">  <input type="button" onClick="delrow(this)" style="color:red; margin-left:10px; width:40px; border:none; background:#CCCCCC; float:left;" value="删除"></div></td>
    </tr>

</table>
<form action="/order/group" method="post">
<p>

<input type="submit" value="提交" onClick=" return checkdata()">
<input type="hidden" value="1" name="businessType">

<input type="hidden" id="groupcode" name="groupCode" value="">
<input type="hidden" id="groupname" name="groupName" value="">
<input type="hidden" id="groupremark" name="groupRemark" value="">
<input type="hidden" id="groupmonitor" name="groupMonitor" value="">
</p>
</form>



<p></p>


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

		var url = '/group/progress';
		request.open("GET", url, "true");
		request.onreadystatechange = writeprogress;//隐性的循环
		request.send(null);
	}

	function writeprogress() {
		if (request.readyState == 4) {
			if (request.status == 200) {
				var rest = request.responseText;
				if (rest != "") {
					document.getElementById("pro").innerText = rest;
					if (rest != "100%")
						window.setTimeout("progress()", 2000);
					//endloop();
				}
			}
		}
	} 
</script>
<script type="text/javascript">

/*
操作表格,为表格添加行,删除行操作
*/
function delrow(obj){



	var i=document.getElementById('gtb').rows.length;
	if(i<3){
        alert("Sorry！您不能再删除了...");return false;
    }
    
	var j=obj.parentNode.parentNode.parentNode.rowIndex;
  
    document.getElementById('gtb').deleteRow(j);

}

i=3;
function insRow()
{

	var j=document.getElementById('gtb').rows.length;
	//alert(i);
	if(j>5){
        alert("Sorry！您不能再增加了...");return false;
    }
//    var i=document.getElementById('gtb').rows.length;
    var row=document.getElementById('gtb').insertRow(j);
	i++;
    var z=row.insertCell(0);
    var y=row.insertCell(1);
    var x=row.insertCell(2);
    var w=row.insertCell(3);
    var v=row.insertCell(4);
	v.align = "center";
    z.innerHTML=' <input type="checkbox" name="checkbox'+i+'" value="'+i+'">';
    y.innerHTML='<input type="text" id="groupcode'+i+'" name="groupcode'+i+'" style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">';
	x.innerHTML='<input type="text" id="groupname'+i+'" name="groupname'+i+'"  style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">';
	w.innerHTML='<input type="text" id="groupremark'+i+'" name="groupremark'+i+'"  style="background:none; border:none; border-bottom:#666666 1px solid; width:150px;">';
	v.innerHTML='<div style="width:150px; margin:auto"><input type="hidden" id="group'+i+'monitor" name="group'+i+'monitor" value="0"> <input type="button" value="加入监控" onClick="monitoradd(\'group'+i+'\')" id="group'+i+'add" style="width:80px; float:left; background:#999999; border:none; color:#FFFFFF"> <input type="button" style="display:none;width:80px; background:#999999; border:none;float:left; color:#FF0000" value="取消监控" id="group'+i+'remove"  onClick="monitorremove(\'group'+i+'\')">  <input type="button" onClick="delrow(this)" style="color:red;width:40px; margin-left:10px; border:none; background:#CCCCCC;float:left;" value="删除"></div>';

}


function checkdata(){

	var groupcode="";
	var groupname="";
	var groupremark="";
	var groupmonitor="";
	for(k=1;k<i+1;k++){
		if(document.getElementById('groupcode'+k) == undefined || document.getElementById('groupcode'+k).value == ""){
		}else{
		  groupcode += document.getElementById('groupcode'+k).value+",";
		  groupname += document.getElementById('groupname'+k).value+",";
		  groupremark += document.getElementById('groupremark'+k).value+",";
		  groupmonitor += document.getElementById('group'+k+"monitor").value+",";
		}
	}
	if(groupcode==""){
		 alert("Sorry！您没有添加任何可用数据...");return false;
	}else{
		document.getElementById('groupcode').value=	groupcode.length>0?groupcode.substring(0,groupcode.length-1):"";
		document.getElementById('groupname').value= groupname.length>0?groupname.substring(0,groupname.length-1):"";
		document.getElementById('groupremark').value= groupremark.length>0?groupremark.substring(0,groupremark.length-1):"";
		document.getElementById('groupmonitor').value= groupmonitor.length>0?groupmonitor.substring(0,groupmonitor.length-1):"";
	/*	
		alert(document.getElementById('groupcode').value);
		alert(document.getElementById('groupname').value);
		alert(document.getElementById('groupremark').value);
		alert(document.getElementById('groupmonitor').value);*/
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
	dialog.SetRange(600,300);
	dialog.SetXY((window.document.body.clientWidth -600)/2,50);
	//dialog.OpenWindow("http://www.baidu.com");
	
	dialog.OpenWindow2(document.getElementById("upfile").innerHTML);
}
</script>
</body>
</html>