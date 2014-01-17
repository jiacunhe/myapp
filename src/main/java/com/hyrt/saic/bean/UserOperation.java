package com.hyrt.saic.bean;

import me.sfce.library.mybatis.domain.BasePojo;

import java.util.Date;

public class UserOperation extends BasePojo {
    private Integer id;
    private String userId;
    private String resourceUri;
    private String description;
    private Date operateTime;
    private String remark;

    public UserOperation() {}

    public UserOperation(String userId, String resourceUri, String description, Date operateTime, String remark) {
        this.userId = userId;
        this.resourceUri = resourceUri;
        this.description = description;
        this.operateTime = operateTime;
        this.remark = remark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getResourceUri() {
        return resourceUri;
    }

    public void setResourceUri(String resourceUri) {
        this.resourceUri = resourceUri;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}