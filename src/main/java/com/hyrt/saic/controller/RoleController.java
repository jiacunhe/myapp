package com.hyrt.saic.controller;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 下午4:40
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/create")
    public String create(Role role, HttpServletRequest request, HttpServletResponse response) {
        role.setRemark("测试");
        role.setRoleName("超级管理员");
        roleService.save(role);
        return null;
    }

    @RequestMapping(value = "/update")
    public String update(Role role, HttpServletRequest request, HttpServletResponse response) {
        role.setRemark("测试1");
        role.setRoleName("");
        roleService.update(role);
        return null;
    }

    @RequestMapping(value = "/delete")
    public String delete(Role role, HttpServletRequest request, HttpServletResponse response) {
        roleService.delete(role.getId());
        return null;
    }

    @RequestMapping(value = "/getById")
    public String getById(Role role, HttpServletRequest request, HttpServletResponse response) {
        Role role1 = roleService.getById(role.getId());

        return null;
    }
    @RequestMapping(value = "/list")
    public String list(Role role, HttpServletRequest request, HttpServletResponse response) {
        List<Role> roles = roleService.listAll();

        return null;
    }

}
