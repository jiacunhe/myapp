package com.hyrt.saic.bean;

public class GroupInfo {
    private Long id;

    private String groupname;

    private String legalpersonname;

    private String registrationcode;

    private String registeredcapital;

    private String currencytype;

    private String createtime;

    private String effectivedate;

    private String deadline;

    private String grouptype;

    private String status;

    private String address;

    private String permissionproject;

    private String generalproject;

    private String businessscope;

    private String businessmode;

    private String ra;

    private String lastinspectionyear;

    private String lastinspectiondate;

    private String remark;

    private Integer orderid;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public String getLegalpersonname() {
        return legalpersonname;
    }

    public void setLegalpersonname(String legalpersonname) {
        this.legalpersonname = legalpersonname == null ? null : legalpersonname.trim();
    }

    public String getRegistrationcode() {
        return registrationcode;
    }

    public void setRegistrationcode(String registrationcode) {
        this.registrationcode = registrationcode == null ? null : registrationcode.trim();
    }

    public String getRegisteredcapital() {
        return registeredcapital;
    }

    public void setRegisteredcapital(String registeredcapital) {
        this.registeredcapital = registeredcapital == null ? null : registeredcapital.trim();
    }

    public String getCurrencytype() {
        return currencytype;
    }

    public void setCurrencytype(String currencytype) {
        this.currencytype = currencytype == null ? null : currencytype.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getEffectivedate() {
        return effectivedate;
    }

    public void setEffectivedate(String effectivedate) {
        this.effectivedate = effectivedate == null ? null : effectivedate.trim();
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline == null ? null : deadline.trim();
    }

    public String getGrouptype() {
        return grouptype;
    }

    public void setGrouptype(String grouptype) {
        this.grouptype = grouptype == null ? null : grouptype.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPermissionproject() {
        return permissionproject;
    }

    public void setPermissionproject(String permissionproject) {
        this.permissionproject = permissionproject == null ? null : permissionproject.trim();
    }

    public String getGeneralproject() {
        return generalproject;
    }

    public void setGeneralproject(String generalproject) {
        this.generalproject = generalproject == null ? null : generalproject.trim();
    }

    public String getBusinessscope() {
        return businessscope;
    }

    public void setBusinessscope(String businessscope) {
        this.businessscope = businessscope == null ? null : businessscope.trim();
    }

    public String getBusinessmode() {
        return businessmode;
    }

    public void setBusinessmode(String businessmode) {
        this.businessmode = businessmode == null ? null : businessmode.trim();
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra == null ? null : ra.trim();
    }

    public String getLastinspectionyear() {
        return lastinspectionyear;
    }

    public void setLastinspectionyear(String lastinspectionyear) {
        this.lastinspectionyear = lastinspectionyear == null ? null : lastinspectionyear.trim();
    }

    public String getLastinspectiondate() {
        return lastinspectiondate;
    }

    public void setLastinspectiondate(String lastinspectiondate) {
        this.lastinspectiondate = lastinspectiondate == null ? null : lastinspectiondate.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }
}