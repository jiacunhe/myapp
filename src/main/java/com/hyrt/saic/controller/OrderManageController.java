package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-13
 * Time: 上午9:58
 * To change this template use File | Settings | File Templates.
 */


@Controller
@RequestMapping("/orderManage")
public class OrderManageController {

    @Autowired
    OrderService orderService;


    @RequestMapping("/search")
    public String orderSearch (String type,String sday,String eday,String code,String name,String userId,String submit,HttpServletRequest request){
        request.setAttribute("orderTypeList",orderService.selectOrderType());

        if(submit!=null){
            HashMap params = new HashMap();

          //  params.put("userId","1");
            if(!"".equals(userId)) params.put("userId",userId);
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


            request.setAttribute("userId",userId);
            request.setAttribute("type",type);
            request.setAttribute("sday",sday);
            request.setAttribute("eday",eday);
            request.setAttribute("code",code);
            request.setAttribute("name",name);
        }

        return "/orderManage/search.jsp";
    }


    @RequestMapping(value="/searchForAjax", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String searchByAjax (String type,String sday,String eday,String code,String name,Integer page,String status,String businessType,String userId,HttpServletRequest request){
        //      System.out.println(page+"------------------------");
        HashMap params = new HashMap();

       // params.put("userId","1");



       // if(!"".equals(code)) {

      //  }else{

            if(!"".equals(userId)) params.put("userId",userId);
            if( !"".equals(code))  params.put("code",code);
            if( !"".equals(type))  params.put("type",type);
            if( !"".equals(sday))  params.put("sday",sday);
            if( !"".equals(eday))  params.put("eday",eday);
            if( !"".equals(name))  params.put("name",name);
     //   }

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
}
