package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SpendingDetail;
import com.hyrt.saic.bean.SpendingDetailKey;

public interface SpendingDetailMapper {
    int deleteByPrimaryKey(SpendingDetailKey key);

    int insert(SpendingDetail record);

    int insertSelective(SpendingDetail record);

    SpendingDetail selectByPrimaryKey(SpendingDetailKey key);

    int updateByPrimaryKeySelective(SpendingDetail record);

    int updateByPrimaryKey(SpendingDetail record);
}