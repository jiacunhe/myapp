package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupExternalInvestment;

import java.util.List;

public interface GroupExternalInvestmentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupExternalInvestment record);

    int insertSelective(GroupExternalInvestment record);

    GroupExternalInvestment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupExternalInvestment record);

    int updateByPrimaryKey(GroupExternalInvestment record);

    List selectByGroupId(Long id);
}