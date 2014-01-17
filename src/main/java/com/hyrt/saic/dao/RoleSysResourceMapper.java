package com.hyrt.saic.dao;

import com.hyrt.saic.bean.RoleSysResource;
import com.hyrt.saic.bean.SysResource;

import java.util.HashMap;
import java.util.List;

public interface RoleSysResourceMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByRoleReaourceids(HashMap<String, String> hashMap);

    int insertListRoelRoleSysResource(List<RoleSysResource> roleSysResources);

    int insert(RoleSysResource record);

    int insertSelective(RoleSysResource record);

    RoleSysResource selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleSysResource record);

    int updateByPrimaryKey(RoleSysResource record);

    List<SysResource> getResoureByUserRoleids(String roleids);

}