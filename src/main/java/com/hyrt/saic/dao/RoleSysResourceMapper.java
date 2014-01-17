package com.hyrt.saic.dao;

import com.hyrt.saic.bean.RoleSysResource;
import com.hyrt.saic.bean.SysResource;

import java.util.HashMap;
import java.util.List;

public interface RoleSysResourceMapper  {

    int deleteByRoleReaourceids(HashMap<String, String> hashMap);

    int insertListRoelRoleSysResource(List<RoleSysResource> roleSysResources);

    List<SysResource> getResoureByUserRoleids(String roleids);

}