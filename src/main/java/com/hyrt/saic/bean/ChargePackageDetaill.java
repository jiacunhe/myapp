package com.hyrt.saic.bean;

public class ChargePackageDetaill extends ChargePackageDetaillKey {
    private Integer businesstypeid;

    private Integer quantity;

    private String remark;

    public Integer getBusinesstypeid() {
        return businesstypeid;
    }

    public void setBusinesstypeid(Integer businesstypeid) {
        this.businesstypeid = businesstypeid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}