package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Manager;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.controller.formbean.user.ManagerQueryForm;
import com.hyrt.saic.service.RoleService;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.service.UserService;
import com.hyrt.saic.util.Config;
import com.hyrt.saic.util.enums.UserStatus;
import me.sfce.library.mybatis.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.net.URLEncoder;
import java.net.URLDecoder;


/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-6
 * Time: 下午12:03
 */
@Controller
@RequestMapping("/manager")
public class ManagerController extends BaseController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    private UserOperationService userOperationService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addManager(Manager manager, String roleIds, HttpServletRequest request) {
        userService.addManager(manager, request, roleIds);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/add", "添加用户" + manager.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list");
    }

    @RequestMapping(value = "/add/UI", method = RequestMethod.GET)
    public String addManagerUI(HttpServletRequest request) {
        request.setAttribute("command", new Manager());
        Map<Integer, String> roleMap = roleService.getRoleMap();
        request.setAttribute("roleMap", roleMap);
        return jsp("manager/add");
    }

    @RequestMapping(value = "/modify/UI", method = RequestMethod.GET)
    public String modifyManagerUI(Manager manager, HttpServletRequest request) {
        User user = userService.getById(manager.getUserId());
        request.setAttribute("command", user);
        request.setAttribute("roleMap", roleService.getRoleMap());
        request.setAttribute("roleIds", userService.getRoleIds(manager));
        request.setAttribute("formUserId", request.getParameter("formUserId"));
        request.setAttribute("formUsername", request.getParameter("formUsername"));
        request.setAttribute("formRoleId", request.getParameter("formRoleId"));
        request.setAttribute("formStatus", request.getParameter("formStatus"));

        return jsp("manager/edit");
    }

    @RequestMapping(value = "/show/UI", method = RequestMethod.GET)
    public String show(Manager manager, HttpServletRequest request) {
        User user = userService.getById(manager.getUserId());
        request.setAttribute("command", user);
        request.setAttribute("roleMap", roleService.getRoleMap());
        request.setAttribute("roleIds", userService.getRoleIds(manager));
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/show/UI", "查看用户" + manager.getUserId(), new Date(), request.getRemoteAddr()));
        return jsp("manager/show");
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyManager(Manager manager, String roleIds, HttpServletRequest request) {
        userService.modifyManager(manager, roleIds);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/modify", "修改用户" + manager.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list?formUserId=" + request.getParameter("formUserId")
                + "&formUsername=" + request.getParameter("formUsername")
                + "&formRoleId=" + request.getParameter("formRoleId")
                + "&formStatus=" + request.getParameter("formStatus")
        );
    }

    @RequestMapping(value = "/lock")
    public String lock(Manager manager, HttpServletRequest request) {
        userService.lock(manager);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/lock", "锁定用户" + manager.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list?formUserId=" + request.getParameter("formUserId")
                + "&formUsername=" + request.getParameter("formUsername")
                + "&formRoleId=" + request.getParameter("formRoleId")
                + "&formStatus=" + request.getParameter("formStatus")
        );
    }

    @RequestMapping(value = "/unlock")
    public String unlock(Manager manager, HttpServletRequest request) {
        userService.unlock(manager);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/unlock", "解锁用户" + manager.getUserId(), new Date(), request.getRemoteAddr()));
        return redirectTo("list?formUserId=" + request.getParameter("formUserId")
                + "&formUsername=" + request.getParameter("formUsername")
                + "&formRoleId=" + request.getParameter("formRoleId")
                + "&formStatus=" + request.getParameter("formStatus")
        );
    }

    @RequestMapping(value = "/resetPassword")
    public String resetPassword(Manager manager, HttpServletRequest request) {
        userService.resetPassword(manager);
        User managerName= userService.getById(manager.getUserId());
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/resetPassword", "重置用户" + manager.getUserId() + "的密码", new Date(), request.getRemoteAddr()));
        String passwordDefault="";
        if (manager instanceof Manager) {
            passwordDefault=  Config.PASSWORD_MANAGER_DEFAULT;
        } else {
            passwordDefault= Config.PASSWORD_CUSTOMER_DEFAULT;
        }
        String message="";
        try {
             message =URLEncoder.encode(managerName.getUsername()+"的帐号密码重置为"+passwordDefault,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return redirectTo("list?formUserId=" + request.getParameter("formUserId")
                + "&formUsername=" + request.getParameter("formUsername")
                + "&formRoleId=" + request.getParameter("formRoleId")
                + "&formStatus=" + request.getParameter("formStatus")
                +"&manageResetPassword="+message
        );
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(String formUserId, String formUsername, Integer formRoleId, String formStatus,Integer pageNo, HttpServletRequest request) {
        if (formUsername != null) {
            try {
                formUsername = new String(formUsername.getBytes("ISO8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        Page page = new Page();
        page.put("username", formUsername);
        page.put("userId", formUserId);
        page.put("roleId", formRoleId);
        page.put("status", formStatus);
        if (null == pageNo) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        List managers = userService.queryManagersByCondition(page);
        page.setResults(managers);
        request.setAttribute("page", page);
        ManagerQueryForm command = new ManagerQueryForm(formUserId, formUsername, formRoleId, formStatus);
        request.setAttribute("command", command);
        Map<Integer, String> roleMap = roleService.getRoleMap();
        request.setAttribute("roleMap", roleMap);
        Map<String, String> statusMap = new HashMap<>();
        for (UserStatus status : UserStatus.values()) {
            if(status!=UserStatus.DELETED)
            statusMap.put(status.toString(), status.getDesc());
        }
        request.setAttribute("statusMap", statusMap);
        User operator = (User) request.getSession().getAttribute(Config.MANAGE);
        userOperationService.save(new UserOperation(operator.getUserId(), "/manager/list", "访问用户模块", new Date(), request.getRemoteAddr()));
        return (jsp("manager/list"));
    }
}
