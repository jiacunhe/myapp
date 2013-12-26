package com.hyrt.saic.bean;

import com.hyrt.saic.util.enums.PersonGroupInfoType;

public class PersonGroupInfo {
    private Long id;

    private String persontype;

    private String a;

    private String b;

    private String c;

    private String d;

    private String e;

    private String f;

    private String g;

    private String remark;

    private String orderid;


    public  PersonGroupInfo(){

    }
    public  PersonGroupInfo(PersonGroupInfoType persontype,String a){
                                      this.a = a;
        this.persontype = persontype.toString();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPersontype() {
        return persontype;
    }

    public void setPersontype(PersonGroupInfoType persontype) {
        this.persontype = persontype == null ? null : persontype.toString();
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a == null ? null : a.trim();
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b == null ? null : b.trim();
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c == null ? null : c.trim();
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d == null ? null : d.trim();
    }

    public String getE() {
        return e;
    }

    public void setE(String e) {
        this.e = e == null ? null : e.trim();
    }

    public String getF() {
        return f;
    }

    public void setF(String f) {
        this.f = f == null ? null : f.trim();
    }

    public String getG() {
        return g;
    }

    public void setG(String g) {
        this.g = g == null ? null : g.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }
}