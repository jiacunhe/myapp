package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.bean.User;
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

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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

    @RequestMapping("download")
    public void download(String path,HttpServletRequest request,HttpServletResponse response){

        File fileObj = new File(this.getClass().getResource("/").getPath()+"model.xls");


        if (fileObj!=null && fileObj.exists()) {
            try {
                InputStream inStream = new FileInputStream(fileObj);
                response.reset();
                response.setContentType("application/vnd.ms-excel;charset=GBK");

                response.setBufferSize(10 * 1024);

                response.setHeader("Content-Disposition","attachment; filename=model.xls");
                byte[] b = new byte[1024*10];
                int len;
                ServletOutputStream outs = response.getOutputStream();
                while ((len = inStream.read(b)) > 0) {
                    outs.write(b, 0, len);
                }
                outs.flush();
                outs.close();
                inStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    @RequestMapping("/search")
    public String orderSearch (String type,String sday,String eday,String code,String name,String submit,HttpServletRequest request){
        request.setAttribute("orderTypeList",orderService.selectOrderType());

 //       if(submit!=null){

            User user =(User) request.getSession().getAttribute("user");
            String userId=user.getUserId();

            HashMap params = new HashMap();

            params.put("userId",userId);

            if(!"".equals(code))  params.put("code",code);
                if( !"".equals(type))  params.put("type",type);
                if( !"".equals(sday))  params.put("sday",sday);
                if( !"".equals(eday))  params.put("eday",eday);
                if( !"".equals(name))  params.put("name",name);


            params.put("businessType",1);
            Map disposable = orderService.selectOrder(params);
            params.put("businessType",2);
            Map recyclable = orderService.selectOrder(params);


            request.setAttribute("disposable",disposable);
            request.setAttribute("recyclable",recyclable);



            request.setAttribute("type",type);
            request.setAttribute("sday",sday);
            request.setAttribute("eday",eday);
            request.setAttribute("code",code);
            request.setAttribute("name",name);
  //      }

        return "/order/search.jsp";
    }



    @RequestMapping(value="/searchForAjax", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody String searchByAjax (String type,String sday,String eday,String code,String name,Integer page,String status,String businessType,HttpServletRequest request){


                User user =(User) request.getSession().getAttribute("user");
                String userId=user.getUserId();
                HashMap params = new HashMap();

                params.put("userId",userId);



//            if(!"".equals(code)) {
//                params.put("id",code);
//            }else{
                if( !"".equals(code))  params.put("code",code);
                if( !"".equals(type))  params.put("type",type);
                if( !"".equals(sday))  params.put("sday",sday);
                if( !"".equals(eday))  params.put("eday",eday);
                if( !"".equals(name))  params.put("name",name);
 //           }

            params.put("page",page);
            if(businessType==null || businessType.equals("all") ){

            }else if("disposable".equals(businessType)){
                params.put("businessType","1");
            }else if("recyclable".equals(businessType)){
                params.put("businessType","2");
            }

            Map res = orderService.selectOrder(params);
            res.put("businessType",businessType);
             return JSON.toJSONString(res);
    }


    @RequestMapping("/submit")
    public String submit(Integer orderType,String groupCode,String groupName,String groupRemark,String groupMonitor,Integer businessType,String certificate,Integer cycle, HttpServletRequest request){
          cycle=1;
        if(groupCode!=null && groupName!=null && groupRemark !=null){
          // && !"".equals(groupCode) && !"".equals(groupName) && !"".equals(groupRemark) && !"".equals(groupMonitor)
            User user =(User) request.getSession().getAttribute("user");
            String userId=user.getUserId();

            String[] code = groupCode.split(",");
            String[] name = groupName.split(",");
            String[] remark = groupRemark.split(",");
            String[] monitor = null;
            String[] certType = null;
            if(groupMonitor!=null)monitor=groupMonitor.split(",");
            if(certificate!=null)certType=certificate.split(",");



            String orderId = UUID.randomUUID().toString();
            String orderId2 = UUID.randomUUID().toString();

            int a=0,b=0,c=0;
            List beans = new ArrayList();


            OrderDetail orderDetail;
            for(int i=0;i<code.length-1;i++){
                if(code[i].length()>50)code[i].substring(0,50);
                if(name[i].length()>100)name[i].substring(0,100);
                if(remark[i].length()>100)remark[i].substring(0,100);

                if(!code[i].equals("")&& monitor!=null && monitor[i].equals("0")){
                    if(a==0){
                        beans.add( new Order(orderId,businessType,orderType,new Timestamp(new Date().getTime()),userId,OrderStatus.查询中,cycle));
                    }

                    orderDetail = new  OrderDetail( orderId, businessType+"", name[i],  code[i], null,OrderStatus.查询中, remark[i]);
                    if(certType!=null){
                                      orderDetail.setCertType(certType[i]);
                    }
                    beans.add(orderDetail);
                    a++;
                } else if(!code[i].equals("")&&  monitor!=null&& monitor[i].equals("1")){
                    if(b==0){
                        beans.add( new Order(orderId2,businessType+1,orderType+3,new Timestamp(new Date().getTime()),userId,OrderStatus.监控中,cycle));
                    }
                    orderDetail = new  OrderDetail( orderId2, (businessType+1)+"", name[i],  code[i], null,OrderStatus.监控中, remark[i]);
                    if(certType!=null){
                        orderDetail.setCertType(certType[i]);
                    }
                    beans.add(orderDetail);
                    b++;
                } else if(!code[i].equals("")&&  monitor==null){
                    if(c==0){
                        beans.add( new Order(orderId2,businessType,orderType,new Timestamp(new Date().getTime()),userId,OrderStatus.监控中,cycle));
                    }
                    orderDetail = new  OrderDetail( orderId2, businessType+"", name[i],  code[i], null,OrderStatus.监控中, remark[i]);
                    if(certType!=null){
                        orderDetail.setCertType(certType[i]);
                    }
                    beans.add(orderDetail);
                    c++;
                }
            }
            request.getSession().setAttribute("orderBeans",beans);

             request.setAttribute("orderTypeName",((Map)request.getServletContext().getAttribute("orderType")).get(orderType));
             request.setAttribute("businessTypeName",((Map)request.getServletContext().getAttribute("businessType")).get(businessType));

            request.setAttribute("countA",a);
            request.setAttribute("countC",c);
            request.setAttribute("orderTypeNameA",((Map)request.getServletContext().getAttribute("orderType")).get(orderType));
            request.setAttribute("countB",b);
            request.setAttribute("orderTypeNameB",((Map)request.getServletContext().getAttribute("orderType")).get(orderType+3));

            request.setAttribute("orderTypePP",orderType);

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

        User user =(User) request.getSession().getAttribute("user");
      //  if(user==null)user=(User)  request.getSession().getAttribute("manage");
        String userId=user.getUserId();

        if(id!=null){



            Map params = new HashMap();
            params.put("id",id);
            params.put("userId",userId);
            Integer orderType= orderService.selectForPermissionView(params);
            if(orderType!=null){
                if(orderType==1 || orderType==3 || orderType==4){


                    request.setAttribute("result",JSON.toJSONString(orderService.selectGroupInfo(id)));
                    request.setAttribute("groupresult",orderService.selectGroupInfo(id));
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
    public String subsidiary(String id,Integer page,Integer orderType,HttpServletRequest request){

        Map params = new HashMap();
        params.put("orderDetailId",id);
        params.put("orderType",orderType);
        params.put("page",page);
        request.setAttribute("objects",orderService.selectMonitorResultList(params));

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
 //       System.out.println(result+"------request----------------------------");


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
        User user =(User) request.getSession().getAttribute("user");
        String userId=user.getUserId();


        if (orderTypeStr != null && sn!=null) {
            Integer orderType = Integer.valueOf(orderTypeStr);
            String orderId = UUID.randomUUID().toString();
            ObjectPool pool = ObjectPool.getPool();
            List upObjList = (List) pool.p.get(sn+"reslist");
            int size = upObjList.size();
            String[] obj;

            List beans = new ArrayList();
            beans.add( new Order(orderId,1,orderType,new Timestamp(new Date().getTime()),userId,OrderStatus.查询中,null));

            for(int i=0;i<size;i++){
                  obj = (String[])upObjList.get(i);

                if(orderTypeStr.equals("1")||orderTypeStr.equals("3")){
                    beans.add(new OrderDetail(orderId,"1",obj[1],obj[0],null,OrderStatus.查询中,obj[2]));
                }else if(orderTypeStr.equals("2")){
                    beans.add(new OrderDetail(orderId,"1",obj[1],obj[0],obj[3],OrderStatus.查询中,obj[2]));
                }


            }

            Map map = new HashMap();

            map.put(DataOperateType.INSERT,beans);

            try {
                commonService.saveOrUpdateOrDeleteAll(map);
            } catch (Exception e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
            return this.detail(orderId,1,request);

        }else{
            request.setAttribute("errorMessage","未知错误");
            request.getRequestDispatcher("/error.jsp").forward(request,response);
            return null;
        }

    }
}
