package com.hyrt.saic.util.enums;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-31
 * Time: 上午11:30
 */
public enum UserStatus {
    NORMAL("正常"), LOCK("锁定");
    private String desc;

    private UserStatus(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
