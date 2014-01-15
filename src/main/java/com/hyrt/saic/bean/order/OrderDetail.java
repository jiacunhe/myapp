package com.hyrt.saic.bean.order;

import com.hyrt.saic.util.enums.OrderStatus;

public class OrderDetail {
    private Long id;

    private String orderId;

    private String monitorType;

    private String objName;

    private String objCode;

    private String certType;

    private String status;

    private String remark;

    private String statusName;

    public OrderDetail(){

    }

    public OrderDetail(String orderId,String monitorType,String objName, String objCode,String certType,OrderStatus status,String remark){
        this.objCode = objCode;
        this.orderId= orderId;
        this.monitorType=monitorType;
        this.objName=objName;
        this.certType=certType;
        this.status = status.toString();
        this.remark=remark;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getMonitorType() {
        return monitorType;
    }

    public void setMonitorType(String monitorType) {
        this.monitorType = monitorType;
    }

    public String getObjName() {
        return objName;
    }

    public void setObjName(String objName) {
        this.objName = objName;
    }

    public String getObjCode() {
        return objCode;
    }

    public void setObjCode(String objCode) {
        this.objCode = objCode;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    public String getCertType() {
        return certType;
    }

    public void setCertType(String certType) {
        this.certType = certType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
        if(status !=null && !"".equals(status.trim()))
            this.statusName= OrderStatus.values()[Integer.valueOf(status.trim())-1].name();
        else
            this.status = null;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}