package com.hyrt.saic.dao;

import com.hyrt.saic.bean.order.OrderType;

import java.util.List;

public interface OrderTypeMapper {

    OrderType selectByPrimaryKey(Integer id);

    public List selectAll();
}