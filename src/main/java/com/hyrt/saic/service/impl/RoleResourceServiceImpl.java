package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.RoleSysResource;
import com.hyrt.saic.bean.SysResource;
import com.hyrt.saic.dao.RoleMapper;
import com.hyrt.saic.dao.RoleSysResourceMapper;
import com.hyrt.saic.dao.SysResoureMapper;
import com.hyrt.saic.service.RoleResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hyrt001
 * Date: 14-1-3
 * Time: 上午11:12
 * To change this template use File | Settings | File Templates.
 */
@Service("roleResourceService")
public class RoleResourceServiceImpl implements RoleResourceService {

    @Autowired
    RoleMapper roleMapper;
    @Autowired
    SysResoureMapper sysResoureMapper;
    @Autowired
    RoleSysResourceMapper roleSysResourceMapper;

    @Override
    public List getAllRoles() {
        List<Role> roles = roleMapper.selectAllRoles();
        return roles;
    }

    @Override
    public Role selectByPrimaryKey(Integer roleid) {
        Role role = roleMapper.selectByPrimaryKey(roleid);
        return role;
    }

    @Override
    public List getAllSysResource() {
        List<SysResource> sysResources = sysResoureMapper.getAllSysResource();
        return sysResources;
    }

    @Override
    public List getAllSysResourcewithoutTree() {
        return sysResoureMapper.getAllSysResourcewithoutTree();
    }

    @Override
    @Transactional
    public void updateByPrimaryKeySelective(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    @Transactional
    public void deleteResoureByRole(HashMap<String, String> hashMap) {
        roleSysResourceMapper.deleteByRoleReaourceids(hashMap);
    }

    @Override
    @Transactional
    public void insertResoureByRoel(List<RoleSysResource> roleSysResources) {
        roleSysResourceMapper.insertListRoelRoleSysResource(roleSysResources);
    }

    @Override
    @Transactional
    public void deleteRole(String roleids) {
        roleMapper.deleteByroleids(roleids);
    }

    @Override
    @Transactional
    public void inserRole(Role role, String[] roleresource) {
        roleMapper.insertid(role);
        List<RoleSysResource> roleSysResources = new ArrayList<RoleSysResource>();
        if (roleresource != null && roleresource.length > 0) {
            for (String resourceid : roleresource) {
                RoleSysResource rsresource = new RoleSysResource();
                rsresource.setRoleId(role.getId());
                rsresource.setResourceId(Integer.valueOf(resourceid));
                roleSysResources.add(rsresource);
            }
            roleSysResourceMapper.insertListRoelRoleSysResource(roleSysResources);
        }
    }

    @Override
    public List getChiledResoureBypid(Integer pid) {
        return sysResoureMapper.getChildSysResource(pid);
    }

    @Override
    public List getRoleNamebyString(String rolename) {
        return roleMapper.getByRolename(rolename);
    }

    @Override
    public List getResoureByUserRoleids(String roleids) {
        return roleSysResourceMapper.getResoureByUserRoleids(roleids);
    }

    @Override
    public List getRolesByuserid(String userid) {
        return roleMapper.getRolesByuserid(userid);
    }


}
