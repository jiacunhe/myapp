package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserAssignPackage;

import java.util.List;
import java.util.Map;

public interface UserAssignPackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAssignPackage record);

    int insertSelective(UserAssignPackage record);

    UserAssignPackage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAssignPackage record);

    int updateByPrimaryKey(UserAssignPackage record);

    int selectiveCount(Map params);

    List selective(Map params);

    void allotStop(Map params);
}