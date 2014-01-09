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

    private String id;

    private String userId;

    private String orderType;

    private String createTime;

    private String payTime;

    private String verifyTime;

    private String finishTime;

    private String status;

    private Integer total=0;

    private Integer doneNum=0;

    private Integer undoneNum=0;

    private String remark;

    private String orderTypeName;

    private String statusName;

    public String getOrderTypeName() {
        return orderTypeName;
    }

    public void setOrderTypeName(String orderTypeName) {
        this.orderTypeName = orderTypeName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
        if( this.total==null)  this.total=0;
    }

    public Integer getDoneNum() {
        return doneNum;
    }

    public void setDoneNum(Integer doneNum) {
        this.doneNum = doneNum;
        if( this.doneNum==null)  this.doneNum=0;
    }

    public Integer getUndoneNum() {
        return undoneNum;
    }

    public void setUndoneNum(Integer undoneNum) {
        this.undoneNum = undoneNum;
        if( this.undoneNum==null)  this.undoneNum=0;

    }


    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public String getVerifyTime() {
        return verifyTime;
    }

    public void setVerifyTime(String verifyTime) {
        this.verifyTime = verifyTime;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        statusName = statusName;
    }
}
