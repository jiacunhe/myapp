package com.hyrt.saic.controller;

import com.hyrt.saic.service.AccountInfoService;
import com.hyrt.saic.service.UserApplyPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-11
 * Time: 下午2:01
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/accountInfoList")
public class AccountInfoListController {
    @Autowired
    private AccountInfoService accountInfoService;
    @Autowired
    UserApplyPackageService userApplyPackageService;
    @RequestMapping("/list")
    public String select(String userId,Integer page,HttpServletRequest request){

        if("".equals(userId))
            userId=null;

        Map res=  accountInfoService.selectByPage(userId,page);
        request.setAttribute("totalitem",res.get("totalitem"));
        request.setAttribute("userId",userId);
        request.setAttribute("totalpage",res.get("totalpage"));    //总页数
        request.setAttribute("page",res.get("page"));    //当前页
        request.setAttribute("list",res.get("list"));    //查询结果list
          return "accountInfoList.jsp";
    }
}
