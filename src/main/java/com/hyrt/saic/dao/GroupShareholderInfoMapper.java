package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupShareholderInfo;

import java.util.List;

public interface GroupShareholderInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupShareholderInfo record);

    int insertSelective(GroupShareholderInfo record);

    GroupShareholderInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupShareholderInfo record);

    int updateByPrimaryKey(GroupShareholderInfo record);


    List selectByGroupId(Long id);
}