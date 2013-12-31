package com.hyrt.saic.dao;

import com.hyrt.saic.bean.order.OrderDetail;

import java.util.List;
import java.util.Map;

public interface OrderDetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderDetail record);

    int updateByPrimaryKey(OrderDetail record);

    List selectByOrderId(Map params);

    int selectCount(Map params);
}