package com.hyrt.saic.util.enums;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-27
 * Time: 下午2:51
 * To change this template use File | Settings | File Templates.
 */
public enum OrderStatus {

    下单,审核中,通过审核,进行中,结束,查询无果,未通过审核,账户支付失败;

    @Override
    public String toString() {
        return (this.ordinal()+1)+"";    //To change body of overridden methods use File | Settings | File Templates.
    }

}
