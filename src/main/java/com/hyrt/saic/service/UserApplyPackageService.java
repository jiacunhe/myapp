package com.hyrt.saic.service;

import com.hyrt.saic.bean.UserApplyPackage;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-7
 * Time: 下午6:01
 * To change this template use File | Settings | File Templates.
 */
public interface UserApplyPackageService {
    List select(String userId,String dateStr);

    public UserApplyPackage selectByUserAndMonth(String userId);

    public Integer selectQuantityByPackageId(Integer packageId);
}
