package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.bean.*;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.RoleResourceService;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hyrt001
 * Date: 14-1-3
 * Time: 上午11:10
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("/role")
public class RoleResourceController {
    @Autowired
    CommonService commonService;
    @Autowired
    RoleResourceService roleResourceService;
    @Autowired
    private UserOperationService operationService;

    @RequestMapping("/manager")
    public String getRoleList(HttpServletRequest request, HttpServletResponse resposne) {
        //取出角色列表
        List<Role> roleList = roleResourceService.getAllRoles();
        request.setAttribute("roleList", roleList);
        return "/role/rolelist.jsp";
    }

    @RequestMapping("/editup/UI")
    public String getEditRoleDetails(String[] roleid, HttpServletRequest request) {
        if (roleid != null && !"".equals(roleid) && roleid.length > 0) {
            Role role = roleResourceService.selectByPrimaryKey(Integer.valueOf(roleid[0]));
            request.setAttribute("role", role);
            //查出角色的可选资源列表
            List<SysResource> allSysResource = roleResourceService.getAllSysResource();
            for (SysResource systop : allSysResource) {
                List<SysResource> syslevel2 = systop.getChildren();
                for (SysResource sysroesourcelevel2 : syslevel2) {
                    List<SysResource> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                    sysroesourcelevel2.setChildren(syslevel3);
                }
            }
            // 权限资源参数
            request.setAttribute("topList", allSysResource);
        } else
            request.setAttribute("eorroMassage", "角色id不正确");
        return "role/roleeditpage.jsp";
    }

    @RequestMapping("/getajaxroledetail")
    public String getAjaxEditRoleDetails(String roleid, HttpServletRequest request) {
        if (roleid != null && !"".equals(roleid)) {
            Role role = roleResourceService.selectByPrimaryKey(Integer.valueOf(roleid));
            request.setAttribute("role", role);
            //查出角色的可选资源列表
            List<SysResource> allSysResource = roleResourceService.getAllSysResource();
            for (SysResource systop : allSysResource) {
                List<SysResource> syslevel2 = systop.getChildren();
                for (SysResource sysroesourcelevel2 : syslevel2) {
                    List<SysResource> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                    sysroesourcelevel2.setChildren(syslevel3);
                }
            }
            // request.setAttribute("allSysResource",allSysResource);
            request.setAttribute("topList", allSysResource);
        } else
            request.setAttribute("eorroMassage", "角色id不正确");
        return "/role/getajaxroleresource.jsp";
    }

    @RequestMapping("/editup")
    public String updateRoleDetails(String roleid, String[] resourceIds, String rolename, String rolermark, HttpServletRequest request, HttpServletResponse resposne) {
        if (roleid != null && !"".equals(roleid)) {
            Role role = roleResourceService.selectByPrimaryKey(Integer.valueOf(roleid));
            role.setRoleName(rolename);
            role.setRemark(rolermark);
            try {
                roleResourceService.updateByPrimaryKeySelective(role);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //处理资源关联表
            List<SysResource> sysResourceList = role.getResources(); //资源总数
            List<Integer> sysResoureAllId = new ArrayList<Integer>();     //资源id总数
            List<Integer> sysResouredeleteid = new ArrayList<Integer>();  //需要删除的id集合

            for (SysResource sysResource : sysResourceList) {
                sysResoureAllId.add(sysResource.getId());
                sysResouredeleteid.add(sysResource.getId());
            }
            List<String> contentResourceId = new ArrayList<String>();          //拥有的id集合
            List<String> addResourceId = new ArrayList<String>();       //需要新增的id集合
            Boolean isContentId = false;
            if (resourceIds != null) {
                for (String rsId : resourceIds) {
                    if (sysResourceList.size() > 0) {
                        for (SysResource sysResource : sysResourceList) {
                            isContentId = false;
                            //查找出不同的数据  区分出 新增的id值
                            if (sysResource.getId() == Integer.valueOf(rsId)) {
                                isContentId = true;
                                break;
                            }
                        }
                        if (isContentId)
                            contentResourceId.add(rsId);
                        else
                            addResourceId.add(rsId);
                    } else if (sysResourceList.size() == 0) {
                        addResourceId.add(rsId);
                    }
                }
            }
            if (contentResourceId.size() < sysResoureAllId.size()) {
                //区分出删除id
                if (contentResourceId.size() > 0) {
                    for (String contentRId : contentResourceId) {
                        if (sysResouredeleteid.contains(Integer.valueOf(contentRId)))
                            sysResouredeleteid.remove(Integer.valueOf(contentRId));
                    }
                }

            } else if (contentResourceId.size() == sysResoureAllId.size()) {
                sysResouredeleteid.clear();
            }
//            System.out.println(contentResourceId.size());
//            System.out.println(addResourceId.size());
//            System.out.println(sysResouredeleteid.size());
            StringBuffer sbLog = new StringBuffer();

            if (addResourceId.size() > 0) {
                sbLog.append(" 新增资源id{");
                //处理新增资源权限
                List<RoleSysResource> roleSysResources = new ArrayList<RoleSysResource>();
                for (String addrsid : addResourceId) {
                    RoleSysResource addRoleSR = new RoleSysResource();
                    addRoleSR.setRoleId(Integer.valueOf(roleid));
                    addRoleSR.setResourceId(Integer.valueOf(addrsid));
                    addRoleSR.setRemark(null);
                    roleSysResources.add(addRoleSR);
                    sbLog.append(addrsid + ",");

                }
                sbLog.append("} ");
                roleResourceService.insertResoureByRoel(roleSysResources);
            }
            if (sysResouredeleteid.size() > 0 && sysResouredeleteid.size() <= sysResoureAllId.size()) {

                // 处理删除资源权限
                HashMap<String, String> hashMap = new HashMap<>();
                hashMap.put("roleId", roleid);
                StringBuffer sbids = new StringBuffer();
                for (Integer deleId : sysResouredeleteid) {
                    sbids.append(String.valueOf(deleId));
                    sbids.append(",");
                }
                sbids.deleteCharAt(sbids.lastIndexOf(","));
                hashMap.put("resourceIds", sbids.toString());
                roleResourceService.deleteResoureByRole(hashMap);
                sbLog.append("删除资源id{");
                sbLog.append(sbids.toString());
                sbLog.append("}");
            }

            try {
                UserOperation operation = new UserOperation(((User) request.getSession().getAttribute(Config.MANAGE)).getUserId(), "/editup", "修改角色: " + role.getRoleName() +" 角色备注:"+rolermark+(sbLog.length()>0? " 的资源权限 " + sbLog.toString():""), new Date(), request.getRemoteAddr());
                operationService.save(operation);
            } catch (Exception e) {
                UserOperation operation = new UserOperation("未获取到用户id", "/editup", "修改角色: " + rolename +" 角色备注:"+rolermark+(sbLog.length()>0? " 的资源权限 " + sbLog.toString():""), new Date(), request.getRemoteAddr());
                operationService.save(operation);
                e.printStackTrace();
            }
        }
        request.setAttribute("successMassage", "success");
        List<Role> roleList = roleResourceService.getAllRoles();
        request.setAttribute("roleList", roleList);
        //角色更新日志信息

        return "redirect:../role/manager";
    }

    @RequestMapping("/deleterole")
    public String getDeleteRole(String[] roleid, HttpServletRequest request) {
        if (roleid != null && !roleid.equals("") && roleid.length > 0) {
            StringBuffer sb = new StringBuffer();
            for (String rid : roleid) {
                sb.append(rid);
                sb.append(",");
            }
            sb.deleteCharAt(sb.lastIndexOf(","));
            roleResourceService.deleteRole(sb.toString());
            //角色删除日志信息
            try {
                UserOperation operation = new UserOperation(((User) request.getSession().getAttribute(Config.MANAGE)).getUserId(), "/deleterole", "删除角色id{" + sb.toString() + "}", new Date(), request.getRemoteAddr());
                operationService.save(operation);
            } catch (Exception e) {
                UserOperation operation = new UserOperation("未获取到用户id", "/deleterole", "删除角色id{" + sb.toString() + "}", new Date(), request.getRemoteAddr());
                operationService.save(operation);
                e.printStackTrace();
            }

        } else
            request.setAttribute("successMassage", "id不存在");
        request.setAttribute("successMassage", "success");
        List<Role> roleList = roleResourceService.getAllRoles();
        request.setAttribute("roleList", roleList);

        return "redirect:../role/manager";
    }

    @RequestMapping("/insert/UI")
    public String getInsertRole(HttpServletRequest request) {
        //查出角色的可选资源列表
        List<SysResource> allSysResource = roleResourceService.getAllSysResource();
        for (SysResource systop : allSysResource) {
            List<SysResource> syslevel2 = systop.getChildren();
            for (SysResource sysroesourcelevel2 : syslevel2) {
                List<SysResource> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                sysroesourcelevel2.setChildren(syslevel3);
            }
        }
        // request.setAttribute("allSysResource",allSysResource);
        request.setAttribute("topList", allSysResource);
       /* List<SysResource> allsysresoure=roleResourceService.getAllSysResource();
        request.setAttribute("allsysresoure",allsysresoure);*/
        return "/role/roleinsert.jsp";
    }

    @RequestMapping("/insert")
    public String doInsertRole(String roleName, String[] resourceIds, String roleRemark, HttpServletRequest request) {
        Role role = new Role();
        role.setRoleName(roleName);
        role.setRemark(roleRemark);
        roleResourceService.inserRole(role, resourceIds);
        request.setAttribute("successMassage", "success");
        List<Role> roleList = roleResourceService.getAllRoles();
        request.setAttribute("roleList", roleList);
        StringBuffer sb=new StringBuffer();

        for(String rId:resourceIds){
            sb.append(rId);
            sb.append(",");
        }
        //角色删除日志信息
        try {
            UserOperation operation = new UserOperation(((User) request.getSession().getAttribute(Config.MANAGE)).getUserId(), "/insert", "添加角色名称:" + roleName + " 备注:" + roleRemark+" 角色资源{"+sb.toString()+"}", new Date(), request.getRemoteAddr());
            operationService.save(operation);

        } catch (Exception e) {
            UserOperation operation = new UserOperation("未获取到用户id", "/insert", "添加角色名称:" + roleName + " 备注:" + roleRemark+" 角色资源{"+sb.toString()+"}", new Date(), request.getRemoteAddr());
            operationService.save(operation);
            e.printStackTrace();
        }

        return "redirect:../role/manager";
    }

    @RequestMapping(value = "/ajaxrolenameexist", produces = {"application/json;charset=UTF-8"})
    public
    @ResponseBody
    String doCheckRoleNameExist(String roleName) {
        HashMap res = new HashMap();
        boolean exist = false;
        List roleList = roleResourceService.getRoleNamebyString(roleName);
        if (roleList.size() > 0)
            exist = true;
        res.put("rolenameexist", exist);
        return JSON.toJSONString(res);
    }
}
