<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" media="all"  href="/images/dialog/dialog.css">

    <script src="/images/dialog/dialog.js" type="text/javascript"></script>
    <script language=javascript src="/js/1.js" id=clientEventHandlersJS> </script>
    <title>企业查询</title>


</head>

<body>

<div class="content_right">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#">信息查询</a> >> <span>企业查询</span></p>
    </div>
    <div class="sub_rttop">
        <a href="#" class="first"><img src="../images/button1.jpg" /></a>
        <a href="javascript:openUpFile()"><img src="../images/button2.jpg" /></a>
        <a href="javascript:insRow()"><img src="../images/button3.jpg" /></a>
    </div>
    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p5">企业查询</p></h4>
        <div class="sub_nr">
            <table  id="gtb" width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
                <tr class="sub_tr1">
                    <th width="64"><input type="checkbox" /></th>
                    <th width="180">注册号*</th>
                    <th width="236"><p>企业名称*</p></th>
                    <th width="200"><p>备 注</p></th>
                    <th width="160">操 作</th>
                </tr>
                <tr align="center">
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
                    <td align="center"><div style="width:120px; margin: auto"><input type="hidden" id="group1monitor" name="group1monitor" value="0"><a  href="javascript:monitoradd('group1')" id="group1add" style="float: left; width: 75px; text-align: center">加入监控</a> <a id="group1remove" href="javascript:monitorremove('group1')" style="display: none; float: left; width:75px; text-align: center">取消监控</a>  <a href="#" onclick="delrow(this)" style="float: left; width: 35px; text-align: center; margin-left: 10px;">删除</a></div></td>
                </tr>
            </table>
            <p class="cxjg">本次查询条数：<span>2</span>条</p>
            <p ><a href="#">提交订单</a></p>
            <form action="/order/groupSubmit" method="post" id="groupfrom">
                <p class="tijiao1"> <a href="javascript; checkdata()">提交订单</a>   </p>
                    <input type="hidden" value="1" name="businessType">

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
    }
//    var i=document.getElementById('gtb').rows.length;
    var row=document.getElementById('gtb').insertRow(j);
        row.align='center';
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
	v.innerHTML='<div style="width:120px; margin:auto"><input type="hidden" id="group'+i+'monitor" name="group'+i+'monitor" value="0"> <a href="javascript:monitoradd(\'group'+i+'\')" id="group'+i+'add" style="float:left; width: 75px; text-align: center">加入监控</a> <a style="display:none; float:left;width:75px; text-align: center" id="group'+i+'remove"  href="javascript:monitorremove(\'group'+i+'\')">取消监控</a>  <a href="#" onclick="delrow(this)" style=" text-align:center; width:35px; margin-left:10px; float:left;">删除</a></div>';

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
	dialog.SetRange(600,300);
	dialog.SetXY((window.document.body.clientWidth -600)/2,50);
	//dialog.OpenWindow("http://www.baidu.com");
	
	dialog.OpenWindow2(document.getElementById("upfile").innerHTML);
}
</script>
</body>
</html>