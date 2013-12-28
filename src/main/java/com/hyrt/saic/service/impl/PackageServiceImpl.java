package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.ChargePackageDetaill;
import com.hyrt.saic.dao.ChargePackageDetaillMapper;
import com.hyrt.saic.dao.ChargePackageMapper;
import com.hyrt.saic.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午3:38
 * To change this template use File | Settings | File Templates.
 */
@Service("packageService")
public class PackageServiceImpl implements PackageService {
    @Autowired
    ChargePackageMapper chargePackageMapper;

    @Autowired
    ChargePackageDetaillMapper chargePackageDetaillMapper;

    @Override
    public Map listChargePackage(String type,String order,Integer page) {
        int  pageSize=10;
        if (page == null) page = 1;
        int countItem = chargePackageMapper.countNum();

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        Map params=new HashMap();
        params.put("type",type);
        params.put("order",order);
        params.put("page",page);
        params.put("start",(page - 1) * pageSize);
        params.put("num",pageSize);
        List list=chargePackageMapper.select(params);
        Map res = new HashMap();
        res.put("page",page);
        res.put("totalpage",totalpage);
        res.put("totalitem",countItem);
        res.put("list",list);
        return res;
    }

    @Override
    public void deleteById(int id) {
        //To change body of implemented methods use File | Settings | File Templates.
        chargePackageMapper.deleteByPrimaryKey(id);
        int PackageId=id;
        chargePackageDetaillMapper.deleteByPackageId(PackageId);
    }

    @Override
    public void insert(ChargePackage chargePackage, List<ChargePackageDetaill> ChargePackageDetaillList) {
        //To change body of implemented methods use File | Settings | File Templates.
         chargePackageMapper.insertSelective(chargePackage);
         for(ChargePackageDetaill chargePackageDetaill:ChargePackageDetaillList) {
         chargePackageDetaillMapper.insertSelective(chargePackageDetaill);  }
    }

    @Override
    public void update(ChargePackage chargePackage, List<ChargePackageDetaill> ChargePackageDetaillList) {
        //To change body of implemented methods use File | Settings | File Templates.
        chargePackageMapper.updateByPrimaryKeySelective(chargePackage);
        for(ChargePackageDetaill chargePackageDetaill:ChargePackageDetaillList)  {
        chargePackageDetaillMapper.updateByPrimaryKeySelective(chargePackageDetaill);}
    }


}
