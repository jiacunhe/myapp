package com.hyrt.saic.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-6
 * Time: 上午11:51
 */
public class Config {
    public static final String PASSWORD_MANAGER_DEFAULT = "hyrt123";
    public static final String PASSWORD_CUSTOMER_DEFAULT = "hyrt789";
    public static final String ADMIN = "admin";
    public static final String USER = "user";
    public static final String MANAGE = "manage";
    public static final int PAGE_SIZE = 10;
    public static final String _UI = "/UI";
    public static final String USER_RESOURCE_LIST = "userHaveResourelist";
    public static  String getBasePath(HttpServletRequest request){

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        return basePath;
    }
}
