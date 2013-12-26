package com.hyrt.saic.bean;

public class AccountInfo {
    private String userId;

    private Integer businessId;

    private Integer balance;

    private Integer summation;

    private String remark;

    public String getUserid() {
        return userId;
    }

    public void setUserid(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public Integer getSummation() {
        return summation;
    }

    public void setSummation(Integer summation) {
        this.summation = summation;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}