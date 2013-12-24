package com.hyrt.saic.bean;

public class UserApplyPackage {
    private Integer id;

    private String userid;

    private String assignorid;

    private String yearmonth;

    private Integer businessid;

    private Integer assignquantity;

    private Integer usedquantity;

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

    public String getYearmonth() {
        return yearmonth;
    }

    public void setYearmonth(String yearmonth) {
        this.yearmonth = yearmonth == null ? null : yearmonth.trim();
    }

    public Integer getBusinessid() {
        return businessid;
    }

    public void setBusinessid(Integer businessid) {
        this.businessid = businessid;
    }

    public Integer getAssignquantity() {
        return assignquantity;
    }

    public void setAssignquantity(Integer assignquantity) {
        this.assignquantity = assignquantity;
    }

    public Integer getUsedquantity() {
        return usedquantity;
    }

    public void setUsedquantity(Integer usedquantity) {
        this.usedquantity = usedquantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}