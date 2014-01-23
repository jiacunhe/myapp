package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.AccountInfo;
import com.hyrt.saic.bean.AccountInfoKey;
import com.hyrt.saic.dao.AccountInfoMapper;
import com.hyrt.saic.service.AccountInfoService;
import me.sfce.library.mybatis.persistence.BaseMapper;
import me.sfce.library.mybatis.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-7
 * Time: 上午9:33
 * To change this template use File | Settings | File Templates.
 */
@Service("accountInfoService")
public class AccountInfoServiceImpl extends BaseServiceImpl<AccountInfo> implements AccountInfoService{
    @Autowired
    AccountInfoMapper accountInfoMapper;
    @Override
    public List select(String userId) {



        List accountInfoList=accountInfoMapper.select(userId);
        return  accountInfoList;
    }

    @Override
    public Map selectByPage(String userId, Integer page) {
        int  pageSize=5;
        if (page == null) page = 1;
        AccountInfo c=new AccountInfo();

        if(userId!="")
           c.setUserid(userId);



        Integer countItem = accountInfoMapper.countNum(c);

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;


        Map params=new HashMap();
        if(!"".equals(userId)) params.put("userId",userId);

        params.put("start",(page - 1) * pageSize);
        params.put("num",pageSize);

        List accountInfoList=accountInfoMapper.select(params);

        Map res = new HashMap();
        res.put("page",page);
        res.put("totalpage",totalpage);
        res.put("totalitem",countItem);
        res.put("list",accountInfoList);
        return res;
    }

    @Override
    public BaseMapper<AccountInfo> getMapper() {
        return accountInfoMapper;
    }

    @Override
    public AccountInfo buildEntity(Object id) {
        return null;
    }
}
