package com.hyrt.saic.controller;

import com.hyrt.saic.service.UserApplyPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-7
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/userApplyPackage1548735")
public class UserApplyPackageController {
    @Autowired
    UserApplyPackageService userApplyPackageService;
    @RequestMapping("/list")
    public String select(String userId){
       List list2= userApplyPackageService.select(userId);
        return "accountInfo.jsp";
    }
}
