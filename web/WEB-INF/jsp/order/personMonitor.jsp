<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/public.css" rel="stylesheet" type="text/css" />
    <link href="/css/sub.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css"  href="/images/dialog/dialog.css">
    <script src="/images/dialog/dialog.js" type="text/javascript"></script>

    <script language="javascript" src="/js/1.js"> </script>
    <title>人员监控</title>
    <style type="text/css">
        .deleteLine{text-align:center; width:35px;}
        .input_for_addline{background:none; border:none; border-bottom:#666666 1px solid; width:150px;}
        .select_for_addline{background:none;  width:150px; height: 20px;}
    </style>

</head>

<body>
<div style=" width: 100%; height: 700px; background-color:#eeeeee">
    <div class="yemei">
        <p>您当前所在位置：<a href="#">首页</a> >> <a href="#"> 信息监控</a> >> <span>人员监控</span></p>
    </div>
    <div class="sub_rttop">
        <a href="#" class="first" onclick="insRow()" style="float: right"><img src="../images/button3.jpg" /></a>
    </div>
    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p5">监控人员名单</p></h4>
        <div class="sub_nr">
            <table  id="gtb" width="749" border="1" cellpadding="0" cellspacing="0" bordercolor="#dadada" class="sub_table1">
                <tr class="sub_tr1">
                    <th width="22%">证件类型*</th>
                    <th width="22%">证件号*</th>
                    <th width="24%"><p>名称*</p></th>
                    <th width="22%"><p>备 注</p></th>
                    <th width="10%">操 作</th>
                </tr>
                <tr align="center">
                    <td valign="bottom">
                        <select id="certificate1"  name="certificate1" class="select_for_addline">
                            <option value="身份证">身份证</option>
                        </select>
                    </td>
                    <td valign="bottom">
                        <input type="text" id="groupcode1"  name="groupcode1" class="input_for_addline">
                    </td>
                    <td valign="bottom">
                        <input type="text" id="groupname1"  name="groupname1" class="input_for_addline">
                    </td>
                    <td valign="bottom">
                        <input type="text" id="groupremark1"  name="groupremark1"  class="input_for_addline">
                    </td>
                    <td valign="bottom" align="center"><div style="width:100%; text-align: center"> <a href="#" onclick="delrow(this)" class="deleteLine" >删除</a></div></td>
                </tr>
            </table>
            <!--p class="cxjg">本次查询条数：<span>2</span>条</p>
            <p ><a href="#">提交订单</a></p -->
            <form action="/order/submit" method="post" id="groupfrom" class="sub_form2" style="position:relative">

                <p>监控周期： </p>
                        <span class="span3"><select class="sub_input03" name="cycle">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                        </select>年</span>

                <p class="tijiao1"> <a href="#" onclick="return checkdata()">提交订单</a>   </p>
                <input type="hidden" value="${businessTypeId}" name="businessType">
                <input type="hidden" value="${orderTypeId}" name="orderType">
                <input type="hidden" id="certificate" name="certificate" value="">
                <input type="hidden" id="groupcode" name="groupCode" value="">
                <input type="hidden" id="groupname" name="groupName" value="">
                <input type="hidden" id="groupremark" name="groupRemark" value="">

            </form>

            <p>&nbsp;</p>
            <!--p class="zhushi" style="border-bottom:none;"><span>注：</span>5条以上查询，请使用批量导入功能。</p-->
        </div>
    </div>

    <div class="content_right_nr">
        <h4 class="sub_title1"><p class="sub_p2">查询介绍</p></h4>
        <div class="sub_nr">
            <ul class="cxjs">
                <li>“云”服务分为按企业进行长期跟踪监控和按人员进行长期监控。</li>
                <li>当客户指定企业中有注册信息发生变更或指定的自然人有新的投资或投资发生变化时，系统自动识别，并通知客户，供客户进行针对性的核实确认，使客户能对所有关注企业或自然人的信息状况即时把握。</li>
                <li>其信息内容涵盖监控企业和自然人的变化信息。<a href="#">查看样本</a></li>
            </ul>
        </div>
    </div>
</div>






<p></p>


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
        var z=row.insertCell(0);z.vAlign='bottom';
        var y=row.insertCell(1);y.vAlign='bottom';
        var x=row.insertCell(2);x.vAlign='bottom';
        var w=row.insertCell(3);w.vAlign='bottom';
        var v=row.insertCell(4);v.vAlign='bottom';        v.align = "center";

        z.innerHTML='<select id="certificate'+i+'"  name="certificate'+i+'"  class="select_for_addline"> <option value="身份证">身份证</option> </select>';
        y.innerHTML='<input type="text" id="groupcode'+i+'" name="groupcode'+i+'"  class="input_for_addline">';
        x.innerHTML='<input type="text" id="groupname'+i+'" name="groupname'+i+'"  class="input_for_addline">';
        w.innerHTML='<input type="text" id="groupremark'+i+'" name="groupremark'+i+'"  class="input_for_addline">';
        v.innerHTML='<div style="width:100%; text-align: center"> <a href="#" onclick="delrow(this)" class="deleteLine">删除</a></div>';

    }


    function checkdata(){

        var groupcode="";
        var groupname="";
        var groupremark="";
        var certificate="";

        for(k=1;k<i+1;k++){
            if(document.getElementById('groupcode'+k) == undefined || document.getElementById('groupcode'+k).value == ""){
            }else{
                groupcode += document.getElementById('groupcode'+k).value+",";
                groupname += document.getElementById('groupname'+k).value+",";
                groupremark += document.getElementById('groupremark'+k).value+",";
                certificate += document.getElementById('certificate'+k).value+",";
            }
        }
        if(groupcode==""){
            alert("Sorry！您没有添加任何可用数据...");return false;
        }else{
            document.getElementById('groupcode').value=	groupcode+"--";
            document.getElementById('groupname').value= groupname+"--";
            document.getElementById('groupremark').value= groupremark+"--";
            document.getElementById('certificate').value= certificate+"--";
            document.getElementById('groupfrom').submit();
        }

    }




</script>
<script type="text/javascript">
    var dialog;
    function openUpFile(){
        dialog=new Dialog("上传文件");
        dialog.SetRange(600,300);
        dialog.SetXY((window.document.body.clientWidth -600)/2,50);
        dialog.OpenWindow2(document.getElementById("upfile").innerHTML);
    }
</script>
</body>
</html>