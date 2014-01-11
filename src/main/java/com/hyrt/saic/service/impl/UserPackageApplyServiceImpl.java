package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.UserApplyPackageMapper;
import com.hyrt.saic.service.UserPackageApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-11
 * Time: 下午2:25
 * To change this template use File | Settings | File Templates.
 */
@Service("userPackageApplyService")
public class UserPackageApplyServiceImpl implements UserPackageApplyService {


    @Autowired
    private UserApplyPackageMapper userApplyPackageMapper;

    @Override
    public List selectUsedPackage(Map params) {
        return userApplyPackageMapper.selective(params);
    }
}
