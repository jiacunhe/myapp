package com.hyrt.saic.bean;

public class GroupShareholderInfo {
    private Long id;

    private Long groupid;

    private String shareholder;

    private String contributionamount;

    private String currencytype;

    private String contributiondate;

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

    public String getShareholder() {
        return shareholder;
    }

    public void setShareholder(String shareholder) {
        this.shareholder = shareholder == null ? null : shareholder.trim();
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

    public String getContributiondate() {
        return contributiondate;
    }

    public void setContributiondate(String contributiondate) {
        this.contributiondate = contributiondate == null ? null : contributiondate.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}