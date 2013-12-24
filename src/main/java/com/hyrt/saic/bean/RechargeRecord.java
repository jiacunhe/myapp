package com.hyrt.saic.bean;

import java.math.BigDecimal;
import java.util.Date;

public class RechargeRecord {
    private Integer id;

    private String userid;

    private Date chargetime;

    private Date createtime;

    private BigDecimal amount;

    private String chargetype;

    private String returnresult;

    private String status;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Date getChargetime() {
        return chargetime;
    }

    public void setChargetime(Date chargetime) {
        this.chargetime = chargetime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getChargetype() {
        return chargetype;
    }

    public void setChargetype(String chargetype) {
        this.chargetype = chargetype == null ? null : chargetype.trim();
    }

    public String getReturnresult() {
        return returnresult;
    }

    public void setReturnresult(String returnresult) {
        this.returnresult = returnresult == null ? null : returnresult.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}