package com.hyrt.saic.bean;

public class UserApplyPackage {
    private Integer id;

    private String userId;

    private String assignorId;

    private String yearMonth;

    private Integer businessId;

    private Integer assignQuantity;

    private Integer usedQuantity;

    private String remark;

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

    public String getAssignorId() {
        return assignorId;
    }

    public void setAssignorId(String assignorId) {
        this.assignorId = assignorId;
    }

    public String getYearMonth() {
        return yearMonth;
    }

    public void setYearMonth(String yearMonth) {
        this.yearMonth = yearMonth;
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public Integer getAssignQuantity() {
        return assignQuantity;
    }

    public void setAssignQuantity(Integer assignQuantity) {
        this.assignQuantity = assignQuantity;
    }

    public Integer getUsedQuantity() {
        return usedQuantity;
    }

    public void setUsedQuantity(Integer usedQuantity) {
        this.usedQuantity = usedQuantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}