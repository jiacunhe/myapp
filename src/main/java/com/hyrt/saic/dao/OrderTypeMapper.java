package com.hyrt.saic.dao;

import com.hyrt.saic.bean.order.OrderType;

import java.util.List;

public interface OrderTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderType record);

    int insertSelective(OrderType record);

    OrderType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderType record);

    int updateByPrimaryKey(OrderType record);

    public List selectAll();
}