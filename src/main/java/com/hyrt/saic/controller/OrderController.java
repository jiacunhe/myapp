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
    public String groupOrder (HttpServletRequest request){

        String sn = request.getSession().getId();
        org.apache.commons.fileupload.ObjectPool pool = org.apache.commons.fileupload.ObjectPool.getPool();
        pool.p.put(sn, new org.apache.commons.fileupload.UpfileProgress());
        request.getSession().setAttribute("fileSerialNumber", sn);

       return "/order/group.jsp";
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
    public String result(Long id, int orderType, HttpServletRequest request){
        if(orderType==1 || orderType==3 || orderType==4){

            request.setAttribute("result",JSON.toJSONString(orderService.selectGroupInfo(id)));
            return "/order/groupResult.jsp";


        }else{
            request.setAttribute("result",JSON.toJSONString(orderService.selectPersonInfo(id)));
            return "/order/personResult.jsp";
        }



    }

    @RequestMapping("/searchForAjax")
    public @ResponseBody String searchByAjax (String type,String sday,String eday,String id,Integer page,String status,HttpServletRequest request){
        System.out.println(page+"------------------------");
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
            System.out.println(JSON.toJSONString(res));
        return JSON.toJSONString(res);
    }


    @RequestMapping("/groupSubmit")
    public String groupOrderSubmit(String groupCode,String groupName,String groupRemark,String groupMonitor,Integer businessType, HttpServletRequest request){

        if(groupCode!=null && groupName!=null && groupRemark !=null && groupMonitor !=null){
          // && !"".equals(groupCode) && !"".equals(groupName) && !"".equals(groupRemark) && !"".equals(groupMonitor)
            String userId="1";
            String[] code = groupCode.split(",");
            String[] name = groupName.split(",");
            String[] remark = groupRemark.split(",");
            String[] monitor = groupMonitor.split(",");

            String orderId = UUID.randomUUID().toString();
            String orderId2 = UUID.randomUUID().toString();

            int a=1,b=1;
            List beans = new ArrayList();


            OrderDetail orderDetail;
            for(int i=0;i<code.length;i++){
                if(!code[i].equals("")&& monitor[i].equals("0")){
                    if(a==1){
                        beans.add( new Order(orderId,businessType,new Timestamp(new Date().getTime()),userId,OrderStatus.下单));
                    }
                    orderDetail = new  OrderDetail( orderId, "2", name[i],  code[i], null, remark[i]);
                    beans.add(orderDetail);
                    a++;
                } else if(!code[i].equals("")&& monitor[i].equals("1")){
                    if(b==1){
                        beans.add( new Order(orderId2,2,new Timestamp(new Date().getTime()),userId,OrderStatus.下单));
                    }
                    orderDetail = new  OrderDetail( orderId2, "2", name[i],  code[i], null, remark[i]);
                    beans.add(orderDetail);
                    b++;
                }
            }


            Map map = new HashMap();

            map.put(DataOperateType.INSERT,beans);

            try {
                commonService.saveOrUpdateOrDeleteAll(map);
            } catch (Exception e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }

        }
        request.setAttribute("name","订单已经提交,XXX等吧");
        return "/index.jsp";
    }

    @RequestMapping("/upFile")
    public String  upFile(MultipartFile file,Integer businessType,HttpServletRequest request){

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
    /*
                String filename = sn + exname;
                try {
                   file.transferTo(new File(request.getSession().getServletContext()
                           .getRealPath("/") + "resource/credimages/" + filename));

                } catch (Exception e) {
                    e.printStackTrace();
                }*/
        }
        return "/order/upFileProgress.jsp";
    }

    @RequestMapping("/progress")
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
                UpfileProgress ufp = (UpfileProgress) pool.p.get(sn);
                result = ufp.progress;
            }
        } else {
            result = "0.00%;   非法操作<a href='/exit'>返回</a>";
        }
     //   System.out.println(result+"------request----------------------------");

        return result;

    }


    @RequestMapping("/upFileResult")
    public String  upFileResult(HttpServletRequest request, HttpServletResponse response){

        if (request.getSession().getAttribute("fileSerialNumber") != null) {
            String sn = (String) request.getSession().getAttribute("fileSerialNumber");

            ObjectPool pool = ObjectPool.getPool();
            List upObjList = ((List) pool.p.get(sn+"reslist")).subList(0,10);
            request.setAttribute("upObjList",upObjList);
        }


        return "/order/upFileResult.jsp";

    }
}
