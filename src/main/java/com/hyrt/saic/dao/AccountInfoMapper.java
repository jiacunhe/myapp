package com.hyrt.saic.dao;

import com.hyrt.saic.bean.AccountInfo;
import me.sfce.library.mybatis.persistence.BaseMapper;

import java.util.List;
import java.util.Map;

public interface AccountInfoMapper extends BaseMapper<AccountInfo> {
   /* int deleteByPrimaryKey(AccountInfoKey key);

    int insertSelective(AccountInfo record);

    AccountInfo selectByPrimaryKey(AccountInfoKey key);

    int updateByPrimaryKeySelective(AccountInfo record);

    int updateByPrimaryKey(AccountInfo record);*/

    List select(String userId);

    List select(Map map);

    Integer countNum(AccountInfo a);
}