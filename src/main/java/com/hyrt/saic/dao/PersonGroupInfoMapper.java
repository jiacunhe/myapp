package com.hyrt.saic.dao;

import com.hyrt.saic.bean.PersonGroupInfo;

public interface PersonGroupInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PersonGroupInfo record);

    int insertSelective(PersonGroupInfo record);

    PersonGroupInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PersonGroupInfo record);

    int updateByPrimaryKey(PersonGroupInfo record);
}