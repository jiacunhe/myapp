package com.hyrt.saic.bean;

public class GroupExternalInvestment {
    private Long id;

    private Long groupid;

    private String groupname;

    private String registrationcode;

    private String registeredcapital;

    private String status;

    private String ra;

    private String contributionamount;

    private String currencytype;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroupid() {
        return groupid;
    }

    public void setGroupid(Long groupid) {
        this.groupid = groupid;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra == null ? null : ra.trim();
    }

    public String getContributionamount() {
        return contributionamount;
    }

    public void setContributionamount(String contributionamount) {
        this.contributionamount = contributionamount == null ? null : contributionamount.trim();
    }

    public String getCurrencytype() {
        return currencytype;
    }

    public void setCurrencytype(String currencytype) {
        this.currencytype = currencytype == null ? null : currencytype.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}