package com.hyrt.saic.dao;

import java.io.Serializable;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-24
 * Time: 上午10:24
 * To change this template use File | Settings | File Templates.
 */
public interface CommonMapper {

    public Map selectByPrimaryKey(Map params);

 /*   public void update(T t){

    }

    public void save(T t){

    }

    public void delete(T t){

    }
*/
}
