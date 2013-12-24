package com.hyrt.saic.dao;

import com.hyrt.saic.bean.VipLevel;

public interface VipLevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VipLevel record);

    int insertSelective(VipLevel record);

    VipLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VipLevel record);

    int updateByPrimaryKey(VipLevel record);
}