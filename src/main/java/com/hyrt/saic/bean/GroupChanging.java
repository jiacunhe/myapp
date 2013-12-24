package com.hyrt.saic.bean;

public class GroupChanging {
    private Long id;

    private Long groupid;

    private String changeitem;

    private String beforechange;

    private String afterchange;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroupid() {
        return groupid;
    }

    public void setGroupid(Long groupid) {
        this.groupid = groupid;
    }

    public String getChangeitem() {
        return changeitem;
    }

    public void setChangeitem(String changeitem) {
        this.changeitem = changeitem == null ? null : changeitem.trim();
    }

    public String getBeforechange() {
        return beforechange;
    }

    public void setBeforechange(String beforechange) {
        this.beforechange = beforechange == null ? null : beforechange.trim();
    }

    public String getAfterchange() {
        return afterchange;
    }

    public void setAfterchange(String afterchange) {
        this.afterchange = afterchange == null ? null : afterchange.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}