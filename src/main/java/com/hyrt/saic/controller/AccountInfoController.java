package com.hyrt.saic.controller;

import com.hyrt.saic.service.AccountInfoService;
import com.hyrt.saic.service.PackageService;
import com.hyrt.saic.service.UserApplyPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-7
 * Time: 上午11:17
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/accountInfo")
public class AccountInfoController {
    @Autowired
    private AccountInfoService accountInfoService;
    @Autowired
    UserApplyPackageService userApplyPackageService;
    @RequestMapping("/list")
    public String select(String userId,HttpServletRequest request){
        userId="admin";

        List list= accountInfoService.select(userId);
        boolean package1,package2;
        if(list.size()==0){
             package1=false;
        } else  package1=true;

        SimpleDateFormat sdf= new SimpleDateFormat("yyyyMM");
        Date curDate= new Date();
        String dateStr=sdf.format(curDate);


        List list2= userApplyPackageService.select(userId,dateStr);
        if(list2.size()==0){
           package2=false;
        }  else  package2=true;
        request.setAttribute("list",list);
        request.setAttribute("list2",list2);
        request.setAttribute("package1",package1);
        request.setAttribute("package2",package2);
        return "/accountInfo/list.jsp";
    }
}
