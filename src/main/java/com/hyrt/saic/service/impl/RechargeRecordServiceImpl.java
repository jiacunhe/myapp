package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.RechargeRecordMapper;
import com.hyrt.saic.service.RechargeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
