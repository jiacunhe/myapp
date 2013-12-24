package com.hyrt.saic.dao;

import com.hyrt.saic.bean.BusinessType;

public interface BusinessTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BusinessType record);

    int insertSelective(BusinessType record);

    BusinessType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BusinessType record);

    int updateByPrimaryKey(BusinessType record);
}