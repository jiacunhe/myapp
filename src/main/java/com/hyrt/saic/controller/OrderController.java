package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.bean.order.Order;
import com.hyrt.saic.bean.order.OrderDetail;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.OrderService;
import com.hyrt.saic.util.enums.DataOperateType;
import com.hyrt.saic.util.ExcelAnalyze;
import com.hyrt.saic.util.enums.OrderStatus;
import org.apache.commons.fileupload.ObjectPool;
import org.apache.commons.fileupload.UpfileProgress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 上午9:49
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    CommonService commonService;
    @Autowired
    OrderService orderService;

    @RequestMapping("/group")
    public String group (HttpServletRequest request){
        request.setAttribute("businessTypeId","1");
        request.setAttribute("orderTypeId","1");
       return "/order/group.jsp";
    }

    @RequestMapping("/person")
    public String person (HttpServletRequest request){
        request.setAttribute("businessTypeId","1");
        request.setAttribute("orderTypeId","2");
        return "/order/person.jsp";
    }

    @RequestMapping("/investment")
    public String investment (HttpServletRequest request){
        request.setAttribute("businessTypeId","1");
        request.setAttribute("orderTypeId","3");
        return "/order/investment.jsp";
    }
    @RequestMapping("/groupMonitor")
    public String groupMonitor (HttpServletRequest request){
        request.setAttribute("businessTypeId","2");
        request.setAttribute("orderTypeId","4");
        return "/order/groupMonitor.jsp";
    }

    @RequestMapping("/personMonitor")
    public String personMonitor (HttpServletRequest request){
        request.setAttribute("businessTypeId","2");
        request.setAttribute("orderTypeId","5");
        return "/order/personMonitor.jsp";
    }

    @RequestMapping("/upFile")
    public String upFile(String type, HttpServletRequest request){
        String sn = request.getSession().getId();
        org.apache.commons.fileupload.ObjectPool pool = org.apache.commons.fileupload.ObjectPool.getPool();
        pool.p.put(sn, new org.apache.commons.fileupload.UpfileProgress());
        request.getSession().setAttribute("fileSerialNumber", sn);
        request.getSession().setAttribute("fileOrderType", type);
        return "/order/upFile.jsp";
    }



    @RequestMapping("/search")
    public String orderSearch (String type,String sday,String eday,String id,String submit,HttpServletRequest request){
        request.setAttribute("orderTypeList",orderService.selectOrderType());

        if(submit!=null){
            HashMap params = new HashMap();

            params.put("userId","1");

            if(!"".equals(id)) {
                params.put("id",id);
            }else{
                if( !"".equals(type))  params.put("type",type);
                if( !"".equals(sday))  params.put("sday",sday);
                if( !"".equals(eday))  params.put("eday",eday);
            }
            Map all = orderService.selectOrder(params);
            params.put("orderStatus","'"+OrderStatus.结束+"','"+OrderStatus.未通过审核+"','"+OrderStatus.查询无果+"','"+OrderStatus.账户支付失败+"'");
            Map done = orderService.selectOrder(params);
            params.put("orderStatus","'"+OrderStatus.下单+"','"+OrderStatus.审核中+"','"+OrderStatus.通过审核+"','"+OrderStatus.进行中+"'");
            Map undone = orderService.selectOrder(params);
            params.put("orderStatus","'"+OrderStatus.查询无果+"'");
            Map nothing = orderService.selectOrder(params);

            request.setAttribute("all",all);
            request.setAttribute("done",done);
            request.setAttribute("undone",undone);
            request.setAttribute("nothing",nothing);


            request.setAttribute("type",type);
            request.setAttribute("sday",sday);
            request.setAttribute("eday",eday);
            request.setAttribute("id",id);

        }

        return "/order/search.jsp";
    }



    @RequestMapping(value="/searchForAjax", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody String searchByAjax (String type,String sday,String eday,String id,Integer page,String status,HttpServletRequest request){
  //      System.out.println(page+"------------------------");
            HashMap params = new HashMap();

            params.put("userId","1");

            if(!"".equals(id)) {
                params.put("id",id);
            }else{
                if( !"".equals(type))
                    params.put("type",type);
                if( !"".equals(sday))
                    params.put("sday",sday);
                if( !"".equals(eday))
                    params.put("eday",eday);
            }

            params.put("page",page);
            if(status==null || status.equals("all") ){

            }else if("done".equals(status)){
                params.put("orderStatus","'"+OrderStatus.结束+"','"+OrderStatus.未通过审核+"','"+OrderStatus.查询无果+"','"+OrderStatus.账户支付失败+"'");
            }else if("undone".equals(status)){
                params.put("orderStatus","'"+OrderStatus.下单+"','"+OrderStatus.审核中+"','"+OrderStatus.通过审核+"','"+OrderStatus.进行中+"'");
            }else if("nothing".equals(status)){
                params.put("orderStatus","'"+OrderStatus.查询无果+"'");
            }

            Map res = orderService.selectOrder(params);
            res.put("status",status);

             return JSON.toJSONString(res);
    }


    @RequestMapping("/submit")
    public String submit(Integer orderType,String groupCode,String groupName,String groupRemark,String groupMonitor,Integer businessType,String certificate,Integer cycle, HttpServletRequest request){

        if(groupCode!=null && groupName!=null && groupRemark !=null){
          // && !"".equals(groupCode) && !"".equals(groupName) && !"".equals(groupRemark) && !"".equals(groupMonitor)
            String userId="1";
            String[] code = groupCode.split(",");
            String[] name = groupName.split(",");
            String[] remark = groupRemark.split(",");
            String[] monitor = null;
            String[] certType = null;
            if(groupMonitor!=null)monitor=groupMonitor.split(",");
            if(certificate!=null)certType=certificate.split(",");



            String orderId = UUID.randomUUID().toString();
            String orderId2 = UUID.randomUUID().toString();

            int a=0,b=0;
            List beans = new ArrayList();


            OrderDetail orderDetail;
            for(int i=0;i<code.length-1;i++){
                if(!code[i].equals("")&& (monitor==null || monitor[i].equals("0"))){
                    if(a==0){
                        beans.add( new Order(orderId,businessType,orderType,new Timestamp(new Date().getTime()),userId,OrderStatus.下单,cycle));
                    }
                    orderDetail = new  OrderDetail( orderId, businessType+"", name[i],  code[i], null,OrderStatus.下单, remark[i]);
                    if(certType!=null){
                                      orderDetail.setCertType(certType[i]);
                    }
                    beans.add(orderDetail);
                    a++;
                } else if(!code[i].equals("")&&  monitor!=null&& monitor[i].equals("1")){
                    if(b==0){
                        beans.add( new Order(orderId2,businessType+1,orderType+3,new Timestamp(new Date().getTime()),userId,OrderStatus.下单,cycle));
                    }
                    orderDetail = new  OrderDetail( orderId2, (businessType+1)+"", name[i],  code[i], null,OrderStatus.下单, remark[i]);
                    if(certType!=null){
                        orderDetail.setCertType(certType[i]);
                    }
                    beans.add(orderDetail);
                    b++;
                }
            }
            request.getSession().setAttribute("orderBeans",beans);
             request.setAttribute("orderTypeName",((Map)request.getServletContext().getAttribute("orderType")).get(orderType));
             request.setAttribute("businessTypeName",((Map)request.getServletContext().getAttribute("businessType")).get(businessType));
           // request.setAttribute("orderType",((Map)request.getServletContext().getAttribute("orderType")).get(orderType));
           // request.setAttribute("businessType",((Map)request.getServletContext().getAttribute("businessType")).get(businessType));
            request.setAttribute("countA",a);
            request.setAttribute("orderTypeNameA",((Map)request.getServletContext().getAttribute("orderType")).get(orderType));
            request.setAttribute("countB",b);
            request.setAttribute("orderTypeNameB",((Map)request.getServletContext().getAttribute("orderType")).get(orderType+3));


        }

        return "/order/confirm.jsp";
    }

    @RequestMapping("/confirm")
    public String confirm(HttpServletRequest request){
            Map map = new HashMap();
            List beans = (List)request.getSession().getAttribute("orderBeans");
            map.put(DataOperateType.INSERT,beans);

            try {
                commonService.saveOrUpdateOrDeleteAll(map);
            } catch (Exception e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        return      this.detail(((Order)beans.get(0)).getId(),1,request);
    }


    @RequestMapping("/detail")
    public String detail(String id,Integer page,HttpServletRequest request){


        request.setAttribute("orderInfo", orderService.selectOrderInfoByOrderId(id));

        Map params = new HashMap();
        params.put("orderId",id);
        params.put("page",page);
        request.setAttribute("objects",orderService.selectByOrderId(params));
        return "/order/detail.jsp";
    }




    @RequestMapping("/result")
    public String result(Long id, HttpServletRequest request){
        //验证ID 是否该用户
        if(id!=null){
            Map params = new HashMap();
            params.put("id",id);
            params.put("userId","1");
            Integer orderType= orderService.selectForPermissionView(params);
            if(orderType!=null){
                if(orderType==1 || orderType==3 || orderType==4){

                    request.setAttribute("result",JSON.toJSONString(orderService.selectGroupInfo(id)));
                    return "/order/groupResult.jsp";


                }else{
                    request.setAttribute("result",JSON.toJSONString(orderService.selectPersonInfo(id)));
                    return "/order/personResult.jsp";
                }
            }else{
                return null;
            }
        }else{
            return null;
        }
    }



    @RequestMapping("/subsidiary")
    public String subsidiary(String orderId,String type,Integer page,HttpServletRequest request){

        Map params = new HashMap();
        params.put("orderId",orderId);
        params.put("type",type);
        params.put("page",page);
        request.setAttribute("objects",orderService.selectByOrderId(params));

         return "/order/subsidiary.jsp";
    }


    @RequestMapping("/upload")
    public String  upload(MultipartFile file,Integer businessType,HttpServletRequest request){

        if (!file.isEmpty()) {
            String exname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String sn = (String)request.getSession().getAttribute("fileSerialNumber");
            if (exname.equals(".xls") || exname.equals("xlsx")) {

                try {
                    Thread excelAnalyzeThread = new Thread(new ExcelAnalyze(file.getInputStream(),sn));
                    excelAnalyzeThread.start();
                    request.setAttribute("message", "上传以完成，正在处理数据:");
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        return "/order/upFileProgress.jsp";
    }

    @RequestMapping(value="/progress",produces="text/plain;charset=UTF-8")
    public @ResponseBody String  progress(String param,HttpServletRequest request, HttpServletResponse response){


        String result=null;
        if (request.getSession().getAttribute("fileSerialNumber") != null) {
            String sn = (String) request.getSession().getAttribute("fileSerialNumber");

            //完成后清除内存
            if("rm".equals(param)){
                ObjectPool pool = ObjectPool.getPool();
                pool.p.remove(sn);
              //  System.out.println("the sn be removed----------------------------------");
            }else{
                //返回进度信息
                ObjectPool pool = ObjectPool.getPool();
                Object obj =pool.p.get(sn);
                if(obj!=null)   {
                    result = ((UpfileProgress)obj).progress ;
                }

            }
        } else {
            result = "0.00%;   非法操作<a href='/exit'>返回</a>";
        }
        System.out.println(result+"------request----------------------------");
//        char [] chars = result.toCharArray();
//        String asciiArgs="";
//        for(char c:chars){
//            asciiArgs+="\\u"+Integer.toHexString(c);
//        }

         return result;

    }


    @RequestMapping("/upFileResult")
    public String  upFileResult(HttpServletRequest request,Integer page){




        if (request.getSession().getAttribute("fileSerialNumber") != null) {
            String sn = (String) request.getSession().getAttribute("fileSerialNumber");

            ObjectPool pool = ObjectPool.getPool();
            List upObjList = (List) pool.p.get(sn+"reslist");


            int pageSize=10;

            if (page == null) page = 1;

            int countItem = upObjList.size();

            int totalPage = (countItem + pageSize - 1) / pageSize;
            if (page > totalPage) page = totalPage;
            if (page < 1) page = 1;

            request.setAttribute("page",page);
            request.setAttribute("totalPage",totalPage);
            request.setAttribute("countItem",countItem);
           request.setAttribute("upObjList",upObjList.subList((page-1)*pageSize,page*pageSize>countItem?countItem:page*pageSize));

        }


        return "/order/upFileResult.jsp";

    }


    @RequestMapping("/createOrderByFile")
    public String createOrderByFile(HttpServletRequest request,HttpServletResponse response) throws  Exception{
       String orderTypeStr = (String)request.getSession().getAttribute("fileOrderType");
        String sn = (String) request.getSession().getAttribute("fileSerialNumber");
        String userId="1";
        if (orderTypeStr != null && sn!=null) {
            Integer orderType = Integer.valueOf(orderTypeStr);
            String orderId = UUID.randomUUID().toString();
            ObjectPool pool = ObjectPool.getPool();
            List upObjList = (List) pool.p.get(sn+"reslist");
            int size = upObjList.size();
            String[] obj;

            List beans = new ArrayList();
            beans.add( new Order(orderId,1,orderType,new Timestamp(new Date().getTime()),userId,OrderStatus.下单,null));

            for(int i=0;i<size;i++){
                  obj = (String[])upObjList.get(i);
//                if(!obj[0].equals("")&& (monitor==null || monitor[i].equals("0"))){
//                                String orderId,String monitorType,String objName, String objCode,String certType,OrderStatus status,String remark
//                }
                if(orderTypeStr.equals("1")||orderTypeStr.equals("3")){
                    beans.add(new OrderDetail(orderId,"1",obj[1],obj[0],null,OrderStatus.下单,obj[2]));
                }else if(orderTypeStr.equals("2")){
                    beans.add(new OrderDetail(orderId,"1",obj[1],obj[0],obj[3],OrderStatus.下单,obj[2]));
                }


            }

            Map map = new HashMap();

            map.put(DataOperateType.INSERT,beans);

            try {
                commonService.saveOrUpdateOrDeleteAll(map);
            } catch (Exception e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
            return      this.detail(orderId,1,request);

//                if(!code[i].equals("")&& (monitor==null || monitor[i].equals("0"))){
//                    if(a==0){
//
//                    }
//

        }else{
            request.setAttribute("errorMessage","未知错误");
            request.getRequestDispatcher("/error.jsp").forward(request,response);
            return null;
        }

    }
}
