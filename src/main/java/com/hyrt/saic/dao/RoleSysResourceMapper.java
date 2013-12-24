package com.hyrt.saic.dao;

import com.hyrt.saic.bean.RoleSysResource;

public interface RoleSysResourceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleSysResource record);

    int insertSelective(RoleSysResource record);

    RoleSysResource selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleSysResource record);

    int updateByPrimaryKey(RoleSysResource record);
}