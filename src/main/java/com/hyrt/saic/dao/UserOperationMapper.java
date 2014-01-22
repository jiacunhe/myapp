package com.hyrt.saic.dao;

import com.hyrt.saic.bean.UserOperation;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.util.Page;

import java.util.List;

public interface UserOperationMapper extends BaseMapper<UserOperation> {
    List<UserOperation> getAllListDescByDate(Page page);
}