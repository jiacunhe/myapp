package com.hyrt.saic.service;

import com.hyrt.saic.bean.RechargeRecord;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-11
 * Time: 上午9:55
 * To change this template use File | Settings | File Templates.
 */

public interface RechargeRecordService {

     public List getRechargeRecord(Map params);


    public Map  selectRechargeRecordByPage(String userId,String startDate,String endDate,String lowPrice,String highPrice,Integer page);

    public void insertUserRechargeRecord(RechargeRecord rechargeRecord);

    public RechargeRecord  updateRechargeRecordByOrderId(String  orderId,String returnqid);

    RechargeRecord getRechargeRecordByOrderId(String orderId);
}
