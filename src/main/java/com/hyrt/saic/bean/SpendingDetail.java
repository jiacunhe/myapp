package com.hyrt.saic.bean;

import java.math.BigDecimal;

public class SpendingDetail extends SpendingDetailKey {
    private BigDecimal amount;

    private BigDecimal lastbalance;

    private BigDecimal recharge;

    private String remark;

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getLastbalance() {
        return lastbalance;
    }

    public void setLastbalance(BigDecimal lastbalance) {
        this.lastbalance = lastbalance;
    }

    public BigDecimal getRecharge() {
        return recharge;
    }

    public void setRecharge(BigDecimal recharge) {
        this.recharge = recharge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}