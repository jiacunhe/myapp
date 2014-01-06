package com.hyrt.saic.util.enums;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午3:50
 */
public enum UserType {
    /**
     * 默认
     */
    MANAGER("管理员"),
    CUSTOMER("客户");

    private String desc;

    private UserType(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public static UserType getByOrdinal(int ordinal) {
        for (UserType userType : UserType.values()) {
            if (userType.ordinal() == ordinal) {
                return userType;
            }
        }
        return UserType.MANAGER;
    }
}
