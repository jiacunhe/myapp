package com.hyrt.saic.service;

import com.hyrt.saic.bean.order.OrderDetail;
import com.hyrt.saic.bean.order.OrderInfo;
import com.hyrt.saic.bean.order.OrderType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 下午2:20
 * To change this template use File | Settings | File Templates.
 */
public interface OrderService {


//    public void commitOrder(Order order,List detail);

      public List<OrderType> selectOrderType();

      public Map selectOrder(HashMap map);

      public OrderInfo selectOrderInfoByOrderId(String id);

      public Map selectByOrderId(Map params);

      public Map selectGroupInfo(Long id);

      public List selectPersonInfo(Long id);

      public Integer selectForPermissionView(Map params);

}
