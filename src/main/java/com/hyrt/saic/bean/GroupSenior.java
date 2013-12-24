package com.hyrt.saic.bean;

public class GroupSenior {
    private Long id;

    private Long groupid;

    private String seniorname;

    private String position;

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

    public String getSeniorname() {
        return seniorname;
    }

    public void setSeniorname(String seniorname) {
        this.seniorname = seniorname == null ? null : seniorname.trim();
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}