package com.hyrt.saic.tag;

import com.hyrt.saic.bean.SysResoure;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.util.Config;

import javax.servlet.ServletContext;
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
    private ServletContext servletContext;
    private String resoureuri;


    @Override
    public void doTag() throws JspException, IOException {

        //获取request对象
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        servletContext = pageContext.getServletContext();
        //获取当前登陆用户
        User user = (User) request.getSession().getAttribute(Config.MANAGE);
        if (user == null) {
            return;
        }
        List<SysResoure> haveSysResoureList = (List) request.getSession().getAttribute(Config.USER_HAVE_RESOURCE_KEY);
        if (resoureuri.lastIndexOf(Config.UI_SUFFIX) > 0)
            resoureuri = resoureuri.substring(0, resoureuri.lastIndexOf(Config.UI_SUFFIX));
        for (SysResoure sysResoure : haveSysResoureList) {
            if (sysResoure.getResourceUri().equals(resoureuri)) {
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

    public String getResoureuri() {
        return resoureuri;
    }

    public void setResoureuri(String resoureuri) {
        this.resoureuri = resoureuri;
    }
}
