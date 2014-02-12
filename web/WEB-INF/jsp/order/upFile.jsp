<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            background-color: #FFFFFF;       font-size: 12px;;
        }
        -->
    </style>
    <title>上传文件</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>

<div id="upfile">

    <div id="upview" style="width: 95%; height:200px;  padding-top: 46px;padding-left: 20px;">
        <div style="width:100%;height:100%; background-color:#FFFFFF">
            <form action="${basePath}/order/upload" method="post" enctype="multipart/form-data">
                <input type="file" name="file" style="width:260px; height:24px">
                <input type="submit" value="上传"  onclick="showResview()" style=" border: none; background-color:#0f9bc6; height: 24px; width: 40px;">
            </form>
            <p><a href="${basePath}/order/download?file=model.xls">下载模版</a></p>
        </div>
    </div>

    <div id="resview" style="width: 95%; height:200px; padding-top: 46px; display: none; padding-left: 20px;">

        <div id="up" style="float: left;width:60%; height:100%; padding-top:10px ">


            上传进度：

        </div>
        <div id="pro" style="float: left; width: 30%; height:90%;  padding-top:10px"></div>

    </div>

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

        var url = '${basePath}/order/progress';
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
</body>
</html>