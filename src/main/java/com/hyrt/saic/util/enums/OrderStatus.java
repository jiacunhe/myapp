package com.hyrt.saic.util.enums;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 下午2:51
 * To change this template use File | Settings | File Templates.
 */
public enum OrderStatus {

    下单,审核中,通过审核,结束;

    @Override
    public String toString() {
        return String.valueOf((char)this.ordinal());    //To change body of overridden methods use File | Settings | File Templates.
    }

}
