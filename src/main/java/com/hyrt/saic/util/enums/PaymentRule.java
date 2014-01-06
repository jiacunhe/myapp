package com.hyrt.saic.util.enums;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午3:32
 */
public enum PaymentRule {
    PAY_BEFORE("先付费"), PAY_AFTER("后付费");
    String desc;

    private PaymentRule(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
