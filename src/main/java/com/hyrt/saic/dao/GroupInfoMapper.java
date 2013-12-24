package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupInfo;

public interface GroupInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupInfo record);

    int insertSelective(GroupInfo record);

    GroupInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupInfo record);

    int updateByPrimaryKey(GroupInfo record);
}