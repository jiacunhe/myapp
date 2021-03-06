package com.hyrt.saic.controller;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.Config;
import com.hyrt.saic.validator.UserValidator;
import me.sfce.library.mybatis.util.Page;
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
import java.util.Date;
import java.util.List;

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
    @Autowired
    private UserOperationService operationService;


    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String loginUI(@ModelAttribute User user, HttpServletRequest request) {
        if (request.getSession().getAttribute(Config.USER) != null) {
            return jsp("main");
        }
        return jsp("login");
    }

    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public String managerLoginUI(HttpServletRequest request) {
        if (request.getSession().getAttribute(Config.MANAGE) != null) {
            return jsp("manage/home");
        }

        return jsp("manage/login");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return redirectTo("/logout.jsp");
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String goHome() {
        return redirectTo("/welcome.jsp");
    }
    @RequestMapping(value = "/manage/logout", method = RequestMethod.GET)
    public String manageLogout(HttpSession session) {
        session.invalidate();
        return redirectTo("/logout.jsp?manage=true");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Validated User user, BindingResult result, HttpServletRequest request) {
        if (result.hasFieldErrors()) {
            return jsp("login");
        }
        if (userService.login(request, user.getUserId(), user.getPassword())) {
            UserOperation operation = new UserOperation(user.getUserId(), "/login", "登录前台系统", new Date(), request.getRemoteAddr());
            operationService.save(operation);
            return jsp("main");
        } else {
            request.setAttribute("error", "密码错误");
            return jsp("login");
        }
    }

    @RequestMapping(value = "/manage/login", method = RequestMethod.POST)
    public String manageLogin(@Validated User user, BindingResult result, HttpServletRequest request) {
        if (result.hasFieldErrors()) {
            return jsp("manage/login");
        }
        if (userService.loginManage(request, user.getUserId(), user.getPassword())) {
            UserOperation operation = new UserOperation(user.getUserId(), "/manage/login", "登录后台系统", new Date(), request.getRemoteAddr());
            operationService.save(operation);
            return redirectTo("");
        } else {
            request.setAttribute("userId", user.getUserId());
            request.setAttribute("error", "账号与密码不匹配，请核对后重试");
            return jsp("manage/login");
        }
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new UserValidator());
    }


    @RequestMapping("/index")
    public String index() {
        return jsp("manage/index");
    }

    @RequestMapping(value = "/noPrivilege", method = RequestMethod.GET)
    public String logintest(HttpServletRequest request) {
            return jsp("/manage/remindpermissions");
    }
    @RequestMapping("/manage/userOperation")
    public String userOperation(String operationTimeStart,String operationTimeEnd,String userId, Integer pageNo,HttpServletRequest request){

        if (null == pageNo) {
            pageNo = 1;
        }

        Page page = new Page();
        if(operationTimeStart!=null&&!operationTimeStart.equals("")){
            page.put("operationTimeStart",operationTimeStart);
            request.setAttribute("operationTimeStart",operationTimeStart);
        }
        if(operationTimeEnd!=null&&!operationTimeEnd.equals("")){
            page.put("operationTimeEnd",operationTimeEnd);
            request.setAttribute("operationTimeEnd",operationTimeEnd);
        }
        if (userId!=null&&!userId.equals("")){
            page.put("userId",userId);
            request.setAttribute("userId",userId);
        }
        page.setPageNo(pageNo);
        List userOperationList=operationService.getAllListDescByDate(page);
        page.setResults(userOperationList);
        request.setAttribute("page", page);
        UserOperation operation = new UserOperation(((User)request.getSession().getAttribute(Config.MANAGE)).getUserId(), "/manage/userOperation", "操作日志查询", new Date(), request.getRemoteAddr());
        operationService.save(operation);
        return jsp("/userOperation/userOperationList");
    }
    @RequestMapping("/questions")
    public String getQuestion(){

        return jsp("/qaAndzx/questions");
    }
    @RequestMapping("/questionOnline")
    public String getQandAOnline(){

        return jsp("/qaAndzx/leaveMessage");
    }
    @RequestMapping("/iframeTop")
    public String getIframeTop(){

        return jsp("/iframe/top");
    }
    @RequestMapping("/iframeLeft")
    public String getIframeLeft(){

        return jsp("/iframe/left");
    }
    @RequestMapping("/iframeBottom")
    public String getIframeBottom(){

        return jsp("/iframe/bottom");
    }
    @RequestMapping("/htIframeTop")
    public String getHtIframeTop(){

        return jsp("/iframe/ht_top");
    }
    @RequestMapping("/htIframeLeft")
    public String getHtIframeLeft(){

        return jsp("/iframe/ht_left");
    }
    @RequestMapping("/htIframeBottom")
    public String getHtIframeBottom(){

        return jsp("/iframe/ht_bottom");
    }
}
