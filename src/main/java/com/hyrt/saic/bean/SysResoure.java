package com.hyrt.saic.bean;

public class SysResoure {
    private Integer id;

    private String resourcename;

    private String resourceuri;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResourcename() {
        return resourcename;
    }

    public void setResourcename(String resourcename) {
        this.resourcename = resourcename == null ? null : resourcename.trim();
    }

    public String getResourceuri() {
        return resourceuri;
    }

    public void setResourceuri(String resourceuri) {
        this.resourceuri = resourceuri == null ? null : resourceuri.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}