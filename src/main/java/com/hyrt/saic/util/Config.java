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
    public static final String USER_MESSAGE_TYPE_SYSTEM="s";//系统消息
    public static final String USER_MESSAGE_TYPE_REPLY="r";//问答回复
    public static final String USER_MESSAGE_TYPE_ORDER="o";//订单消息
    public static final String  USER_MESSAGE_TYPE_QUESTION="q";//客户问题
    public static final String USER_MESSAGE_STATUS_NEW="n";//新消息
    public static final String USER_MESSAGE_STATUS_READ="d";//已读消息
    public  static final  String USER_RECHAEGE_RECOED_TYPE="银联在线";

    public static  String getBasePath(HttpServletRequest request){

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        return basePath;
    }
}
