package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.enums.PaymentRule;
import com.hyrt.saic.util.enums.UserStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public String getById(String userId, HttpServletRequest request, HttpServletResponse response) {
        User user = userService.getById(userId);
        request.setAttribute(USER, user);
        return null;
    }

    @RequestMapping(value = "/customer/add", method = RequestMethod.POST)
    public String addCustomer(Customer customer, HttpServletRequest request, HttpServletResponse response) {
        customer.setUserId("test");
        customer.setPassword("11111");
        customer.setUsername("华源");
        customer.setRemark("remark");
        customer.setStatus(UserStatus.NORMAL);
        customer.setAddress("zhengzhou");
        customer.setCertificate("shenfenzheng");
        customer.setCertificateCode("410888198788880909");
        customer.setChild(false);
        customer.setEmail("123@123.com");
        customer.setLinkman("lisi");
        customer.setMobilePhone("037188888888");
        customer.setTelephone("13999999999");
        customer.setPaymentRule(PaymentRule.PAY_AFTER);
        customer.setTrade("ID");
        customer.setVocation("chengxuyuan");
        userService.addCustomer(customer, request);
        return jsp("customer/list");
    }

    @RequestMapping(value = "/modifyCustomer")
    public String modifyCustomer(Customer customer, HttpServletRequest request, HttpServletResponse response) {
        customer.setRemark("test");
        userService.update(customer);
        return null;
    }

    @RequestMapping(value = "/modifyType", method = RequestMethod.POST)
    public String modifyType(User user, HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    @RequestMapping(value = "/children", method = RequestMethod.POST)
    public String children(User user, HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

}
