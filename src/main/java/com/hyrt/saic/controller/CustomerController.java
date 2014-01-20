package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Customer;
import com.hyrt.saic.bean.Manager;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.controller.formbean.user.CustomerQueryForm;
import com.hyrt.saic.service.RoleService;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.Config;
import com.hyrt.saic.util.enums.PaymentRule;
import com.hyrt.saic.util.enums.UserStatus;
import me.sfce.library.mybatis.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-6
 * Time: 下午12:03
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    UserOperationService userOperationService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addCustomer(Customer customer, HttpServletRequest request) {
        /*if (customer.getPaymentRule() == null) {
            throw new PageError("付费规则不能为空");
        }
        if (StringUtils.isEmpty(customer.getUserId())) {
            throw new PageError("用户名不能为空");
        }
        if (StringUtils.isEmpty(customer.getPassword())) {
            throw new PageError("密码不能为空");
        }*/
        userService.addCustomer(customer, request);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/add", "添加客户:" + customer.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list");
    }

    @RequestMapping(value = "/add/UI", method = RequestMethod.GET)
    public String addCustomerUI(HttpServletRequest request) {
        Object user = request.getSession().getAttribute(Config.MANAGE);
        if (user instanceof Manager) {
            request.setAttribute("paymentRules", PaymentRule.values());
        } else {
            request.setAttribute("paymentRules", new PaymentRule[]{PaymentRule.PAY_BEFORE});
        }
        return jsp("customer/add");
    }

    @RequestMapping(value = "/modify/UI", method = RequestMethod.GET)
    public String modifyCustomerUI(String _userId, HttpServletRequest request) {
        User user = userService.getById(_userId);
        request.setAttribute("customer", user);
        request.setAttribute("paymentRules", PaymentRule.values());
        CustomerQueryForm form = new CustomerQueryForm();
        form.setUserId(request.getParameter("userId"));
        form.setUsername(request.getParameter("username"));
        form.setCondition(request.getParameter("condition"));
        form.setCreatorId(request.getParameter("creatorId"));
        form.setEndTime(request.getParameter("endTime"));
        form.setStartTime(request.getParameter("startTime"));
        form.setPaymentRule(request.getParameter("paymentRule"));
        form.setStatus(request.getParameter("status"));
        form.setTelephone(request.getParameter("telephone"));
        request.setAttribute("form", form);
        request.setAttribute("queryType", request.getParameter("queryType"));
        return jsp("customer/edit");
    }

    @RequestMapping(value = "/show/UI", method = RequestMethod.GET)
    public String show(String _userId, HttpServletRequest request) {
        User user = userService.getById(_userId);
        request.setAttribute("customer", user);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/show/UI", "查看客户:" + _userId, new Date(), request.getRemoteAddr()));
        return jsp("customer/show");
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyCustomer(Customer customer, HttpServletRequest request) {
        userService.update(customer);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/modify", "修改客户:" + customer.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list?userId=" + request.getParameter("formUserId")
                + "&username=" + request.getParameter("formUsername")
                + "&condition=" + request.getParameter("formCondition")
                + "&creatorId=" + request.getParameter("formCreatorId")
                + "&endTime=" + request.getParameter("formEndTime")
                + "&startTime=" + request.getParameter("formStartTime")
                + "&paymentRule=" + request.getParameter("formPaymentRule")
                + "&status=" + request.getParameter("formStatus")
                + "&telephone=" + request.getParameter("formTelephone")
                + "&queryType=" + request.getParameter("formQueryType")
        );
    }

    @RequestMapping(value = "/lock")
    public String lock(String _userId, HttpServletRequest request) {
        User user = new User();
        user.setUserId(_userId);
        userService.lock(user);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/lock", "锁定客户:" + _userId, new Date(), request.getRemoteAddr()));
        return redirectTo("list?userId=" + request.getParameter("userId")
                + "&username=" + request.getParameter("username")
                + "&condition=" + request.getParameter("condition")
                + "&creatorId=" + request.getParameter("creatorId")
                + "&endTime=" + request.getParameter("endTime")
                + "&startTime=" + request.getParameter("startTime")
                + "&paymentRule=" + request.getParameter("paymentRule")
                + "&status=" + request.getParameter("status")
                + "&telephone=" + request.getParameter("telephone")
                + "&queryType=" + request.getParameter("queryType")
        );
    }

    @RequestMapping(value = "/unlock")
    public String unlock(String _userId, HttpServletRequest request) {
        User user = new User();
        user.setUserId(_userId);
        userService.unlock(user);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/unlock", "解锁客户:" + _userId, new Date(), request.getRemoteAddr()));
        return redirectTo("list?userId=" + request.getParameter("userId")
                + "&username=" + request.getParameter("username")
                + "&condition=" + request.getParameter("condition")
                + "&creatorId=" + request.getParameter("creatorId")
                + "&endTime=" + request.getParameter("endTime")
                + "&startTime=" + request.getParameter("startTime")
                + "&paymentRule=" + request.getParameter("paymentRule")
                + "&status=" + request.getParameter("status")
                + "&telephone=" + request.getParameter("telephone")
                + "&queryType=" + request.getParameter("queryType")
        );
    }

    @RequestMapping(value = "/delete")
    public String delete(String _userId, HttpServletRequest request) {
        userService.delete(_userId);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/delete", "删除客户:" + _userId, new Date(), request.getRemoteAddr()));
        return redirectTo("list?userId=" + request.getParameter("userId")
                + "&username=" + request.getParameter("username")
                + "&condition=" + request.getParameter("condition")
                + "&creatorId=" + request.getParameter("creatorId")
                + "&endTime=" + request.getParameter("endTime")
                + "&startTime=" + request.getParameter("startTime")
                + "&paymentRule=" + request.getParameter("paymentRule")
                + "&status=" + request.getParameter("status")
                + "&telephone=" + request.getParameter("telephone")
                + "&queryType=" + request.getParameter("queryType")
        );
    }

    @RequestMapping(value = "/resetPassword")
    public String resetPassword(String _userId, HttpServletRequest request) {
        User user = new User();
        user.setUserId(_userId);
        userService.resetPassword(user);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/resetPassword", "重置客户:" + _userId + "的密码", new Date(), request.getRemoteAddr()));
        return redirectTo("list?userId=" + request.getParameter("userId")
                + "&username=" + request.getParameter("username")
                + "&condition=" + request.getParameter("condition")
                + "&creatorId=" + request.getParameter("creatorId")
                + "&endTime=" + request.getParameter("endTime")
                + "&startTime=" + request.getParameter("startTime")
                + "&paymentRule=" + request.getParameter("paymentRule")
                + "&status=" + request.getParameter("status")
                + "&telephone=" + request.getParameter("telephone")
                + "&queryType=" + request.getParameter("queryType")
        );
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(CustomerQueryForm form, Integer pageNo, Boolean queryType, HttpServletRequest request) {
        if (form.getUsername() != null) {
            try {
                form.setUsername(new String(form.getUsername().getBytes("ISO8859-1"), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        if (!StringUtils.isEmpty(form.getUserId())) {
            form.setCondition(form.getUserId());
        }
        if (!StringUtils.isEmpty(form.getUsername())) {
            form.setCondition(form.getUsername());
        }
        Page page = new Page();
        page.addBean(form);
        if (null == pageNo) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        List customers = userService.queryCustomersByCondition(page);
        page.setResults(customers);
        request.setAttribute("page", page);
        request.setAttribute("form", form);
        request.setAttribute("paymentRules", PaymentRule.values());
        Map<String, String> statusMap = new HashMap<>();
        for (UserStatus status : UserStatus.values()) {
            statusMap.put(status.toString(), status.getDesc());
        }
        request.setAttribute("statusMap", statusMap);
        if (null == queryType) queryType = false;
        request.setAttribute("queryType", queryType);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/customer/list", "访问客户管理", new Date(), request.getRemoteAddr()));
        return (jsp("customer/list"));
    }
}
