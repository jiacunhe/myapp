package com.hyrt.saic.dao;

import com.hyrt.saic.bean.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(String userid);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}