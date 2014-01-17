package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.dao.UserOperationMapper;
import com.hyrt.saic.service.UserOperationService;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-16
 * Time: 上午10:52
 */
@Service
public class UserOperationServiceImpl extends BaseServiceImpl<UserOperation> implements UserOperationService {
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
