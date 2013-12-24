package com.hyrt.saic.bean;

public class OrderDetail {
    private Long id;

    private String orderid;

    private String monitortype;

    private String objname;

    private String objcode;

    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public String getMonitortype() {
        return monitortype;
    }

    public void setMonitortype(String monitortype) {
        this.monitortype = monitortype == null ? null : monitortype.trim();
    }

    public String getObjname() {
        return objname;
    }

    public void setObjname(String objname) {
        this.objname = objname == null ? null : objname.trim();
    }

    public String getObjcode() {
        return objcode;
    }

    public void setObjcode(String objcode) {
        this.objcode = objcode == null ? null : objcode.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}