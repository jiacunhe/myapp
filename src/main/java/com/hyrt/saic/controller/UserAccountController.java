package com.hyrt.saic.controller;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserAssignPackage;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.dao.RechargeRecordMapper;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.RechargeRecordService;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.service.UserPackageApplyService;
import com.hyrt.saic.util.enums.DataOperateType;
import me.sfce.library.mybatis.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-13
 * Time: 下午2:53
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("/userAccount")
public class UserAccountController {

    @Autowired
    private CommonService commonService;
    @Autowired
    private UserPackageApplyService userPackageApplyService;

    @Autowired
    private RechargeRecordService rechargeRecordService;

    @Autowired
    private UserOperationService operationService;

    @RequestMapping("/search")
    public String search(Integer page,String userId,String userName,HttpServletRequest request){

      // if(page !=null){
           String sql="SELECT userId,MAX(userName) userName, " +
                   "SUM(CASE businessId WHEN 1 THEN remainder ELSE 0 END) b1r, " +
                   "SUM(CASE businessId WHEN 2 THEN remainder ELSE 0 END) b2r " +
                   "FROM(" +
                   " SELECT a.userId,u.username,a.businessId,a.remainder " +
                   " FROM t_account_info a,t_user u " +
                   " WHERE u.userId =a.userId  ";
           if(userId!=null && !"".equals(userId)){
               sql+=" and a.userId like '%"+userId+"%'";
           }
           if(userName!=null && !"".equals(userName)){
               sql+=" and u.userName like'%"+userName+"%'";
           }

           sql += ")xx " +
                   " GROUP BY userId  ";

           Map resmap = commonService.selectBySql(sql,page,5);
           request.setAttribute("resmap",resmap);
           request.setAttribute("_userId",userId);
           request.setAttribute("_userName",userName);
      // }
        if(page == null){
                        this.searchMonthly(null,null,null,null,request);
        }
        User user =(User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/userAccount/search", "查看用户账户信息 userId="+userId+";userName="+userName, new Date(), request.getRemoteAddr());
        operationService.save(operation);
        return "/userAccount/search.jsp";

    }


    @RequestMapping("/searchMonthly")
    public String searchMonthly(Integer page,String userId,String userName,String yearMonth,HttpServletRequest request){

//        User user =(User) request.getSession().getAttribute("manage");
//        String assignorId=user.getUserId();
     //   if(page !=null){
            int pageSize=5;
            Map params = new HashMap();
//            if(!"".equals(assignorId)) params.put("assignorId",assignorId);

            if(!"".equals(userId)) params.put("userId",userId);
            if(!"".equals(userName)) params.put("userName",userName);
            if(!"".equals(yearMonth)) params.put("yearMonth",yearMonth);


            if (page == null) page = 1;
            int countItem = userPackageApplyService.selectiveCount(params);

            int totalPage = (countItem + pageSize - 1) / pageSize;
            if (page > totalPage) page = totalPage;
            if (page < 1) page = 1;

            params.put("cursor",(page - 1) * pageSize);
            params.put("length",pageSize);
            List monthlyList =  userPackageApplyService.selectUsedPackageByPage(params);
            request.setAttribute("userId",userId);
            request.setAttribute("userName",userName);
            request.setAttribute("yearMonth",yearMonth);
            request.setAttribute("monthlyList",monthlyList);
            request.setAttribute("page",page);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("countItem",countItem);
   //     }
        User user =(User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/userAccount/searchMonthly", "查看用户包月信息 userId="+userId+";userName="+userName+";yearMonth="+yearMonth, new Date(), request.getRemoteAddr());
        operationService.save(operation);
        return "/userAccount/search.jsp";

    }

    @RequestMapping("/allotPackage")
    public String allotPackage(String submitttt,String receiver,String effectiveType,Integer quantity,Integer month,HttpServletRequest request){

        User user =(User) request.getSession().getAttribute("manage");
        String userId=user.getUserId();

        Map params = new HashMap();

        params.put("userId",userId);
        params.put("yearMonth", new SimpleDateFormat("yyyyMM").format(new Date()));
        params.put("cursor",0);
        params.put("length",1);
        List myPackageList = userPackageApplyService.selectUsedPackage(params);

        if(myPackageList!=null&&myPackageList.size()>0){
            Map mypackmap = (Map) myPackageList.get(0);
            Long all = (Long)mypackmap.get("b1q");
            Long used = (Long)mypackmap.get("b1uq");
            request.setAttribute("availableNum",(all-used));



             //创建分配操作
            if(receiver!=null && !"".equals(receiver)&&effectiveType!=null && !"".equals(effectiveType)&&quantity!=null&& quantity<=(all-used) &&month!=null){

                UserAssignPackage uap = new UserAssignPackage();
                uap.setAssignorId(userId);
                uap.setUserId(receiver);
                uap.setBusinessId(1);
                uap.setCreateTime(new Timestamp(new Date().getTime()));
                uap.setEffectiveType(effectiveType);
                uap.setQuantity(quantity);
                uap.setDurationMonths(month);
                uap.setStatus("1");


                userPackageApplyService.allotPackage(uap,userId);
/*                List beans = new ArrayList();
                beans.add(uap);
                Map map = new HashMap();
                map.put(DataOperateType.INSERT,beans);
                try {
                    commonService.saveOrUpdateOrDeleteAll(map);
                } catch (Exception e) {
                    e.printStackTrace();
                }*/
                request.setAttribute("message","分配成功");
                request.setAttribute("availableNum",(all-used-quantity));


                UserOperation operation = new UserOperation(user.getUserId(), "/userAccount/allotPackage", "给子帐号分配包月条数 userId="+userId+";receiver="+receiver+";effectiveType="+effectiveType+";quantity="+quantity, new Date(), request.getRemoteAddr());
                operationService.save(operation);

            }else if(submitttt!=null){
                request.setAttribute("message","数据不正确，请勿恶意操作");
            }



        }else{
            request.setAttribute("availableNum",0);
        }

        List subUserList = commonService.selectBySql("select userId,userName from t_user where creatorId ='"+userId+"' and status = 'NORMAL'");
        request.setAttribute("subUserList",subUserList);
        return "/userAccount/allotPackage.jsp";

    }



    @RequestMapping("/allotSearch")
    public String allotSearch(Integer page,String status,String allocatee,String receiver, HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("manage");
        String userId=user.getUserId();
        //String userId="admin";
        if(!user.getUserType().equals("MANAGER")){
            allocatee = userId;
        }
        if(status==null){status="1";}
        Map result= userPackageApplyService.allotSearch(page,status,allocatee,receiver);
        request.setAttribute("thisUserType","MANAGER");

        request.setAttribute("result",result);
        UserOperation operation = new UserOperation(user.getUserId(), "/userAccount/allotSearch", "包月分配记录查询 userId="+userId+";receiver="+receiver+";page="+page, new Date(), request.getRemoteAddr());
        operationService.save(operation);
        return "/userAccount/allotSearch.jsp";
    }


    @RequestMapping("/allotStop")
    public String allotStop(Integer page,String status,String allocatee,String receiver,Integer id, HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("manage");
        String userId=user.getUserId();
        //String userId="admin";
        if(!user.getUserType().equals("MANAGER")){
            allocatee = userId;
        }
        userPackageApplyService.allotStop(id,allocatee);

        UserOperation operation = new UserOperation(user.getUserId(), "/userAccount/allotStop", "停止分配 userId="+userId+";receiver="+receiver+";id="+id, new Date(), request.getRemoteAddr());
        operationService.save(operation);

        return this.allotSearch(page,status,allocatee,receiver,request);

    }



    @RequestMapping("/rechargeSearch")
    public String rechargeSearch(String commit,String userId,String startDate,String endDate,String lowPrice,String highPrice,Integer pageNo,HttpServletRequest request){
       // String userId="admin";
       // if(commit!=null){


            Map result = rechargeRecordService.selectRechargeRecordByPage(userId,startDate,endDate,lowPrice,highPrice,pageNo);

        Page p = new Page();
        p.setPageNo((Integer)result.get("page"));
        p.setPageSize(5);
        p.setTotalRecord((Integer)result.get("countItem"));
                request.setAttribute("page",p);

                request.setAttribute("result",result);
      //  }
        return "/userAccount/rechargeSearch.jsp";
    }
}
