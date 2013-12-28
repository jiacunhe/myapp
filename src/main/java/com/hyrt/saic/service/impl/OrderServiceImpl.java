package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.Order;
import com.hyrt.saic.bean.OrderDetail;
import com.hyrt.saic.dao.OrderDetailMapper;
import com.hyrt.saic.dao.OrderMapper;
import com.hyrt.saic.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 下午2:24
 * To change this template use File | Settings | File Templates.
 */
@Service
public class OrderServiceImpl implements OrderService {

/*    @Autowired
    private OrderMapper orderMapper;
    private OrderDetailMapper orderDetailMapper;

    @Override
    @Transactional
    public void commitOrder(Order order, List<OrderDetail> list) {

          orderMapper.insertSelective(order);
          int id = orderMapper.selectLastInsertId();

          for(int i=0;i<list.size();i++){

                OrderDetail  orderDetail = list.get(i);
               orderDetail.setOrderId(id);
          }

    }*/
}
