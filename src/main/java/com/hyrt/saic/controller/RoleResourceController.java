package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.RoleSysResource;
import com.hyrt.saic.bean.SysResoure;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.service.RoleResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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
            List<SysResoure> allSysResoure = roleResourceService.getAllSysResource();
            for (SysResoure systop : allSysResoure) {
                List<SysResoure> syslevel2 = systop.getChildren();
                for (SysResoure sysroesourcelevel2 : syslevel2) {
                    List<SysResoure> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                    sysroesourcelevel2.setChildren(syslevel3);
                }
            }
            // request.setAttribute("allSysResoure",allSysResoure);
            request.setAttribute("topList", allSysResoure);
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
            List<SysResoure> allSysResoure = roleResourceService.getAllSysResource();
            for (SysResoure systop : allSysResoure) {
                List<SysResoure> syslevel2 = systop.getChildren();
                for (SysResoure sysroesourcelevel2 : syslevel2) {
                    List<SysResoure> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                    sysroesourcelevel2.setChildren(syslevel3);
                }
            }
            // request.setAttribute("allSysResoure",allSysResoure);
            request.setAttribute("topList", allSysResoure);
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
            List<SysResoure> sysResoureList = role.getResources(); //资源总数
            List<Integer> sysResoureAllId = new ArrayList<Integer>();     //资源id总数
            List<Integer> sysResouredeleteid = new ArrayList<Integer>();  //需要删除的id集合

            for (SysResoure sysResoure : sysResoureList) {
                sysResoureAllId.add(sysResoure.getId());
                sysResouredeleteid.add(sysResoure.getId());
            }
            List<String> contentResourceId = new ArrayList<String>();          //拥有的id集合
            List<String> addResourceId = new ArrayList<String>();       //需要新增的id集合
            Boolean isContentId = false;
            if (resourceIds != null) {
                for (String rsId : resourceIds) {
                    if (sysResoureList.size() > 0) {
                        for (SysResoure sysResoure : sysResoureList) {
                            isContentId = false;
                            //查找出不同的数据  区分出 新增的id值
                            if (sysResoure.getId() == Integer.valueOf(rsId)) {
                                isContentId = true;
                                break;
                            }
                        }
                        if (isContentId)
                            contentResourceId.add(rsId);
                        else
                            addResourceId.add(rsId);
                    } else if (sysResoureList.size() == 0) {
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
            if (addResourceId.size() > 0) {
                //处理新增资源权限
                List<RoleSysResource> roleSysResources = new ArrayList<RoleSysResource>();
                for (String addrsid : addResourceId) {
                    RoleSysResource addRoleSR = new RoleSysResource();
                    addRoleSR.setRoleId(Integer.valueOf(roleid));
                    addRoleSR.setResourceId(Integer.valueOf(addrsid));
                    addRoleSR.setRemark(null);
                    roleSysResources.add(addRoleSR);
                }
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
            }
        }
        request.setAttribute("successMassage", "success");
        List<Role> roleList = roleResourceService.getAllRoles();
        request.setAttribute("roleList", roleList);
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
        List<SysResoure> allSysResoure = roleResourceService.getAllSysResource();
        for (SysResoure systop : allSysResoure) {
            List<SysResoure> syslevel2 = systop.getChildren();
            for (SysResoure sysroesourcelevel2 : syslevel2) {
                List<SysResoure> syslevel3 = roleResourceService.getChiledResoureBypid(sysroesourcelevel2.getId());
                sysroesourcelevel2.setChildren(syslevel3);
            }
        }
        // request.setAttribute("allSysResoure",allSysResoure);
        request.setAttribute("topList", allSysResoure);
       /* List<SysResoure> allsysresoure=roleResourceService.getAllSysResource();
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
