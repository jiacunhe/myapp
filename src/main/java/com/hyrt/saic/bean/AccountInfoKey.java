package com.hyrt.saic.bean;

import me.sfce.library.mybatis.domain.BasePojo;

public class AccountInfoKey extends BasePojo {
    private String userid;

    private Integer businessid;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getBusinessid() {
        return businessid;
    }

    public void setBusinessid(Integer businessid) {
        this.businessid = businessid;
    }
}