package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupSenior;

public interface GroupSeniorMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupSenior record);

    int insertSelective(GroupSenior record);

    GroupSenior selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupSenior record);

    int updateByPrimaryKey(GroupSenior record);
}