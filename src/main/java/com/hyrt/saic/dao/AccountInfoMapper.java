package com.hyrt.saic.dao;

import com.hyrt.saic.bean.AccountInfo;
import com.hyrt.saic.bean.AccountInfoKey;

import java.util.List;
import java.util.Map;

public interface AccountInfoMapper {
    int deleteByPrimaryKey(AccountInfoKey key);

    int insert(AccountInfo record);

    int insertSelective(AccountInfo record);

    AccountInfo selectByPrimaryKey(AccountInfoKey key);

    int updateByPrimaryKeySelective(AccountInfo record);

    int updateByPrimaryKey(AccountInfo record);

    List select(String userId);

    List select(Map map);

    Integer countNum(AccountInfo a);
}