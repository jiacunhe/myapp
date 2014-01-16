package com.hyrt.saic.controller;

import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.RechargeRecordService;
import com.hyrt.saic.service.UserPackageApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-11
 * Time: 上午9:43
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private RechargeRecordService rechargeRecordService;
    @Autowired
    private UserPackageApplyService userPackageApplyService;

    @Autowired
    private CommonService commonService;

    @RequestMapping("/rechargeRecord")
    public String searchRechargeRecord(String period,HttpServletRequest request){
          String userId="1";

          Calendar cal = Calendar.getInstance();
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMM");


          Map params = new HashMap();
          params.put("userId",userId);
          params.put("endDate",sdf.format(cal.getTime()));
          params.put("status","1");
          if(period!=null && period.equals("m")){
            cal.add(Calendar.MONTH,-1);
          }else if(period!=null && period.equals("y")){
              cal.add(Calendar.MONTH,-12);
          }else if(period!=null && period.equals("3m")){
              cal.add(Calendar.MONTH,-3);
          }else{
              cal.add(Calendar.MONTH,-1);
          }
          //购买查询
         params.put("startDate",sdf.format(cal.getTime()));
         List relist=  rechargeRecordService.getRechargeRecord(params);
         request.setAttribute("relist",relist);
         request.setAttribute("period",period);
         //包月历史查询，显示最近12个月
         cal.setTime(new Date());
         cal.add(Calendar.MONTH,-12);
         params.put("yearMonth",sdf2.format(cal.getTime()));
         List monthlyList =  userPackageApplyService.selectUsedPackage(params);
         request.setAttribute("monthlyList",monthlyList);

         //绑定私有包查询
         String sql = "SELECT MAX(packageName) packageName,MAX(price) price," +
                 "       MAX(CASE businessTypeId WHEN 1 THEN quantity ELSE 0 END) b1q ," +
                 "       MAX(CASE businessTypeId WHEN 2 THEN quantity ELSE 0 END) b2q   " +
                 "FROM(" +
                 "SELECT p.id,p.packageName,p.price,d.businessTypeId,d.quantity,d.remark " +
                 "FROM t_charge_package p,t_charge_package_detail d " +
                 "WHERE  p.id = d.packageId AND p.userId = '"+userId+"' AND p.status ='on' " +
                 ")xx GROUP BY id";
         List list = commonService.selectBySql(sql);
         if(list!=null && list.get(0)!=null){
             request.setAttribute("privatePackage",list.get(0));
         }

        //绑定包月包查询
        sql ="SELECT MAX(packageName) packageName,MAX(price) price," +
                "       MAX(CASE businessTypeId WHEN 1 THEN quantity ELSE 0 END) b1q ," +
                "       MAX(CASE businessTypeId WHEN 2 THEN quantity ELSE 0 END) b2q   " +
                "FROM(" +
                "SELECT p.id,p.packageName,p.price,d.businessTypeId,d.quantity,d.remark " +
                "FROM t_charge_package p,t_charge_package_detail d " +
                "WHERE  p.id = d.packageId AND p.id = (SELECT chargePackageId FROM t_user_charge_package WHERE userId='"+userId+"' AND STATUS ='1') " +
                ")xx GROUP BY id";

         list = commonService.selectBySql(sql);
        if(list!=null && list.get(0)!=null){
            request.setAttribute("monthlyPackage",list.get(0));
        }

         return "/bill/detail.jsp";

    }



}
