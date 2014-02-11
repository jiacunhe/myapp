package com.hyrt.saic.service.impl;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.ChargePackageDetaill;
import com.hyrt.saic.dao.ChargePackageDetaillMapper;
import com.hyrt.saic.dao.ChargePackageMapper;
import com.hyrt.saic.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午3:38
 */
@Service("packageService")
public class PackageServiceImpl implements PackageService {
    @Autowired
    ChargePackageMapper chargePackageMapper;

    @Autowired
    ChargePackageDetaillMapper chargePackageDetaillMapper;

    @Override
    public Map listChargePackage(String type, String order, Integer page, String userId, String status) {
        int pageSize = 10;
        if (page == null) page = 1;
        ChargePackage c = new ChargePackage();
        if (status != "")
            c.setStatus(status);
        if (type != "")
            c.setType(type);
        if (userId != "")
            c.setUserId(userId);


        Integer countItem = chargePackageMapper.countNum(c);

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        Map params = new HashMap();

        if (!"".equals(type)) params.put("type", type);
        if (!"".equals(status)) params.put("status", status);
        if (!"".equals(userId)) params.put("userId", userId);
        if (!"".equals(order)) params.put("order", order);


        params.put("start", (page - 1) * pageSize);
        params.put("num", pageSize);

        List list = chargePackageMapper.select(params);

        Map res = new HashMap();
        res.put("page", page);
        res.put("totalpage", totalpage);
        res.put("totalitem", countItem);
        res.put("list", list);
        return res;
    }

    @Override
    public Map listChargePackageUser(String type, String order, Integer page, String userId, String status) {
        int pageSize = 10;
        if (page == null) page = 1;
        ChargePackage c = new ChargePackage();
        if (status != "")
            c.setStatus(status);
        if (type != "")
            c.setType(type);
        if (userId != "")
            c.setUserId(userId);


        Integer countItem = chargePackageMapper.countNumUser(c);

        int totalpage = (countItem + pageSize - 1) / pageSize;
        if (page > totalpage) page = totalpage;
        if (page < 1) page = 1;

        Map params = new HashMap();
        if (!"".equals(type)) params.put("type", type);
        if (!"".equals(status)) params.put("status", status);
        if (!"".equals(userId)) params.put("userId", userId);
        if (!"".equals(order)) params.put("order", order);

        params.put("start", (page - 1) * pageSize);
        params.put("num", pageSize);


        List list = chargePackageMapper.selectUser(params);

        Map res = new HashMap();
        res.put("page", page);
        res.put("totalpage", totalpage);
        res.put("totalitem", countItem);
        res.put("list", list);
        return res;

    }

    @Override
    @Transactional
    public void deleteById(int id) {

        int PackageId = id;
        chargePackageDetaillMapper.deleteByPackageId(PackageId);   //先删除外键才能删除主键
        chargePackageMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public void insert(ChargePackage chargePackage, List<ChargePackageDetaill> ChargePackageDetaillList) {
        chargePackageMapper.insertSelective(chargePackage);
        int lastId = chargePackageMapper.lastInsertId();

        for (ChargePackageDetaill chargePackageDetaill : ChargePackageDetaillList) {

            chargePackageDetaill.setPackageId(lastId);

            chargePackageDetaillMapper.insertSelective(chargePackageDetaill);
        }
    }

    @Override
    @Transactional
    public void update(ChargePackage chargePackage, List<ChargePackageDetaill> ChargePackageDetaillList) {
        chargePackageMapper.updateByPrimaryKeySelective(chargePackage);
        for (ChargePackageDetaill chargePackageDetaill : ChargePackageDetaillList) {
            chargePackageDetaill.setPackageId(chargePackage.getId());
            chargePackageDetaillMapper.updateByPrimaryKeySelective(chargePackageDetaill);
        }
    }

    @Override
    public Map selectById(int id) {
        Map packageMap = chargePackageMapper.selectById(id);
        return packageMap;
    }

    @Override
    public void updateStatusById(int id, String status) {
        ChargePackage c = new ChargePackage();
        c.setStatus(status);
        c.setId(id);
        chargePackageMapper.updateStatusById(c);
    }


}
