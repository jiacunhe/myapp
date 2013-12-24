package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserChagePackage;

public interface UserChagePackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserChagePackage record);

    int insertSelective(UserChagePackage record);

    UserChagePackage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserChagePackage record);

    int updateByPrimaryKey(UserChagePackage record);
}