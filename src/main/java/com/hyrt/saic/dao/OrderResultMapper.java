package com.hyrt.saic.dao;

import com.hyrt.saic.bean.OrderResult;

public interface OrderResultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderResult record);

    int insertSelective(OrderResult record);

    OrderResult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderResult record);

    int updateByPrimaryKeyWithBLOBs(OrderResult record);

    int updateByPrimaryKey(OrderResult record);
}