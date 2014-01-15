package com.hyrt.saic.filter;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.SysResoure;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.dao.SysResoureMapper;
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
public class userResoureFilter implements Filter {
    protected FilterConfig filterConfig = null;
    private String redirectURL = null;
    private List notCheckURLList = new ArrayList();
    private String sessionKey = null;
    private String sessionKeyManage = null;
    private ServletContext  servletContext;
    private List<SysResoure> allSysResoureList=new ArrayList<SysResoure>();
    private List<SysResoure> haveSysResoureList=new ArrayList<SysResoure>();
    private List<SysResoure> allchild123List =new ArrayList<SysResoure>();


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        redirectURL = filterConfig.getInitParameter("redirectURL");
        sessionKey = filterConfig.getInitParameter("checkSessionKey");
        sessionKeyManage = filterConfig.getInitParameter("checkSessionKeyManage");
        String notCheckURLListStr = filterConfig.getInitParameter("notCheckURLList");
        servletContext= filterConfig.getServletContext();
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
        WebApplicationContext context =  (WebApplicationContext)servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

        HttpSession session = request.getSession();
        String manageuri = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo());
        if (sessionKey == null) {
            filterChain.doFilter(request, response);
            return;
        }
//放开所有异步查询rui



        if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) == null) {
            String returnloginuri = "/";

            if (session.getAttribute(sessionKeyManage) == null) {

                if (manageuri.contains("manage"))
                    returnloginuri = "/manage";
                else
                    returnloginuri = "/";
            } else if (session.getAttribute(sessionKeyManage) != null) {
                //判断是否受限制资源
                if(isLimitedResources(request,context,manageuri)){
                   //是 则判断用户是否有权访问受限制资源
                    isHaveAccess(request,response,filterChain,context,manageuri);


                }else{
                   //否 则继续
                        filterChain.doFilter(request, response);
                        return;


                }



            }
            resposenuri(request, response, returnloginuri);

            //   response.sendRedirect(request.getContextPath() + redirectURL);
            return;

        } else if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) != null && session.getAttribute(sessionKeyManage) == null) {
            if(isLimitedResources(request,context,manageuri)){


            //  是 则跳转后台登录页面，
                resposenuri(request, response, "/manage");
            }
            //否则继续

        } else if ((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) != null && session.getAttribute(sessionKeyManage) != null) {
            //判断是否受限制资源，
            if(isLimitedResources(request,context,manageuri)){
                //是 则判断manager是否有权访问受限制资源


                isHaveAccess(request,response,filterChain,context,manageuri);

            }else{
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
        boolean checkcontains = false;
        String panuri = "";
        if (uri.length() > 1) {
            panuri = uri.substring(uri.indexOf("/") + 1, uri.length());
            if (panuri.indexOf("/") > 0)
                panuri = panuri.substring(0, panuri.indexOf("/"));
        }
        if (uri.length() > 1 && uri.contains("manage")) {
            panuri = uri.substring(uri.indexOf("/") + 1, uri.length());
            if (panuri.indexOf("/") > 0)
                panuri = panuri.substring(0, panuri.lastIndexOf("/"));
        }
        for (Object checkuri : notCheckURLList) {
            if ((((String) checkuri).contains("/*") && ((String) checkuri).contains(panuri))) {
                checkcontains = true;
                return checkcontains;
            }
        }


        return notCheckURLList.contains(uri);
    }

    private void resposenuri(HttpServletRequest request, HttpServletResponse response, String keylogin) throws IOException {
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

    private boolean isLimitedResources(HttpServletRequest request,WebApplicationContext context,String uril ) {
        boolean isOrNotLimited = false;

        allSysResoureList=((RoleResourceService)context.getBean("roleResourceService")).getAllSysResourcewithoutTree();

        if(uril.lastIndexOf(Config.URI_PATH_KEY)>0)
            uril=uril.substring(0,uril.lastIndexOf(Config.URI_PATH_KEY));
        for(SysResoure sysResoure:allSysResoureList){
            if(sysResoure.getResourceUri().contains(uril)){
                isOrNotLimited=true;
                return isOrNotLimited;
            }

        }


        return isOrNotLimited;
    }
private void isHaveAccess(HttpServletRequest request, HttpServletResponse response,FilterChain filterChain,WebApplicationContext context,String uril)throws IOException, ServletException {
  boolean ishaveAccess=false;
    User user=(User)request.getSession().getAttribute(Config.MANAGE);
    if(user!=null){
    List<Role> rolelist=((RoleResourceService)context.getBean("roleResourceService")).getRolesByuserid(user.getUserId());
    StringBuffer stringBuffer=new StringBuffer();
    String roleids="";
        if(rolelist.size()>0){
    for(Role role:rolelist){
        stringBuffer.append(role.getId());
        stringBuffer.append(",");
    }
    if(stringBuffer.length()>0&&stringBuffer.indexOf(",")>0)
        roleids=stringBuffer.toString().substring(0,stringBuffer.indexOf(","));



    haveSysResoureList=((RoleResourceService)context.getBean("roleResourceService")).getResoureByUserRoleids(roleids);





            if(uril.lastIndexOf(Config.URI_PATH_KEY)>0)
            uril=uril.substring(0,uril.lastIndexOf(Config.URI_PATH_KEY));
        for(SysResoure sysResoure:haveSysResoureList){

            if(sysResoure.getResourceUri().contains(uril)){
                ishaveAccess=true;
                break;

            }

        }
        if (ishaveAccess){
            filterChain.doFilter(request, response);
        return;
        }
        else{
        response.sendRedirect("/meiyouqiuanxian");
        return;
        }
        }else{
            response.sendRedirect("/meiyouquanxian");
            return;
        }
    }else
    resposenuri(request,response,"/manage");


}

}
