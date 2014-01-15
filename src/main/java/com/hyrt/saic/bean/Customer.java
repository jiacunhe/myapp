package com.hyrt.saic.bean;

import com.hyrt.saic.util.enums.PaymentRule;

import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午3:14
 */
@Table(name="t_user")
public class Customer extends User {
    private String linkman; //联系人
    private String telephone; //电话
    private String mobilePhone; //手机
    private String email;
    private String address;
    private String certificate; //证件
    private String certificateCode; //证件号
    private Boolean isChild;
    private String trade; // 行业
    private String vocation; //职业
    private PaymentRule paymentRule; // 付费规则

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getCertificateCode() {
        return certificateCode;
    }

    public void setCertificateCode(String certificateCode) {
        this.certificateCode = certificateCode;
    }

    public Boolean getIsChild() {
        return isChild;
    }

    public void setChild(Boolean child) {
        isChild = child;
    }

    public String getTrade() {
        return trade;
    }

    public void setTrade(String trade) {
        this.trade = trade;
    }

    public String getVocation() {
        return vocation;
    }

    public void setVocation(String vocation) {
        this.vocation = vocation;
    }

    public PaymentRule getPaymentRule() {
        return paymentRule;
    }

    public void setPaymentRule(PaymentRule paymentRule) {
        this.paymentRule = paymentRule;
    }
}
