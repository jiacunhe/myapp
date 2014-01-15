package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.UserApplyPackageMapper;
import com.hyrt.saic.service.UserApplyPackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 14-1-7
 * Time: 下午6:02
 * To change this template use File | Settings | File Templates.
 */
@Service("userApplyPackageService")
public class UserApplyPackageServiceImpl implements UserApplyPackageService {
    @Autowired
    UserApplyPackageMapper userApplyPackageMapper;
    @Override
    public List select(String userId,String dateStr) {
        Map map=new HashMap();
        map.put("userId",userId);
        map.put("yearMonth",dateStr);
        List list= userApplyPackageMapper.select(map);
        return list;
    }
}
