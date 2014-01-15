package com.hyrt.saic.bean;

import java.util.List;

public class SysResoure {
    private Integer id;



    private Integer pid;//上级节点id

    private String resourceName;

    private String resourceUri;

    private String remark;

    private Integer open;
    private List<SysResoure> children;

    public List<SysResoure> getChildren() {
        return children;
    }

    public void setChildren(List<SysResoure> children) {
        this.children = children;
    }



    public Integer getOpen() {
        return open;
    }

    public void setOpen(Integer open) {
        this.open = open;
    }






    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResourceUri() {
        return resourceUri;
    }

    public void setResourceUri(String resourceUri) {
        this.resourceUri = resourceUri;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}