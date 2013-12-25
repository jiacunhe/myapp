package com.hyrt.saic.service;

import com.hyrt.saic.util.enums.DataOperateType;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-24
 * Time: 上午10:41
 * To change this template use File | Settings | File Templates.
 */
public interface CommonService<T> {

    public T selectByPrimaryKey(Class clazz, Serializable id);

    public void saveOrUpdateOrDeleteAll(Map<DataOperateType,List<Object>> beans) throws Exception;

    @Deprecated
    public List selectBySql(String sql);

    @Deprecated
    public Map selectBySql(String sql,Integer page,Integer pagesize);
}
