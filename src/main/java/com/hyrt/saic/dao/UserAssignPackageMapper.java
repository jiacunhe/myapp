package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserAssignPackage;

public interface UserAssignPackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAssignPackage record);

    int insertSelective(UserAssignPackage record);

    UserAssignPackage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAssignPackage record);

    int updateByPrimaryKey(UserAssignPackage record);
}