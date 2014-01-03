package com.hyrt.saic.bean;

import java.math.BigDecimal;

public class ChargePackageResultMap {

    private Integer id;

    private String packageName;

    private BigDecimal price;

    private String type;

    private String userId;

    private String remark;

    private Integer detailId;

    private Integer  detailPackageId;

    private Integer  detailBusinessTypeId;

    private Integer  detailQuantity;

    private String  detailRemark;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(Integer detailId) {
        this.detailId = detailId;
    }

    public Integer getDetailPackageId() {
        return detailPackageId;
    }

    public void setDetailPackageId(Integer detailPackageId) {
        this.detailPackageId = detailPackageId;
    }

    public Integer getDetailBusinessTypeId() {
        return detailBusinessTypeId;
    }

    public void setDetailBusinessTypeId(Integer detailBusinessTypeId) {
        this.detailBusinessTypeId = detailBusinessTypeId;
    }

    public Integer getDetailQuantity() {
        return detailQuantity;
    }

    public void setDetailQuantity(Integer detailQuantity) {
        this.detailQuantity = detailQuantity;
    }

    public String getDetailRemark() {
        return detailRemark;
    }

    public void setDetailRemark(String detailRemark) {
        this.detailRemark = detailRemark;
    }
}
