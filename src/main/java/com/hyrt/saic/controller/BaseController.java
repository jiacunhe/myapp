package com.hyrt.saic.controller;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 上午9:58
 */
public abstract class BaseController {
    public static final String USER = "user";

    public static final String FTL = ".ftl";
    public static final String JSP = ".jsp";

    protected String freeMarker(String url) {
        return url + FTL;
    }

    protected String jsp(String url) {
        return url + JSP;
    }

    protected String redirectTo(String url) {
        return "redirect:" + url;
    }

    protected String forwardTo(String url) {
        return "forward:" + url;
    }
}
