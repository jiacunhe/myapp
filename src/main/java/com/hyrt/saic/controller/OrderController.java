package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Order;
import com.hyrt.saic.bean.OrderDetail;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.util.enums.DataOperateType;
import com.hyrt.saic.util.ExcelAnalyze;
import com.hyrt.saic.util.enums.OrderStatus;
import org.apache.commons.fileupload.ObjectPool;
import org.apache.commons.fileupload.UpfileProgress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
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

    @RequestMapping("/group")
    public String test(String groupCode,String groupName,String groupRemark,String groupMonitor,Integer businessType, HttpServletRequest request){

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
        return "orderupfileprogress.jsp";
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
            result = "0.00%";
        }
     //   System.out.println(result+"------request----------------------------");

        return result;

    }
}
