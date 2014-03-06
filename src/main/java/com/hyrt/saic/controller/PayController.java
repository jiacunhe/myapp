package com.hyrt.saic.controller;

import com.hyrt.saic.bean.ChargePackage;
import com.hyrt.saic.bean.RechargeRecord;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.bean.UserOperation;
import com.hyrt.saic.service.AccountInfoService;
import com.hyrt.saic.service.PackageService;
import com.hyrt.saic.service.RechargeRecordService;
import com.hyrt.saic.service.UserOperationService;
import com.hyrt.saic.upop.PayConf;
import com.hyrt.saic.upop.PayUtils;
import com.hyrt.saic.util.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

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
    static int i = 0;
    @Autowired
    RechargeRecordService rechargeRecordService;
    @Autowired
    AccountInfoService accountInfoService;
    @Autowired
    PackageService packageService;
    @Autowired
    UserOperationService userOperationService;
    @RequestMapping(value = "/action")
    public void payAction(String packageName,String packageId, HttpServletRequest request, HttpServletResponse response) {

        String goodsName = "";
        String packageType = "";
        String packagePrice = "";

        int goodsNum = 1;//商品数量
        String tradePrice = "";
        //用户信息
        User user =(User) request.getSession().getAttribute("user");
        String ip = request.getHeader(" x-forwarded-for ");
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
            ip = request.getHeader(" Proxy-Client-IP ");
        }
        if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
            ip = request.getHeader(" WL-Proxy-Client-IP ");
        }
        if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
            goodsName =  packageName;
        if (request.getParameter("packageType") != null)
            packageType =  request.getParameter("packageType");
        if (request.getParameter("packagePrice") != null) {
            packagePrice =   request.getParameter("packagePrice");
            BigDecimal packageP = new BigDecimal(packagePrice);
            packagePrice = String.valueOf((packageP.multiply(new BigDecimal(100))).intValue());//元转换为分
            tradePrice = String.valueOf((packageP.multiply(new BigDecimal(100)).multiply(new BigDecimal(goodsNum))).intValue());
        }
        if (request.getAttribute("packageId") != null)
            packageId = (String) request.getAttribute("packageId");
        String orderTime=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String orderId= orderTime + (++i);

        //插入订单信息
        RechargeRecord record=new RechargeRecord();
        record.setUserId(  user.getUserId());
        record.setChargeTime(new Date());//支付成功时间
        record.setCreateTime(new Date());
        record.setAmount((new BigDecimal(request.getParameter("packagePrice"))).multiply(new BigDecimal(goodsNum)));
        record.setPackageId(Integer.valueOf(packageId));
        record.setStatus("0");
        record.setChargeType(Config.USER_RECHAEGE_RECOED_TYPE);
        record.setRemark(orderId);//订单号
        rechargeRecordService.insertUserRechargeRecord(record);
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
                basePath+"/package/confirm?packageId=" + packageId,//商品URL
                packageType + "--" + goodsName,//商品名称
                packagePrice,//商品单价 单位：分
                String.valueOf(goodsNum),//商品数量
                "0",//折扣 单位：分
                "0",//运费 单位：分
                orderId,//订单号（需要商户自己生成）
                tradePrice,//交易金额 单位：分
                "156",//交易币种
                orderTime,//交易时间
                ip,//用户IP
                user.getUserId(),//用户真实姓名
                "",//默认支付方式
                "",//默认银行编号
                "300000",//交易超时时间
                PayConf.merFrontEndUrl,// 前台回调商户URL
                PayConf.merBackEndUrl,// 后台回调商户URL
                ""//商户保留域
        };

        String signType = request.getParameter("sign");//签名类型，默认的是MD5
        if (!PayConf.signType_SHA1withRSA.equalsIgnoreCase(signType)) {
            signType = PayConf.signType;
        }

        String html = new PayUtils().createPayHtml(valueVo, signType);//跳转到银联页面支付
        UserOperation operation = new UserOperation(record.getUserId(), "/pay/action",goodsName+ " 套餐订单请求支付，请求时间"+orderTime+",交易金额："+request.getParameter("packagePrice"), new Date(), "订单号："+orderId);
        userOperationService.save(operation);
        response.setContentType("text/html;charset=" + PayConf.charset);
        response.setCharacterEncoding(PayConf.charset);
        try {
            response.getWriter().write(html);
        } catch (IOException e) {

        }

        response.setStatus(HttpServletResponse.SC_OK);
    }


    @RequestMapping(value = "/back")
    public void payBack(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding(PayConf.charset);
        } catch (UnsupportedEncodingException e) {
        }

        String[] resArr = new String[PayConf.notifyVo.length];
        for (int i = 0; i < PayConf.notifyVo.length; i++) {
            resArr[i] = request.getParameter(PayConf.notifyVo[i]);
        }
        String signature = request.getParameter(PayConf.signature);
        String signMethod = request.getParameter(PayConf.signMethod);

        response.setContentType("text/html;charset=" + PayConf.charset);
        response.setCharacterEncoding(PayConf.charset);

        try {
            Boolean signatureCheck = new PayUtils().checkSign(resArr, signMethod, signature);

        if(signatureCheck){
            //更改购买状态//增加用户的查询数
          if("00".equals(resArr[10])){
            request.setAttribute("tradeStatus","交易成功");
            String userIdReturn=resArr[5];
            String orderId=resArr[8];
            String returnqid=resArr[9];
            RechargeRecord record=new RechargeRecord();
            record=rechargeRecordService.updateRechargeRecordByOrderId(orderId,returnqid);//两个更新在一个方法中
            Map cPackage= packageService.selectById(record.getPackageId());
            UserOperation operation = new UserOperation(record.getUserId(), "/pay/back",cPackage.get("packageName")+ " 套餐订单支付完成：交易成功,完成时间"+resArr[12]+",交易金额："+String.valueOf(new BigDecimal(resArr[6]).divide(new BigDecimal(100),2,BigDecimal.ROUND_UNNECESSARY))+",订单号："+orderId+",交易流水号："+returnqid, new Date(),request.getRemoteAddr() );
            userOperationService.save(operation);
          }
           //显示用户提示信息
           /*
            request.setAttribute("packageName",cPackage.get("packageName"));
              request.setAttribute("tradeTime",record.getChargeTime());
              request.setAttribute("packageName",cPackage.get("packageName"));
              request.setAttribute("orderAmount",new BigDecimal(resArr[6]));
            }*/
           if (!"00".equals(resArr[10])) {
             /*  request.setAttribute("tradeStatus","交易失败");
               request.setAttribute("failMessage",resArr[11]);*/
               RechargeRecord record=new RechargeRecord();
               record=rechargeRecordService.getRechargeRecordByOrderId(resArr[8]);
               Map cPackage= packageService.selectById(record.getPackageId());
               UserOperation operation = new UserOperation(record.getUserId(), "/pay/back",cPackage.get("packageName")+ " 套餐订单支付完成：交易失败,失败原因:"+resArr[11]+ ",失败时间"+resArr[12]+",交易金额："+String.valueOf(new BigDecimal(resArr[6]).divide(new BigDecimal(100),2,BigDecimal.ROUND_UNNECESSARY))+",订单号："+resArr[8]+"，交易流水号："+resArr[9], new Date() ,request.getRemoteAddr());
               userOperationService.save(operation);
            }



            }else{
              /*  request.setAttribute("tradeStatus","交易失败");
                request.setAttribute("failMessage","签名校验失败");*/
            RechargeRecord record=new RechargeRecord();
            record=rechargeRecordService.getRechargeRecordByOrderId(resArr[8]);
            Map cPackage= packageService.selectById(record.getPackageId());
            UserOperation operation = new UserOperation(record.getUserId(), "/pay/back",cPackage.get("packageName")+ " 套餐订单支付完成：交易失败,失败原因:"+"签名校验失败"+ ",失败时间"+resArr[12]+",交易金额："+String.valueOf(new BigDecimal(resArr[6]).divide(new BigDecimal(100),2,BigDecimal.ROUND_UNNECESSARY))+",订单号："+resArr[8]+"，交易流水号:"+resArr[9] , new Date(),request.getRemoteAddr());
            }
        } catch (Exception e) {

        }

        response.setStatus(HttpServletResponse.SC_OK);


    }

}
