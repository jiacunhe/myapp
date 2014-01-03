package com.hyrt.saic.util;

import org.apache.commons.fileupload.ObjectPool;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 14-1-2
 * Time: 上午9:41
 * To change this template use File | Settings | File Templates.
 */
public class ActiveUserListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

        ObjectPool.getPool().p.remove(httpSessionEvent.getSession().getId()+"reslist");
        System.out.println("remove   "+httpSessionEvent.getSession().getId()+"reslist");
    }
}
