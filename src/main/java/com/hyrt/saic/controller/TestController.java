package com.hyrt.saic.controller;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;

@Controller
public class TestController {

    @RequestMapping("/test")
    public String test(@ModelAttribute("user") User user, HttpServletRequest request){


        if(user.getUserid().equals("ftl")){
            request.setAttribute("name","ftl");
            return   "/index.ftl";
        }else{
            request.setAttribute("name","jsp");
            return   "/index.jsp";
        }

    }

    @Autowired
    private TestService testService;
    @RequestMapping("/testAdd")
    public String testAdd(String id1,String id2,HttpServletRequest request){

        User u = new User( id1,"2","2",new  Timestamp(new Date().getTime()),"2","2");
        User u2 = new User( id2,"2","2",new  Timestamp(new Date().getTime()),"2","2");
        try {
            testService.testTransaction(u,u2);
            request.setAttribute("name","successful");
            return "index.jsp";
        } catch (Exception e) {
            request.setAttribute("name","error:"+e.getMessage());
            return "index.ftl";
        }


    }


    @Autowired
    private CommonService commonService;
    @RequestMapping("/common")
    public String common(HttpServletRequest request){

        User u = new User( "aaa","2","2",new  Timestamp(new Date().getTime()),"2","2");

        try {
            commonService.testCommonMapper(u,"1");
           // testService.testTransaction(u,u2);
            request.setAttribute("name","successful");
            return "index.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("name","error:"+e.getMessage());
            return "index.ftl";
        }


    }

}
