package com.hyrt.saic.bean;

public class UserChagePackage {
    private Integer id;

    private String userid;

    private Integer chargepackageid;

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

    public Integer getChargepackageid() {
        return chargepackageid;
    }

    public void setChargepackageid(Integer chargepackageid) {
        this.chargepackageid = chargepackageid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}