package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.RechargeRecord;
import com.hyrt.saic.dao.AccountInfoMapper;
import com.hyrt.saic.dao.ChargePackageMapper;
import com.hyrt.saic.dao.RechargeRecordMapper;
import com.hyrt.saic.service.RechargeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-11
 * Time: 上午9:57
 * To change this template use File | Settings | File Templates.
 */
@Service("rechargeRecordService")
public class RechargeRecordServiceImpl implements RechargeRecordService{

    @Autowired
    private RechargeRecordMapper rechargeRecordMapper;
    @Autowired
    ChargePackageMapper chargePackageMapper;
    @Autowired
    AccountInfoMapper accountInfoMapper;
    @Override
    public List getRechargeRecord(Map params) {
        return rechargeRecordMapper.selectSelective(params);
    }


    public Map  selectRechargeRecordByPage(String userId,String startDate,String endDate,String lowPrice,String highPrice,Integer page){

        Map params = new HashMap();
        if(!"".equals(userId))params.put("userId",userId);
        if(!"".equals(startDate))params.put("startDate",startDate);
        if(!"".equals(endDate))params.put("endDate",endDate);
        if(!"".equals(lowPrice))params.put("lowPrice",lowPrice);
        if(!"".equals(highPrice))params.put("highPrice",highPrice);

        int pageSize=5;

        if (page== null) page = 1;

        int countItem = rechargeRecordMapper.selectivePageCount(params);

        int totalPage = (countItem + pageSize - 1) / pageSize;
        if (page > totalPage) page = totalPage;
        if (page < 1) page = 1;

        params.put("cursor",(page -1)*pageSize);
        params.put("length",pageSize);


        List list= rechargeRecordMapper.selectivePage(params);
        params.put("page",page);
        params.put("totalPage",totalPage);
        params.put("countItem",countItem);
        params.put("list",list);




        return params;
    }

    @Override
    public void insertUserRechargeRecord(RechargeRecord rechargeRecord) {
        rechargeRecordMapper.insert(rechargeRecord);
    }

    @Override
    @Transactional
    public RechargeRecord updateRechargeRecordByOrderId(String orderId,String returnqid) {
        RechargeRecord record=rechargeRecordMapper.selectByRemarkOrderId(orderId);
        record.setChargeTime(new Date());
        record.setStatus("1");
        record.setReturnResult(returnqid);
        rechargeRecordMapper.updateByPrimaryKeySelective(record);
        Map mapPara= chargePackageMapper.selectById(record.getPackageId());
        accountInfoMapper.updateAccountSearchCount(String.valueOf(mapPara.get("quantityA")),String.valueOf(mapPara.get("quantityB")),record.getUserId());
        return rechargeRecordMapper.selectByRemarkOrderId(orderId);
    }

    @Override
    public RechargeRecord getRechargeRecordByOrderId(String orderId) {
        return rechargeRecordMapper.selectByRemarkOrderId(orderId);  //To change body of implemented methods use File | Settings | File Templates.
    }
}
