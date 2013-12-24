package com.hyrt.saic.service;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-24
 * Time: 上午10:41
 * To change this template use File | Settings | File Templates.
 */
public interface CommonService<T> {

    public T testCommonMapper(T t,Serializable id);
}
