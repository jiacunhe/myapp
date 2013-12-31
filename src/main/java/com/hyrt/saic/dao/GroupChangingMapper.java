package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupChanging;

import java.util.List;

public interface GroupChangingMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupChanging record);

    int insertSelective(GroupChanging record);

    GroupChanging selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupChanging record);

    int updateByPrimaryKey(GroupChanging record);

    List selectByGroupId(Long id);
}