package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserApplyPackage;

import java.util.List;

import java.util.Map;

public interface UserApplyPackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserApplyPackage record);

    int insertSelective(UserApplyPackage record);

    UserApplyPackage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserApplyPackage record);

    int updateByPrimaryKey(UserApplyPackage record);


    List select(Map map);

    List selective(Map params);

    Integer selectiveCount(Map params);

    void updateAllotPackageQuantity(Map params);
}