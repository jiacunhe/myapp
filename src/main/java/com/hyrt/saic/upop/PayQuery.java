package com.hyrt.saic.upop;

/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-3-5
 * Time: 上午11:40
 * To change this template use File | Settings | File Templates.
 */
public class PayQuery {

    public static void main(String[] aa){
        new PayQuery().queryTrans("01", "201403051128353", "20140305112835");
    }

    /**
     * 查询交易入口
     * @param transType 交易类型
     * @param orderNumber 商户订单号
     * @param orderTime  商户订单时间
     */
    public void queryTrans(String transType, String orderNumber, String orderTime) {
        String res = query(transType, orderNumber, orderTime);
        if (res != null && !"".equals(res)) {

            String[] arr = PayUtils.getResArr(res);

            if(checkSecurity(arr)){//验证签名
                merBusiness(arr);//商户业务逻辑
            }
        }else{
            System.out.println("报文格式为空");
        }
    }


    /**
     * 向银联发送查询请求
     * @param transType
     * @param orderNumber
     * @param orderTime
     * @return
     */
    public String query(String transType, String orderNumber, String orderTime) {
        String[] valueVo = new String[]{
                PayConf.version,//协议版本
                PayConf.charset,//字符编码
                transType,//交易类型
                PayConf.merCode,//商户代码
                orderNumber,//订单号
                orderTime,//交易时间
                ""//保留域  说明：如果是收单机构保留域需传收单代码如：{acqCode=00215800}，商户直接接入upop不传收单代码
        };
        PayUtils PayUtils = new PayUtils();
        return PayUtils.doPostQueryCmd(PayConf.queryUrl,new PayUtils().createBackStr(valueVo, PayConf.queryVo));

    }

    //验证签名
    public boolean checkSecurity(String[] arr){
        //验证签名
        int checkedRes = new PayUtils().checkSecurity(arr);
        if(checkedRes==1){
            return true;
        }else if(checkedRes == 0){
            System.out.println("验证签名失败");
            return false;
        }else if(checkedRes == 2){
            System.out.println("报文格式错误");
            return false;
        }
        return false;
    }

    //商户的业务逻辑
    public void merBusiness(String[] arr){
        /**
         * queryResult=0或者2时 respCode为00，其余情况下respCode为非全零的两位错误码
         * queryResult为空时报文格式错误
         * queryResult：
         * 0：成功（响应码respCode为00）
         * 1：失败（响应码respCode非00）
         * 2：处理中（响应码respCode为00）
         * 3：无此交易（响应码respCode非00）
         */

        //以下是商户业务处理
        String queryResult = "";
        for (int i = 0; i < arr.length; i++) {
            String[] queryResultArr = arr[i].split("=");
            // 处理商户业务逻辑
            if (queryResultArr.length >= 2 && "queryResult".equals(queryResultArr[0])) {
                queryResult = arr[i].substring(queryResultArr[0].length()+1);

                break;
            }
        }
        if(queryResult!=""){
            if ("0".equals(queryResult)) {
                System.out.println("交易成功");
            }
            if ("1".equals(queryResult)) {
                System.out.println("交易失败");
            }
            if ("2".equals(queryResult)) {
                System.out.println("交易处理中");
            }
            if ("3".equals(queryResult)) {
                System.out.println("无此交易");
            }
        }else{
            System.out.println("报文格式错误");
        }

    }
}
