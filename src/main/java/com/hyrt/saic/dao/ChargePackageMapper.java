package com.hyrt.saic.dao;

import com.hyrt.saic.bean.ChargePackage;

import java.util.List;
import java.util.Map;

public interface ChargePackageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChargePackage record);

    int insertSelective(ChargePackage record);

    ChargePackage selectByPrimaryKey(Integer id);
    ChargePackage selectByPrimaryKeyAndStatus(Integer id);

    int updateByPrimaryKeySelective(ChargePackage record);

    int updateByPrimaryKey(ChargePackage record);


    Integer countNum(ChargePackage c);

    Integer countNumUser(ChargePackage c);

    List select(Map map);

    List selectUser(Map map);

    Map selectById(int id);

    void updateStatusById(ChargePackage c);

    int lastInsertId();
}