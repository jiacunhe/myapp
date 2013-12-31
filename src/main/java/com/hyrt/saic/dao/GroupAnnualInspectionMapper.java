package com.hyrt.saic.dao;

import com.hyrt.saic.bean.GroupAnnualInspection;

import java.util.List;

public interface GroupAnnualInspectionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(GroupAnnualInspection record);

    int insertSelective(GroupAnnualInspection record);

    GroupAnnualInspection selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(GroupAnnualInspection record);

    int updateByPrimaryKey(GroupAnnualInspection record);

    List selectByGroupId(Long id);
}