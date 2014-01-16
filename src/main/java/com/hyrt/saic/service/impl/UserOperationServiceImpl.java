package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.dao.UserOperationMapper;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-16
 * Time: 上午10:52
 */
public class UserOperationServiceImpl extends BaseServiceImpl<UserOperation> {
    @Autowired
    UserOperationMapper userOperationMapper;

    @Override
    public BaseMapper<UserOperation> getMapper() {
        return userOperationMapper;
    }

    @Override
    public UserOperation buildEntity(Object id) {
        UserOperation operation = new UserOperation();
        if (id != null) {
            operation.setId((int) id);
        }
        return operation;
    }
}
