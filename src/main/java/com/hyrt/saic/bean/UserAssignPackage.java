package com.hyrt.saic.bean;

import java.util.Date;

public class UserAssignPackage {
    private Integer id;

    private String userid;

    private String assignorid;

    private Integer businessid;

    private Integer quantity;

    private Integer durationmonths;

    private Date createtime;

    private String effectivetype;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getAssignorid() {
        return assignorid;
    }

    public void setAssignorid(String assignorid) {
        this.assignorid = assignorid == null ? null : assignorid.trim();
    }

    public Integer getBusinessid() {
        return businessid;
    }

    public void setBusinessid(Integer businessid) {
        this.businessid = businessid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getDurationmonths() {
        return durationmonths;
    }

    public void setDurationmonths(Integer durationmonths) {
        this.durationmonths = durationmonths;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getEffectivetype() {
        return effectivetype;
    }

    public void setEffectivetype(String effectivetype) {
        this.effectivetype = effectivetype == null ? null : effectivetype.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}