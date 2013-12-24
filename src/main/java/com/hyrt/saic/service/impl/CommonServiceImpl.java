package com.hyrt.saic.service.impl;

import com.hyrt.saic.dao.CommonMapper;
import com.hyrt.saic.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-24
 * Time: 上午10:42
 * To change this template use File | Settings | File Templates.
 */

@Service("commonService")
public class CommonServiceImpl<T> implements CommonService<T> {

    @Autowired
    private CommonMapper commonMapper;

    @Override
    public T testCommonMapper(T o, Serializable id){

        Map params = new HashMap();
        Field[] f = o.getClass().getDeclaredFields();


        params.put("_table","t_"+o.getClass().getSimpleName());
        params.put("_column",f[0].getName());
        params.put("_id",id);
        if(f[0].getType().getSimpleName().equals("String")){
            params.put("_ptype",1 );
        }else{
            params.put("_ptype",0 );
        }


        System.out.println(params.get("_table"));
        System.out.println(f[0].getName()+"----------------------");
        System.out.println(id+"----------------------");


       Map<String,Object> resmap = commonMapper.selectByPrimaryKey(params);
       // System.out.println(res.size()+"----------------------");

        for(String key :  resmap.keySet()){
            System.out.println(key+":"+resmap.get(key));

        }
        Object obj = null;
        try {
            obj = o.getClass().getDeclaredConstructor(null).newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (IllegalAccessException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (InvocationTargetException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        } catch (NoSuchMethodException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        return (T)obj;
    }

}
