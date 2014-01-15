package com.hyrt.saic.bean.order;

import com.hyrt.saic.util.enums.OrderStatus;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class Order {
    private String id;

    private String userId;

    private Integer businessId;

    private Integer orderType;

    private Integer cycle;

    private Integer loops;

    private BigDecimal sumMoney;

    private String status;

    private Timestamp createTime;

    private Timestamp payTime;

    private Timestamp verifyTime;

    private Timestamp finishTime;

    private String remark;

    private String requirement;




    public Order(){

    }

    public Order(String id,Integer businessType,Integer orderType ,Timestamp createTime,String userId,OrderStatus status,Integer cycle ){
        this.id = id;
        this.businessId = businessType;
        this.orderType = orderType;
        this.createTime = createTime;
        this.userId = userId;
        this.status = status.toString();
        this.cycle = cycle;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public Integer getCycle() {
        return cycle;
    }

    public void setCycle(Integer cycle) {
        this.cycle = cycle;
    }

    public Integer getLoops() {
        return loops;
    }

    public void setLoops(Integer loops) {
        this.loops = loops;
    }

    public BigDecimal getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(BigDecimal sumMoney) {
        this.sumMoney = sumMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;

    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getPayTime() {
        return payTime;
    }

    public void setPayTime(Timestamp payTime) {
        this.payTime = payTime;
    }

    public Timestamp getVerifyTime() {
        return verifyTime;
    }

    public void setVerifyTime(Timestamp verifyTime) {
        this.verifyTime = verifyTime;
    }

    public Timestamp getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Timestamp finishTime) {
        this.finishTime = finishTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

}