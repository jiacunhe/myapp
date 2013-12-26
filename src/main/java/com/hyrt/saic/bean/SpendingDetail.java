package com.hyrt.saic.bean;

public class SpendingDetail extends SpendingDetailKey {
    private Integer businessid;

    private Integer amount;

    private Integer lastbalance;

    private Integer recharge;

    private String remark;

    public Integer getBusinessid() {
        return businessid;
    }

    public void setBusinessid(Integer businessid) {
        this.businessid = businessid;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getLastbalance() {
        return lastbalance;
    }

    public void setLastbalance(Integer lastbalance) {
        this.lastbalance = lastbalance;
    }

    public Integer getRecharge() {
        return recharge;
    }

    public void setRecharge(Integer recharge) {
        this.recharge = recharge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}