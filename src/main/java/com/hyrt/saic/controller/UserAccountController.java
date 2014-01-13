package com.hyrt.saic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-13
 * Time: 下午2:53
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("/userAccount")
public class UserAccountController {

    @RequestMapping("/search")
    public String search(){

        return "/userAccount/search.jsp";

    }

}
