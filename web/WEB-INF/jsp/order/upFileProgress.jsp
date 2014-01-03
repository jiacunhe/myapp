<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
body {
	margin-left: 0pt;
	margin-top: 0pt;
}
-->
</style>


</head>
  
<body>
		<fieldset id="res"
			style="height: 50px; width: 100%; padding-top: 6px; padding-left: 10px;">

<div id="up" style=" float:left; width:50%; height:100%; padding-left:10px; padding-top:10px">


${message}

</div>
<div id="pro" style="float: left;  width:40%; height:100%; padding-top:10px"></div>
</fieldset>
<script  type="text/javascript">
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
  var rest;
	function progress()
	{
	
		var url='/order/progress';
		request.open("GET",url,"true");
		request.onreadystatechange=writeprogress;//隐性的循环
		request.send(null);
	}  

	function remov()
	{
		document.getElementById("pro").innerHTML =	rest+"<a href='/order/upFileResult'>查询结果</a>";
		var url='/order/progress?param=rm';
		request.open("GET",url,"true");
		request.send(null);
	}

	function writeprogress(){
		if(request.readyState==4){
			if(request.status==200){	
				rest = request.responseText;
				if(rest!=""){

					document.getElementById("pro").innerHTML =	rest;
					if(rest.search("100%")==-1)
						window.setTimeout("progress()",2000);
					else
						remov();
				}
			}
		}	
	}progress();

</script>

		
		
</body>
</html>