<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body {
	margin-left: 0pt;
	margin-top: 0pt; background-color:#ffffff; font-size:12px;
}
-->
</style>


</head>
  
<body>
<div id="res" style="width: 99%; height: 99%">

    <div style="clear: both;width: 100%; height: 50px;"></div>
<div id="up" style=" float:left; width:40%; height:30px; padding-left:10px;">


${message}

</div>
<div id="pro" style="float: right;  width:50%; height:30px; padding-top:10px"></div>
</div>
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
		document.getElementById("pro").innerHTML =	rest+"<a href='javascript:viewResult()'>生成订单</a>";
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




    function viewResult(){
        parent.window.location.href="/order/upFileResult";
    }
</script>

		
		
</body>
</html>