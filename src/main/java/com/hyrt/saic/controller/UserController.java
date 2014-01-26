package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午2:57
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @RequestMapping("/checkUserId")
    public @ResponseBody String check(String userId) {
          return String.valueOf(userService.checkUserId(userId));
    }

    @RequestMapping("/password/check")
    public @ResponseBody String checkPassword(String userId, String password) {
          return String.valueOf(userService.checkPassword(userId, password));
    }

    @RequestMapping(value = "/password/modify", method = RequestMethod.POST)
    public String modifyPassword(String userId, String password) {
        userService.modifyPassword(userId, password);
        return redirectTo("result");
    }

    @RequestMapping(value = "/password/result", method = RequestMethod.GET)
    public String modifyPasswordResult() {
        return jsp("/manage/passwordResult");
    }

    @RequestMapping(value = "/password/modify/UI", method = RequestMethod.GET)
    public String modifyPasswordUI() {

        return jsp("/manage/password");
    }
}
