package com.hyrt.saic.dao;

import com.hyrt.saic.bean.SpendingDetail;

public interface SpendingDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SpendingDetail record);

    int insertSelective(SpendingDetail record);

    SpendingDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SpendingDetail record);

    int updateByPrimaryKey(SpendingDetail record);
}