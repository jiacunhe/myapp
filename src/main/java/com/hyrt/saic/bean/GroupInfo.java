package com.hyrt.saic.bean;

import java.sql.Timestamp;

public class GroupInfo {
    private Long id;

    private String groupName;

    private String legalPersonName;

    private String registrationCode;

    private String registeredCapital;

    private String currencyType;

    private String createTime;

    private String effectiveDate;

    private String deadline;

    private String groupType;

    private String status;

    private String address;

    private String permissionProject;

    private String generalProject;

    private String businessScope;

    private String businessMode;

    private String ra;

    private String lastInspectionYear;

    private String lastInspectionDate;

    private String remark;

    private Integer orderId;


    private Timestamp messageTime;

    public Timestamp getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Timestamp messageTime) {
        this.messageTime = messageTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getLegalPersonName() {
        return legalPersonName;
    }

    public void setLegalPersonName(String legalPersonName) {
        this.legalPersonName = legalPersonName;
    }

    public String getRegistrationCode() {
        return registrationCode;
    }

    public void setRegistrationCode(String registrationCode) {
        this.registrationCode = registrationCode;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    public String getCurrencyType() {
        return currencyType;
    }

    public void setCurrencyType(String currencyType) {
        this.currencyType = currencyType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(String effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPermissionProject() {
        return permissionProject;
    }

    public void setPermissionProject(String permissionProject) {
        this.permissionProject = permissionProject;
    }

    public String getGeneralProject() {
        return generalProject;
    }

    public void setGeneralProject(String generalProject) {
        this.generalProject = generalProject;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    public String getBusinessMode() {
        return businessMode;
    }

    public void setBusinessMode(String businessMode) {
        this.businessMode = businessMode;
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra;
    }

    public String getLastInspectionYear() {
        return lastInspectionYear;
    }

    public void setLastInspectionYear(String lastInspectionYear) {
        this.lastInspectionYear = lastInspectionYear;
    }

    public String getLastInspectionDate() {
        return lastInspectionDate;
    }

    public void setLastInspectionDate(String lastInspectionDate) {
        this.lastInspectionDate = lastInspectionDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}