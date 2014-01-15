package com.hyrt.saic.dao;

import com.hyrt.saic.bean.RechargeRecord;

import java.util.List;
import java.util.Map;

public interface RechargeRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RechargeRecord record);

    int insertSelective(RechargeRecord record);

    RechargeRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RechargeRecord record);

    int updateByPrimaryKey(RechargeRecord record);

    List selectSelective(Map params);

    List selectivePage(Map params);

    int selectivePageCount(Map params);
}