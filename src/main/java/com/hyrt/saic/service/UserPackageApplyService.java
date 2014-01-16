package com.hyrt.saic.service;

import com.hyrt.saic.bean.UserAssignPackage;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-11
 * Time: 下午2:23
 * To change this template use File | Settings | File Templates.
 */
public interface UserPackageApplyService {

    public List selectUsedPackage(Map params);

    public Integer selectiveCount(Map params);

    public void  allotPackage(UserAssignPackage uap,String assignId);

    public Map allotSearch(Integer page,String status,String allocatee,String receiver);

    public void allotStop(Integer id,String assignor);

    public List selectUsedPackageByPage(Map params);

}
