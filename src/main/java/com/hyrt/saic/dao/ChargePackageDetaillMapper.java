package com.hyrt.saic.dao;

import com.hyrt.saic.bean.ChargePackageDetaill;

public interface ChargePackageDetaillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChargePackageDetaill record);

    int insertSelective(ChargePackageDetaill record);

    ChargePackageDetaill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ChargePackageDetaill record);

    int updateByPrimaryKey(ChargePackageDetaill record);


    void deleteByPackageId(int packageId);

    void deleteByPackageUser(String userId);
}