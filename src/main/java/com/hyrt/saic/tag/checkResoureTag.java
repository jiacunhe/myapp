package com.hyrt.saic.tag;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.hyrt.saic.bean.Role;
import com.hyrt.saic.bean.SysResoure;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.RoleResourceService;
import com.hyrt.saic.util.Config;
import org.springframework.web.context.WebApplicationContext;

/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-1-14
 * Time: 上午9:25
 * To change this template use File | Settings | File Templates.
 */
public class CheckResoureTag implements SimpleTag {
    private PageContext pageContext;
    //标签体
    private JspFragment jspFragment;
    private ServletContext servletContext;



    //<itcast:checkMemu  resoureName=""   resoureuri="">
    private String resoureName;
    private String resoureuri;




    @Override
    public void doTag() throws JspException, IOException {

        //获取request对象
        HttpServletRequest request=(HttpServletRequest)pageContext.getRequest();
        servletContext= pageContext.getServletContext();
        WebApplicationContext context =  (WebApplicationContext)servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        //获取当前登陆用户

        User   user = (User)request.getSession().getAttribute(Config.MANAGE);

        if(user==null){
            return;
        }
        List<Role> haveRoleList=new ArrayList<Role>();
        haveRoleList=((RoleResourceService)context.getBean("roleResourceService")).getRolesByuserid(user.getUserId());
        if(haveRoleList.size()==0){
            return;
        }
        StringBuffer stringBuffer=new StringBuffer();
        String roleids="";
        if(haveRoleList.size()>0){
            for(Role role:haveRoleList){
                stringBuffer.append(role.getId());
                stringBuffer.append(",");
            }
            if(stringBuffer.length()>0&&stringBuffer.indexOf(",")>0)
                roleids=stringBuffer.toString().substring(0,stringBuffer.indexOf(","));
        List<SysResoure> haveSysResoureList=((RoleResourceService)context.getBean("roleResourceService")).getResoureByUserRoleids(roleids);
          if(resoureuri.lastIndexOf(Config.URI_PATH_KEY)>0)
              resoureuri=resoureuri.substring(0,resoureuri.lastIndexOf(Config.URI_PATH_KEY));
            for(SysResoure sysResoure:haveSysResoureList){
                if(sysResoure.getResourceUri().equals(resoureuri)&&sysResoure.getResourceName().equals(resoureName)){
                    //如果在集合中存在,输出标签体
                    this.jspFragment.invoke(null);
                    break;

                }

            }



        }

    }

    @Override
    public void setParent(JspTag jspTag) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public JspTag getParent() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setJspContext(JspContext jspContext) {
        this.pageContext=(PageContext) jspContext;
    }

    @Override
    public void setJspBody(JspFragment jspFragment) {
        this.jspFragment=jspFragment;
    }
    public String getResoureName() {
        return resoureName;
    }

    public void setResoureName(String resoureName) {
        this.resoureName = resoureName;
    }

    public String getResoureuri() {
        return resoureuri;
    }

    public void setResoureuri(String resoureuri) {
        this.resoureuri = resoureuri;
    }
}
