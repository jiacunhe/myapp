package com.hyrt.saic.bean;

import java.util.Date;

public class UserChagePackage {
    private Integer id;

    private String userId;

    private Integer chargePackageId;

    private String remark;

    private Integer status;

    private Date createTime;


    public   UserChagePackage(){

    }


    public UserChagePackage(String userId,Integer status) {

        this.userId= userId; this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public Integer getChargePackageId() {
        return chargePackageId;
    }

    public void setChargePackageId(Integer chargePackageId) {
        this.chargePackageId = chargePackageId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}