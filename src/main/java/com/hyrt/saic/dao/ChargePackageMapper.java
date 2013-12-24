package com.hyrt.saic.dao;

import com.hyrt.saic.bean.ChargePackage;

public interface ChargePackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChargePackage record);

    int insertSelective(ChargePackage record);

    ChargePackage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ChargePackage record);

    int updateByPrimaryKey(ChargePackage record);
}