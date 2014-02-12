<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yang
  Date: 13-12-31
  Time: 下午5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单结果页面</title>
    <%@ include file="/WEB-INF/jsp/public/commons.jspf" %>
</head>
<body>
               <body style="background:url(${basePath}/images/bg5.jpg) repeat; font-family:'微软雅黑';">


              <!-- <div class="ddjg_wai" style=" width: 100%">
                   <div class="ddjg_top">
                       <h4>企业综合信息报告</h4>
                       <p><a href="#"><img src="../images/button7.jpg" /></a><a href="#"><img src="../images/button8.jpg" /></a></p>
                   </div>
               </div>-->
              <div class="content_right_nr">
                  <h4 class="sub_title1"><p class="sub_p9"><span class="sub_ddxx">订单详细</span> <span class="sub_button"><a href="#"><img src="${basePath}/images/button7.jpg" /></a><a href="#"><img src="${basePath}/images/button8.jpg" /></a></span></p></h4>

                  <div class="sub_nr">
               <div class="ddjg_content" style="overflow: auto; height: 560px;">
                   <h5>企业基本信息</h5>
                   <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sub_table2 sub_table3">
                       <tr>
                           <th scope="row"><p style="text-align: center">企业名称</p></th>
                           <td><span>${groupresult.groupInfo.groupName}</span></td>
                       </tr>
                       <tr>
                           <th scope="row" ><p style="text-align: center">注册号</p></th>
                           <td><span>${groupresult.groupInfo.registrationCode}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">法定代表人姓名</p></th>
                           <td><span>${groupresult.groupInfo.legalPersonName}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">注册资本(万元)</p></th>
                           <td><span>${groupresult.groupInfo.registeredCapital}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">币 种</p></th>
                           <td><span>${groupresult.groupInfo.currencyType}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">经营状态</p></th>
                           <td><span>${groupresult.groupInfo.status}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">企业(机构)类型</p></th>
                           <td><span>${groupresult.groupInfo.groupType}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">开业日期</p></th>
                           <td><span>${groupresult.groupInfo.createTime}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">经营期限 自</p></th>
                           <td><span>${groupresult.groupInfo.effectiveDate}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">经营期限 至</p></th>
                           <td><span>${groupresult.groupInfo.deadline}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">住 址</p></th>
                           <td><span>${groupresult.groupInfo.address}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">经营(业务)范围</p></th>
                           <td><span>${groupresult.groupInfo.businessScope}</span></td>
                       </tr>
                       <tr>
                           <th scope="row"><p style="text-align: center">登记机关</p></th>
                           <td><span>${groupresult.groupInfo.ra}</span></td>
                       </tr>
                   </table>

                   <h5>企业股东出资情况</h5>
                   <table width="100%" border="1" cellpadding="0" cellspacing="" class="sub_table2">
                       <tr>
                           <th scope="col">股东名称</th>
                           <th scope="col">认缴出资额（万元）</th>
                           <th scope="col">币 种</th>
                       </tr>
                       <c:forEach var="groupShareholderInfo" items="${groupresult.groupShareholderInfoList}" >
                           <tr >
                           <td style="text-align:center;">
                               ${groupShareholderInfo.shareholder}
                           </td>
                           <td>  ${groupShareholderInfo.contributionAmount}</td>
                           <td>  ${groupShareholderInfo.currencyType}</td>
                       </tr>
                       </c:forEach>

                   </table>

                   <h5>企业董监事会成员</h5>
                   <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sub_table2">
                       <tr>
                           <th scope="col">人员姓名</th>
                           <th scope="col">职 务</th>
                       </tr>
                       <c:forEach items="${groupresult.groupSeniorList}" var="groupSeniorList">
                       <tr>
                           <td>${groupSeniorList.seniorName}</td>
                           <td>${groupSeniorList.position}</td>
                       </tr>
                       </c:forEach>


                   </table>

                   <h5>企业年检情况</h5>
                   <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sub_table2">
                       <tr>
                           <th scope="col">年检年份</th>
                           <th scope="col">年检结果</th>
                       </tr>

                       <c:forEach items="${groupresult.groupAnnualInspectionList}" var="groupAnnualInspectionList">
                       <tr>
                           <td>${groupAnnualInspectionList.inspectionYear}</td>
                           <td>${groupAnnualInspectionList.inspectionResult}</td>
                       </tr>
                       </c:forEach>

                   </table>

                   <h5>最后一次变更情况</h5>
                   <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sub_table2">
                       <tr>
                           <th scope="col">变更事项</th>
                           <th scope="col">变更前内容</th>
                           <th scope="col">变更后内容</th>
                           <th scope="col">变更日期</th>
                       </tr>
                       <c:forEach items="${groupresult.groupChangingList}" var="groupChangingList">
                       <tr>
                           <td>${groupChangingList.changeItem}</td>
                           <td>&nbsp;</td>
                           <td>&nbsp;</td>
                           <td>${groupChangingList.remark}</td>
                       </tr>
                       </c:forEach>

                   </table>

                   <p class="ddjg_p1">注意：本报告仅供商业决策参考之用，不作法律依据。在 任何情况下，对由于使用本报告所造成的损失，本公司不承担任何责任.</p>
                   <div class="yangshi"></div>

               </div>
            </div>
            </div>
</body>
</html>