package com.hyrt.saic.controller;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.ChargePackageDetaill;
import com.hyrt.saic.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午2:41
 * To change this template use File | Settings | File Templates.
 * 套餐的修改
 */
@Controller
@RequestMapping("/package")
public class PackageCotroller {
    @Autowired
    private PackageService packageService;
    @RequestMapping("/list")
    public String listPackage(String type,String order,Integer page,String userId,String status,HttpServletRequest request){
        System.out.println(status+"-----------------------------------");
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
        request.setAttribute("totalpage",res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",(List)res.get("list"));    //查询结果list

       // System.out.println(((List)res.get("list")).get(0).getClass().getName()+"------------------------------------");
       // request.setAttribute("name",((List)res.get("list")).size());
        return "packageList.jsp";
    }
    @RequestMapping("/buy")
    public String listPackageBuy(String order,Integer page,String userId,HttpServletRequest request){
        String type="public";
        String status="on";
        userId="1";
        Map res=packageService.listChargePackageUser(type,order,page,userId,status);
        request.setAttribute("totalitem",res.get("totalitem"));    //总元素
        request.setAttribute("totalpage",res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",(List)res.get("list"));    //查询结果list

        // System.out.println(((List)res.get("list")).get(0).getClass().getName()+"------------------------------------");
        // request.setAttribute("name",((List)res.get("list")).size());
        return "tcgm.jsp";
    }
   /* @RequestMapping("/delete")
    public String deletePackage(int id,String type,String order,Integer page,String userId,String status,HttpServletRequest request){
        packageService.deleteById(id);
       // return "/package/list";
        Map res=packageService.listChargePackage(type,order,page,userId,status);
        request.setAttribute("totalitem",res.get("totalitem"));    //总元素
        request.setAttribute("totalpage",res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",(List)res.get("list"));    //查询结果list

        // System.out.println(((List)res.get("list")).get(0).getClass().getName()+"------------------------------------");
        // request.setAttribute("name",((List)res.get("list")).size());
        return "packageList.jsp";
    }


    @RequestMapping("/update")
    public String updatePackage(Integer id,String packageName,BigDecimal price,String type,String remark,
                                Integer quantity,String remark2,
                               Integer quantity2,String remark3,Integer Aid,Integer Bid, HttpServletResponse response){

        ChargePackage chargePackage=new ChargePackage();
        chargePackage.setId(id);
        chargePackage.setPackageName(packageName);
        chargePackage.setPrice(price);
        chargePackage.setType(type);
     //   chargePackage.setUserId(userId);
        chargePackage.setRemark(remark);
        ChargePackageDetaill cd1=new ChargePackageDetaill();
        cd1.setId(Aid);
      //  cd1.setBusinessTypeId(businessTypeId);
        cd1.setQuantity(quantity);
        cd1.setRemark(remark2);
        ChargePackageDetaill cd2=new ChargePackageDetaill();
      //  cd1.setBusinessTypeId(businessTypeId2);
        cd2.setId(Bid);
        cd2.setQuantity(quantity2);
        cd2.setRemark(remark3);
        List<ChargePackageDetaill> chargePackageDetaillList=new ArrayList<ChargePackageDetaill>();
        chargePackageDetaillList.add(cd1);
        chargePackageDetaillList.add(cd2);
        packageService.update(chargePackage, chargePackageDetaillList);
        try {
            response.sendRedirect("/package/list");
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return null;
    }      */
    @RequestMapping("/updateStatus")
    public String updateStatus(Integer id,Integer page,String status,String status2,String order,String userId,String type, HttpServletRequest request, HttpServletResponse response){
      //  System.out.println("----------------"+(id.byteValue()));
          //           System.out.println("----------------"+(id==3));
        //             System.out.println("----------------"+(status.equals("off")));
      //  System.out.println("----------------"+(status.equals("on")));

            packageService.updateStatusById(id,status2);

        return  listPackage(type,order,page,userId,status,request);
    }
    @RequestMapping("/insert")
    public String insertPackage(String packageName,BigDecimal price,String type,String userId,String remark, String status,
                                Integer quantity,String remark2,
                                Integer quantity2,String remark3,HttpServletResponse response){
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
        try {
            response.sendRedirect("/package/list");
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return null;
    }
    @RequestMapping("/change")
    public String selectById(int id,HttpServletRequest request) {
          Map res=packageService.selectById(id);
          request.setAttribute("p",res);

        return "packageChange.jsp";
    }

    @RequestMapping("/insertUser")
    public String packageInsertUser(String userId,HttpServletRequest request){
         userId="007";
        request.setAttribute("userId",userId);
       return "packageInsertUser.jsp";
    }

}
