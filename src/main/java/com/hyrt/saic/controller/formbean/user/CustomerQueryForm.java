package com.hyrt.saic.controller.formbean.user;

import com.hyrt.saic.util.enums.UserStatus;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-11
 * Time: 上午11:07
 */
public class CustomerQueryForm {
    private String condition;
    private String userId;
    private String username;
    private String creatorId;
    private String telephone;
    private String startTime;
    private String endTime;
    private String paymentRule;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = null != status ? UserStatus.NORMAL.toString(): "";
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPaymentRule() {
        return paymentRule;
    }

    public void setPaymentRule(String paymentRule) {
        this.paymentRule = paymentRule;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
