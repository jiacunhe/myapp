package com.hyrt.saic.dao;

import com.hyrt.saic.bean.AccountInfo;
import me.sfce.library.mybatis.persistence.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AccountInfoMapper extends BaseMapper<AccountInfo> {
    List select(String userId);

    List select(Map map);

    Integer countNum(AccountInfo a);

    void updateAccountSearchCount(@Param("quantityA") String quantityA, @Param("quantityB") String quantityB,@Param("userId")String userId);
}