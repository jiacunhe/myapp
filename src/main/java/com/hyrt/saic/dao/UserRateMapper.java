package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserRate;

public interface UserRateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRate record);

    int insertSelective(UserRate record);

    UserRate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRate record);

    int updateByPrimaryKey(UserRate record);
}