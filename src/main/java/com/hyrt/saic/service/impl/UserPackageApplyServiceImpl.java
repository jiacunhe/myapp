package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.UserAssignPackage;
import com.hyrt.saic.dao.UserApplyPackageMapper;
import com.hyrt.saic.dao.UserAssignPackageMapper;
import com.hyrt.saic.service.UserPackageApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
    @Autowired
    private UserAssignPackageMapper userAssignPackageMapper;



    @Override
    public List selectUsedPackage(Map params) {
        return userApplyPackageMapper.selective(params);
    }



    @Override
    public List selectUsedPackageByPage(Map params) {
        return userApplyPackageMapper.selectiveByPage(params);
    }
    public Integer selectiveCount(Map params){
        return userApplyPackageMapper.selectiveCount(params);
    }

    @Transactional
    public void  allotPackage(UserAssignPackage uap,String assignId){

        Map params = new HashMap();
        params.put("userId",assignId);
        params.put("quantity",uap.getQuantity());
        params.put("yearMonth",new SimpleDateFormat("yyyyMM").format(new Date()));
        userApplyPackageMapper.updateAllotPackageQuantity(params);


        userAssignPackageMapper.insert(uap);



    }


    public Map allotSearch(Integer page,String status,String allocatee,String receiver){



        Map params = new HashMap();
        if(!"".equals(status))params.put("status",status);
        if(!"".equals(allocatee))params.put("allocatee",allocatee);
        if(!"".equals(receiver))params.put("receiver",receiver);

        int pageSize=5;

        if (page== null) page = 1;

        int countItem = userAssignPackageMapper.selectiveCount(params);

        int totalPage = (countItem + pageSize - 1) / pageSize;
        if (page > totalPage) page = totalPage;
        if (page < 1) page = 1;

        params.put("cursor",(page -1)*pageSize);
        params.put("length",pageSize);

        List list = userAssignPackageMapper.selective(params);

        params.put("page",page);
        params.put("totalPage",totalPage);
        params.put("countItem",countItem);
        params.put("list",list);
        return params;
    }


    public void allotStop(Integer id,String assignor){
        Map params = new HashMap();
        params.put("id",id);
        if(!"".equals(assignor))params.put("assignor",assignor);
        userAssignPackageMapper.allotStop(params);
    }

}
