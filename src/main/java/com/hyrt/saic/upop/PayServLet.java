package com.hyrt.saic.upop;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-3-3
 * Time: 下午2:47
 * To change this template use File | Settings | File Templates.
 */
/**
 * 名称：支付请求类
 * 功能：servlet方式支付类请求
 * 类属性：
 * 版本：1.0
 * 日期：2011-03-11
 * 作者：中国银联UPOP团队
 * 版权：中国银联
 * 说明：以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。该代码仅供参考。
 * */
public class PayServLet extends HttpServlet {

    private static final long serialVersionUID = 5191660078482341448L;
    /**
     *
     */

    static int i= 0;
    public void init() {

    }

    public void service(HttpServletRequest request, HttpServletResponse response) {
        //商户需要组装如下对象的数据
        String[] valueVo = new String[]{
                PayConf.version,//协议版本
                PayConf.charset,//字符编码
                "01",//交易类型
                "",//原始交易流水号
                PayConf.merCode,//商户代码
                PayConf.merName,//商户简称
                "",//收单机构代码（仅收单机构接入需要填写）
                "",//商户类别（收单机构接入需要填写）
                "http://218.80.192.2231/shop1/payment/quickpay/quickpay_result.php?payid=123456&dd=123",//商品URL
                "物品名称如短袖",//商品名称
                "3000",//商品单价 单位：分
                "1",//商品数量
                "0",//折扣 单位：分
                "1000",//运费 单位：分
                new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+(++i),//订单号（需要商户自己生成）
                "3100",//交易金额 单位：分
                "156",//交易币种
                new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()),//交易时间
                "127.0.0.1",//用户IP
                "张三",//用户真实姓名
                "",//默认支付方式
                "",//默认银行编号
                "300000",//交易超时时间
                PayConf.merFrontEndUrl,// 前台回调商户URL
                PayConf.merBackEndUrl,// 后台回调商户URL
                ""//商户保留域
        };

        String signType = request.getParameter("sign");
        if (!PayConf.signType_SHA1withRSA.equalsIgnoreCase(signType)) {
            signType = PayConf.signType;
        }

        String html = new PayUtils().createPayHtml(valueVo, signType);//跳转到银联页面支付

        response.setContentType("text/html;charset="+PayConf.charset);
        response.setCharacterEncoding(PayConf.charset);
        try {
            response.getWriter().write(html);
        } catch (IOException e) {

        }
        response.setStatus(HttpServletResponse.SC_OK);
    }



}
