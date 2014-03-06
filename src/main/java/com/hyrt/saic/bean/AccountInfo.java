package com.hyrt.saic.bean;

public class AccountInfo extends AccountInfoKey {
    private Integer remainder;



    private Integer businessId;
    private Integer totality;

    private String remark;

    public Integer getRemainder() {
        return remainder;
    }

    public void setRemainder(Integer remainder) {
        this.remainder = remainder;
    }

    public Integer getTotality() {
        return totality;
    }

    public void setTotality(Integer totality) {
        this.totality = totality;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }
}