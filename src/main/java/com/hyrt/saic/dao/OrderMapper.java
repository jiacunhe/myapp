package com.hyrt.saic.dao;

import com.hyrt.saic.bean.order.Order;
import com.hyrt.saic.bean.order.OrderInfo;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(String id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKeyWithBLOBs(Order record);

    int updateByPrimaryKey(Order record);

    List selectOrderInfo(Map params);

    int selectCount(Map params);

    Map selectOrderInfoByOrderId(String id);

    Integer selectForPermissionView(Map params);

}