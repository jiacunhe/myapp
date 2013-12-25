package com.hyrt.saic.bean;


import java.sql.Timestamp;
import java.util.Date;

public class User {
    private String userid;

    private String password;

    private String username;

    private String linkman;

    private String telephone;

    private String moblephone;

    private String email;

    private String address;

    private Timestamp regtime;

    private Timestamp updatetime;

    private String usertype;

    private String certificate;

    private String certificatecode;

    private String creatorid;

    private String isbasal;

    private String trade;

    private String vocation;

    private String status;

    private Integer viplevel;

    private String paymentrule;

    private String remark;


    public User(){

    }
    public User(String userid){
              this.userid = userid;
    }
    public User(String userid,String password, String username,Timestamp regtime,String usertype,String paymentrule){
             this.userid = userid;
        this.password = password;
        this.paymentrule = paymentrule;
        this.username=username;
        this.regtime = regtime;
        this.usertype = usertype;
    }


    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getMoblephone() {
        return moblephone;
    }

    public void setMoblephone(String moblephone) {
        this.moblephone = moblephone == null ? null : moblephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Timestamp getRegtime() {
        return regtime;
    }

    public void setRegtime(Timestamp regtime) {
        this.regtime = regtime;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate == null ? null : certificate.trim();
    }

    public String getCertificatecode() {
        return certificatecode;
    }

    public void setCertificatecode(String certificatecode) {
        this.certificatecode = certificatecode == null ? null : certificatecode.trim();
    }

    public String getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(String creatorid) {
        this.creatorid = creatorid == null ? null : creatorid.trim();
    }

    public String getIsbasal() {
        return isbasal;
    }

    public void setIsbasal(String isbasal) {
        this.isbasal = isbasal == null ? null : isbasal.trim();
    }

    public String getTrade() {
        return trade;
    }

    public void setTrade(String trade) {
        this.trade = trade == null ? null : trade.trim();
    }

    public String getVocation() {
        return vocation;
    }

    public void setVocation(String vocation) {
        this.vocation = vocation == null ? null : vocation.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getViplevel() {
        return viplevel;
    }

    public void setViplevel(Integer viplevel) {
        this.viplevel = viplevel;
    }

    public String getPaymentrule() {
        return paymentrule;
    }

    public void setPaymentrule(String paymentrule) {
        this.paymentrule = paymentrule == null ? null : paymentrule.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}