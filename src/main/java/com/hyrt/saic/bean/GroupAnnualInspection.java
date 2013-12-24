package com.hyrt.saic.bean;

public class GroupAnnualInspection {
    private Long id;

    private Long groupid;

    private String inspectionyear;

    private String inspectionresult;

    private String inspectiondate;

    private String inspectiontype;

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

    public String getInspectionyear() {
        return inspectionyear;
    }

    public void setInspectionyear(String inspectionyear) {
        this.inspectionyear = inspectionyear == null ? null : inspectionyear.trim();
    }

    public String getInspectionresult() {
        return inspectionresult;
    }

    public void setInspectionresult(String inspectionresult) {
        this.inspectionresult = inspectionresult == null ? null : inspectionresult.trim();
    }

    public String getInspectiondate() {
        return inspectiondate;
    }

    public void setInspectiondate(String inspectiondate) {
        this.inspectiondate = inspectiondate == null ? null : inspectiondate.trim();
    }

    public String getInspectiontype() {
        return inspectiontype;
    }

    public void setInspectiontype(String inspectiontype) {
        this.inspectiontype = inspectiontype == null ? null : inspectiontype.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}