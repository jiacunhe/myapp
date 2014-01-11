package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.RechargeRecordMapper;
import com.hyrt.saic.service.RechargeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
