package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.UserChagePackage;
import com.hyrt.saic.dao.UserChagePackageMapper;
import com.hyrt.saic.service.UserChargePackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-22
 * Time: 下午5:00
 * To change this template use File | Settings | File Templates.
 */
@Service("userChargePackageService")
public class UserChargePackageServiceImpl implements UserChargePackageService {
    @Autowired
    private UserChagePackageMapper userChargePackageMapper;

    @Override
    public void add(String userId, Integer chargePackageId) {
        UserChagePackage userChargePackage=new UserChagePackage();
        userChargePackage.setUserId(userId);
        userChargePackage.setStatus(1);

        userChargePackage.setCreateTime(new Date());
        userChargePackage.setChargePackageId(chargePackageId);

        userChargePackageMapper.insertSelective(userChargePackage);
    }
}
