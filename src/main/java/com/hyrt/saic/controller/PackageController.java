package com.hyrt.saic.controller;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.ChargePackageDetaill;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.service.PackageService;
import com.hyrt.saic.service.UserOperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午2:41
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/package")
public class PackageController {
    @Autowired
    private PackageService packageService;
    @Autowired
    private UserOperationService userOperationService;
    @RequestMapping("/list")
    public String listPackage(String type,String order,Integer page,String userId,String status,HttpServletRequest request){

        if("".equals(status))
            status=null;
        if("".equals(userId))
            userId=null;
        if("".equals(order))
            order=null;
        if("".equals(type))
            type=null;

         Map res=packageService.listChargePackage(type,order,page,userId,status);
        request.setAttribute("totalitem",res.get("totalitem"));    //总元素
        request.setAttribute("order",order);
        request.setAttribute("type",type);
        request.setAttribute("userId",userId);
        request.setAttribute("status",status);
        request  .setAttribute("totalpage", res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",(List)res.get("list"));    //查询结果list

        User user = (User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/package/list", "后台查询资费套餐", new Date(), request.getRemoteAddr());
        userOperationService.save(operation);

        return "/package/list.jsp";
    }
    @RequestMapping("/buy")
    public String listPackageBuy(String order,Integer page,HttpServletRequest request){
        String type="public";
        String status="on";
        User user = (User) request.getSession().getAttribute("user");

        String userId=user.getUserId();

        Map res=packageService.listChargePackageUser(type,order,page,userId,status);
        request.setAttribute("totalitem",res.get("totalitem"));    //总元素
        request.setAttribute("totalpage",res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",(List)res.get("list"));    //查询结果list

        UserOperation operation = new UserOperation(user.getUserId(), "/package/buy", "前台查询可购买资费套餐", new Date(), request.getRemoteAddr());
        userOperationService.save(operation);

        return "/package/buy.jsp";
    }

    @RequestMapping("/updateStatus")
    public String updateStatus(Integer id,Integer page,String status,String status2,String order,String userId,String type, HttpServletRequest request, HttpServletResponse response){

            packageService.updateStatusById(id,status2);

        User user = (User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/package/updateStatus", "修改套餐状态", new Date(), request.getRemoteAddr());
        userOperationService.save(operation);

        return  listPackage(type,order,page,userId,status,request);
    }

    @RequestMapping("/add/UI")
    public String packageAddUI(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/package/add/UI", "前往增加页面", new Date(), request.getRemoteAddr());
        userOperationService.save(operation);


        return "/package/add.jsp";
    }

    @RequestMapping("/add")
    public String insertPackage(String packageName,BigDecimal price,String type,String userId,String remark, String status,
                                Integer quantity,String remark2,
                                Integer quantity2,String remark3,HttpServletResponse response,HttpServletRequest request){
        if("".equals(packageName)) packageName=null;
        if("".equals(price))  price=null;
        if("".equals(type)) type=null;
        if("".equals(userId)) userId=null;
        if("".equals(remark))  remark=null;
        if("".equals(status)) status=null;
        if("".equals(quantity)) quantity=null;
        if("".equals(remark2)) remark2=null;
        if("".equals(quantity2)) quantity2=null;
        if("".equals(remark3))  remark3=null;


        ChargePackage chargePackage=new ChargePackage();
        chargePackage.setPackageName(packageName);
        chargePackage.setPrice(price);
        chargePackage.setType(type);
        chargePackage.setUserId(userId);
        chargePackage.setRemark(remark);
        chargePackage.setStatus(status);
        ChargePackageDetaill cd1=new ChargePackageDetaill();
        cd1.setBusinessTypeId(1);

        cd1.setQuantity(quantity);
        cd1.setRemark(remark2);
        ChargePackageDetaill cd2=new ChargePackageDetaill();
        cd2.setBusinessTypeId(2);
        cd2.setQuantity(quantity2);
        cd2.setRemark(remark3);
        List<ChargePackageDetaill> chargePackageDetaillList=new ArrayList<ChargePackageDetaill>();
        chargePackageDetaillList.add(cd1);
        chargePackageDetaillList.add(cd2);
         packageService.insert(chargePackage,chargePackageDetaillList);

        User user = (User) request.getSession().getAttribute("manage");
        UserOperation operation = new UserOperation(user.getUserId(), "/package/add", "增加资费套餐", new Date(), request.getRemoteAddr());
        userOperationService.save(operation);


        try {
            response.sendRedirect("/package/list");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
