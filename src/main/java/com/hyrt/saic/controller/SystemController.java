package com.hyrt.saic.controller;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-2
 * Time: 下午2:41
 */
@Controller
public class SystemController extends BaseController {
    @Autowired
    private UserService userService;

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
    public String loginUI(@ModelAttribute User user) {
        return jsp("login");
    }

    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String managerLoginUI() {
        return jsp("manage/login");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return forwardTo("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Validated User user, BindingResult result, HttpServletRequest request) {
        if (result.hasFieldErrors()) {
            return jsp("login");
        }
        if (userService.login(request, user.getUserId(), user.getPassword())) {
            return jsp("main");
        } else {
            return "";
        }
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new UserValidator());
    }

    public String home() {
        return jsp("home");
    }


}
