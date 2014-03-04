package com.hyrt.saic.controller;

import com.hyrt.saic.upop.PayConf;
import com.hyrt.saic.upop.PayUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-3-3
 * Time: 下午3:30
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/pay")
public class PayController {
    static int i= 0;
    @RequestMapping(value = "/action")
    public void payAction(HttpServletRequest request,HttpServletResponse response){
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
                "http://localhost:8080/package/buy",//商品URL
                "201401-A套餐",//商品名称
                "10",//商品单价 单位：分
                "1",//商品数量
                "0",//折扣 单位：分
                "10",//运费 单位：分
                new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+(++i),//订单号（需要商户自己生成）
                "31",//交易金额 单位：分
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



    @RequestMapping(value = "/back")
    public void payBack(HttpServletRequest request,HttpServletResponse response){

        try {
            request.setCharacterEncoding(PayConf.charset);
        } catch (UnsupportedEncodingException e) {
        }

        String[] resArr = new String[PayConf.notifyVo.length];
        for(int i=0;i<PayConf.notifyVo.length;i++){
            resArr[i] = request.getParameter(PayConf.notifyVo[i]);
        }
        String signature = request.getParameter(PayConf.signature);
        String signMethod = request.getParameter(PayConf.signMethod);

        response.setContentType("text/html;charset="+PayConf.charset);
        response.setCharacterEncoding(PayConf.charset);

        try {
            Boolean signatureCheck = new PayUtils().checkSign(resArr, signMethod, signature);
            System.out.println("校验签名是否正确"+signatureCheck);
            response.getWriter()
                    .append("建议前台通知和后台通知用两个类实现，后台通知进行商户的数据库等处理,前台通知实现客户浏览器跳转<br>")
                    .append("签名是否正确："+ signatureCheck)
                    .append("<br>交易是否成功："+"00".equals(resArr[10]));
            if(!"00".equals(resArr[10])){
                response.getWriter().append("<br>失败原因:"+resArr[11]);
            }
        } catch (IOException e) {

        }

        response.setStatus(HttpServletResponse.SC_OK);



    }

}
