package com.hyrt.saic.dao;

import com.hyrt.saic.bean.ChargePackageDetaill;
import com.hyrt.saic.bean.ChargePackageDetaillKey;

public interface ChargePackageDetaillMapper {
    int deleteByPrimaryKey(ChargePackageDetaillKey key);

    int insert(ChargePackageDetaill record);

    int insertSelective(ChargePackageDetaill record);

    ChargePackageDetaill selectByPrimaryKey(ChargePackageDetaillKey key);

    int updateByPrimaryKeySelective(ChargePackageDetaill record);

    int updateByPrimaryKey(ChargePackageDetaill record);
}