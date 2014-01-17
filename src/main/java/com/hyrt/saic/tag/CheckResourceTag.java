package com.hyrt.saic.tag;

import com.hyrt.saic.bean.SysResource;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.util.Config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;
import java.io.IOException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-1-14
 * Time: 上午9:25
 * To change this template use File | Settings | File Templates.
 */
public class CheckResourceTag implements SimpleTag {
    private PageContext pageContext;
    //标签体
    private JspFragment jspFragment;
    private String uri;


    @Override
    public void doTag() throws JspException, IOException {

        //获取request对象
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        //获取当前登陆用户
        User user = (User) request.getSession().getAttribute(Config.MANAGE);
        if (user == null) {
            return;
        }
        if (Config.ADMIN.equals(user.getUserId())) {
            this.jspFragment.invoke(null);
        }
        List<SysResource> haveSysResourceList = (List) request.getSession().getAttribute(Config.USER_HAVE_RESOURCE_KEY);
        if (uri.lastIndexOf(Config._UI) > 0)
            uri = uri.substring(0, uri.lastIndexOf(Config._UI));
        for (SysResource sysResource : haveSysResourceList) {
            if (sysResource.getResourceUri().equals(uri)) {
                //如果在集合中存在,输出标签体
                this.jspFragment.invoke(null);
                break;
            }
        }
    }

    @Override
    public void setParent(JspTag jspTag) {

    }

    @Override
    public JspTag getParent() {
        return null;
    }

    @Override
    public void setJspContext(JspContext jspContext) {
        this.pageContext = (PageContext) jspContext;
    }

    @Override
    public void setJspBody(JspFragment jspFragment) {
        this.jspFragment = jspFragment;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }
}
