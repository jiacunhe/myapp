package com.hyrt.saic.service;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.ChargePackageDetaill;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: huanghe
 * Date: 13-12-26
 * Time: 下午2:54
 */
public interface PackageService  {

    public Map listChargePackage(String type,String order,Integer page,String userId,String status);
    public Map listChargePackageUser(String type,String order,Integer pageNo,String userId,String status);
    public void deleteById(int id);
    public void insert(ChargePackage chargePackage, List<ChargePackageDetaill> ChargePackageDetaillList);
    public void update(ChargePackage chargePackage,List<ChargePackageDetaill> ChargePackageDetaillList);
    public Map  selectById(int id);
    public ChargePackage selectByPrimaryKey(Integer id);

    public ChargePackage selectByPrimaryKeyAndStatus(Integer id);
    public void updateStatusById(int id,String status);

}
