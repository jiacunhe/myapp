package com.hyrt.saic.filter;

import com.hyrt.saic.bean.SysResource;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.RoleResourceService;
import com.hyrt.saic.util.Config;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-1-11
 * Time: 下午4:47
 * To change this template use File | Settings | File Templates.
 */
public class UserResourceFilter implements Filter {
    protected FilterConfig filterConfig = null;
    private String redirectURL = null;//未登录的定向url
    private List notCheckURLList = new ArrayList();
    private String sessionKey = null;
    private String sessionKeyManage = null;
    private ServletContext servletContext;
    private static List<SysResource> allSysResourceList = new ArrayList<SysResource>();
    private List<SysResource> haveSysResourceList = new ArrayList<SysResource>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        redirectURL = filterConfig.getInitParameter("redirectURL");
        sessionKey = Config.USER;
        sessionKeyManage = Config.MANAGE;
        String notCheckURLListStr = filterConfig.getInitParameter("notCheckURLList");
        servletContext = filterConfig.getServletContext();
        if (notCheckURLListStr != null) {
            StringTokenizer st = new StringTokenizer(notCheckURLListStr, ";");
            notCheckURLList.clear();
            while (st.hasMoreTokens()) {
                notCheckURLList.add(st.nextToken());
            }
        }

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /**
         * 用于检测用户是否登陆的过滤器，如果未登录，则重定向到指的登录页面<p>
         * 配置参数<p>
         * checkSessionKey 需检查的在 Session 中保存的关键字<br/>
         * redirectURL 如果用户未登录，则重定向到指定的页面，URL不包括 ContextPath<br/>
         * notCheckURLList 不做检查的URL列表，以分号分开，并且 URL 中不包括 ContextPath<br/>
         */
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        WebApplicationContext context = (WebApplicationContext) servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        HttpSession session = request.getSession();
        String manageUri = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
        //所有受限资源集合 静态
        if (allSysResourceList == null || allSysResourceList.size() == 0)
            allSysResourceList = ((RoleResourceService) context.getBean("roleResourceService")).getAllSysResourcewithoutTree();
        haveSysResourceList = (List<SysResource>) session.getAttribute(Config.USER_RESOURCE_LIST);

        if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) == null) {
            String returnLoginUri = "/";
            if (session.getAttribute(sessionKeyManage) == null) {
                if (manageUri.contains("manage"))
                    returnLoginUri = "/manage";
                else
                    returnLoginUri = "/";
            } else if (session.getAttribute(sessionKeyManage) != null) {
                if (Config.ADMIN.equals(((User)request.getSession().getAttribute(Config.MANAGE)).getUserId())) {
                    filterChain.doFilter(request, response);
                    return;
                }
                //判断是否受限制资源
                if (isLimitedResources(request, context, manageUri)) {
                    //是 则判断用户是否有权访问受限制资源
                    isHaveAccess(request, response, filterChain, context, manageUri);
                } else {
                    //否 则继续
                    filterChain.doFilter(request, response);
                    return;
                }
            }
            responseUri(request, response, returnLoginUri);
            //   response.sendRedirect(request.getContextPath() + redirectURL);
            return;
        } else if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) != null && session.getAttribute(sessionKeyManage) == null) {
            if (isLimitedResources(request, context, manageUri)) {
                //  是 则跳转后台登录页面，
                responseUri(request, response, "/manage");
            }
            //否则继续
        } else if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) != null && session.getAttribute(sessionKeyManage) != null) {
            if (Config.ADMIN.equals(((User)request.getSession().getAttribute(Config.MANAGE)).getUserId())) {
                filterChain.doFilter(request, response);
                return;
            }
            //判断是否受限制资源，
            if (isLimitedResources(request, context, manageUri)) {
                //是 则判断manager是否有权访问受限制资源
                isHaveAccess(request, response, filterChain, context, manageUri);
            } else {
                filterChain.doFilter(request, response);
                return;
            }
            //，否则继续
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        notCheckURLList.clear();
    }

    private boolean checkRequestURIIntNotFilterList(HttpServletRequest request) {
        String uri = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
        //针对images、js和css不过滤处理
        boolean checkContains = false;
        String panUri = "";
        if (uri.length() > 1) {
            panUri = uri.substring(uri.indexOf("/") + 1, uri.length());
            if (panUri.indexOf("/") > 0)
                panUri = panUri.substring(0, panUri.indexOf("/"));
        }
        if (uri.length() > 1 && uri.contains("manage")) {
            panUri = uri.substring(uri.indexOf("/") + 1, uri.length());
            if (panUri.indexOf("/") > 0)
                panUri = panUri.substring(0, panUri.lastIndexOf("/"));
        }
        for (Object checkUri : notCheckURLList) {
            if ((((String) checkUri).contains("/*") && ((String) checkUri).contains(panUri))) {
                checkContains = true;
                return checkContains;
            }
        }
        return notCheckURLList.contains(uri);
    }

    private void responseUri(HttpServletRequest request, HttpServletResponse response, String keylogin) throws IOException {
        java.io.PrintWriter out = response.getWriter();
        StringBuffer sb = new StringBuffer();
        sb.append("<html>");
        sb.append("<script>");
        sb.append("window.open ('");
        sb.append(request.getContextPath());
        //前台登录页面
        sb.append(keylogin);
        sb.append("','_top')");
        sb.append("</script>");
        sb.append("</html>");
        // System.out.println(sb.toString());
        out.println(sb.toString());
    }

    private boolean isLimitedResources(HttpServletRequest request, WebApplicationContext context, String uril) {
        boolean isOrNotLimited = false;

        if (uril.lastIndexOf(Config._UI) > 0)
            uril = uril.substring(0, uril.lastIndexOf(Config._UI));
        for (SysResource sysResource : allSysResourceList) {
            if (sysResource.getResourceUri().contains(uril)) {
                isOrNotLimited = true;
                return isOrNotLimited;
            }
        }
        return isOrNotLimited;
    }

    private void isHaveAccess(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain, WebApplicationContext context, String uril) throws IOException, ServletException {
        boolean isHaveAccess = false;
        User user = (User) request.getSession().getAttribute(Config.MANAGE);
        if (user != null) {
            if (haveSysResourceList != null && haveSysResourceList.size() > 0) {
                if (uril.lastIndexOf(Config._UI) > 0)
                    uril = uril.substring(0, uril.lastIndexOf(Config._UI));
                for (SysResource sysResource : haveSysResourceList) {
                    if (sysResource.getResourceUri().contains(uril)) {
                        isHaveAccess = true;
                        break;
                    }
                }
                if (isHaveAccess) {
                    filterChain.doFilter(request, response);
                    return;
                } else {
                    response.sendRedirect("/noPrivilege");
                    return;
                }
            } else {
                response.sendRedirect("/noPrivilege");
                return;
            }
        } else
            responseUri(request, response, "/manage");
    }

}
