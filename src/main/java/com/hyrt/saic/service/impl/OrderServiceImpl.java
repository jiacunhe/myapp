package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.GroupInfo;
import com.hyrt.saic.bean.order.OrderDetail;
import com.hyrt.saic.bean.order.OrderInfo;
import com.hyrt.saic.bean.order.OrderType;
import com.hyrt.saic.dao.*;
import com.hyrt.saic.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 下午2:24
 * To change this template use File | Settings | File Templates.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderTypeMapper orderTypeMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private GroupInfoMapper groupInfoMapper;
    @Autowired
    private GroupAnnualInspectionMapper groupAnnualInspectionMapper;
    @Autowired
    private GroupChangingMapper groupChangingMapper;
    @Autowired
    private GroupExternalInvestmentMapper groupExternalInvestmentMapper;
    @Autowired
    private GroupSeniorMapper groupSeniorMapper;
    @Autowired
    private GroupShareholderInfoMapper groupShareholderInfoMapper;
    @Autowired
    private PersonGroupInfoMapper personGroupInfoMapper;

  /*  private OrderDetailMapper orderDetailMapper;

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

    @Override
    public List<OrderType> selectOrderType() {
        return orderTypeMapper.selectAll();
    }

    @Override
    public Map selectOrder(HashMap params){

        int page,pageSize;

        if (params.get("page") == null) page = 1;else page = (Integer)params.get("page") ;
        if (params.get("pageSize") == null) pageSize = 5;else pageSize = (Integer)params.get("pageSize") ;

        int countItem = orderMapper.selectCount(params);

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        params.put("cursor",(page -1)*pageSize);
        params.put("length",pageSize);


        List list = orderMapper.selectOrderInfo(params);


        Map res = new HashMap();
        res.put("page",page);
        res.put("totalpage",totalpage);
        res.put("totalitem",countItem);
        res.put("list",list);
        return res;

    }


    public OrderInfo selectOrderInfoByOrderId(String id){
        return orderMapper.selectOrderInfoByOrderId(id);
    }


    public Map selectByOrderId(Map params){

        int page,pageSize;

        if (params.get("page") == null) page = 1;else page = (Integer)params.get("page") ;
        if (params.get("pageSize") == null) pageSize = 5;else pageSize = (Integer)params.get("pageSize") ;

        if(params.get("type")!=null){
             if(params.get("type").equals("done")){
                     params.put("status","'5'");
             }else{
                 params.put("status","'1','2','3','4','6','7','8'");
             }
        }

        int countItem = orderDetailMapper.selectCount(params);

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        params.put("cursor",(page -1)*pageSize);
        params.put("length",pageSize);


        List list = orderDetailMapper.selectByOrderId(params);


      //  Map res = new HashMap();
        params.put("page",page);
        params.put("totalpage",totalpage);
        params.put("totalitem",countItem);
        params.put("list",list);
        return params;

    }

    public Map selectGroupInfo(Long id){

        GroupInfo groupInfo =  groupInfoMapper.selectByOrderDetailId(id);
        List groupAnnualInspectionList = groupAnnualInspectionMapper.selectByGroupId(id);
        List groupChangingList = groupChangingMapper.selectByGroupId(id);
        List groupExternalInvestmentList = groupExternalInvestmentMapper.selectByGroupId(id);
        List groupSeniorList = groupSeniorMapper.selectByGroupId(id);
        List groupShareholderInfoList = groupShareholderInfoMapper.selectByGroupId(id);

        Map resmap = new HashMap();
        resmap.put("groupInfo",groupInfo);
        resmap.put("groupAnnualInspectionList",groupAnnualInspectionList);
        resmap.put("groupChangingList",groupChangingList);
        resmap.put("groupExternalInvestmentList",groupExternalInvestmentList);
        resmap.put("groupSeniorList",groupSeniorList);
        resmap.put("groupShareholderInfoList",groupShareholderInfoList);
        return resmap;
    }

    public List selectPersonInfo(Long id){


        List resList =  personGroupInfoMapper.selectByOrderDetailId(id);
        return resList;
    }


    public Integer selectForPermissionView(Map params){

        return orderMapper.selectForPermissionView(params);
    }

}
