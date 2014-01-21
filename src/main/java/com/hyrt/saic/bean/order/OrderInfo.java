package com.hyrt.saic.bean.order;

import com.hyrt.saic.util.enums.OrderStatus;

import java.sql.Timestamp;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-30
 * Time: 下午1:23
 * To change this template use File | Settings | File Templates.
 */
public class OrderInfo {
 //   d.id,d.`orderId`,d.`monitorType`,d.`objCode`,d.`objName`,d.`certType`,d.`status`,d.`remark`,
  //  o.`orderType`,o.`createTime`,o.`userId`,o.`cycle`,
 //   t.`orderName`
    private Long id;
    private String orderId;
    private String userId;
    private String monitorType;
    private String objCode;
    private String objName;
    private String objCertType;
    private String status;
    private String orderType;
    private String createTime;
    private Integer cycle;
    private String remark;
    private String orderTypeName;

    private String statusName;

    private String monitorOverTime;
    public String getMonitorOverTime() {
        return monitorOverTime;
    }

    public void setMonitorOverTime(String monitorOverTime) {
        this.monitorOverTime = monitorOverTime;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMonitorType() {
        return monitorType;
    }

    public void setMonitorType(String monitorType) {
        this.monitorType = monitorType;
    }

    public String getObjCode() {
        return objCode;
    }

    public void setObjCode(String objCode) {
        this.objCode = objCode;
    }

    public String getObjName() {
        return objName;
    }

    public void setObjName(String objName) {
        this.objName = objName;
    }

    public String getObjCertType() {
        return objCertType;
    }

    public void setObjCertType(String objCertType) {
        this.objCertType = objCertType;
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

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getCycle() {
        return cycle;
    }

    public void setCycle(Integer cycle) {
        this.cycle = cycle;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOrderTypeName() {
        return orderTypeName;
    }

    public void setOrderTypeName(String orderTypeName) {
        this.orderTypeName = orderTypeName;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
