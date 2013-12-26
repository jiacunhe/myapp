package com.hyrt.saic.dao;

import com.hyrt.saic.bean.AccountInfo;

public interface AccountInfoMapper {
    int deleteByPrimaryKey(String userid);

    int insert(AccountInfo record);

    int insertSelective(AccountInfo record);

    AccountInfo selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(AccountInfo record);

    int updateByPrimaryKey(AccountInfo record);
}