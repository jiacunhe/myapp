package cn.com.hyrt.test;

import com.hyrt.saic.util.enums.OrderStatus;
import org.springframework.util.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-30
 * Time: 下午3:25
 * To change this template use File | Settings | File Templates.
 */
public class MainTest {

    public static void main(String args[]){


        char [] chars = "中国梦".toCharArray();
        String asciiArgs="";
        for(char c:chars){
                         asciiArgs+="\\u"+Integer.toHexString(c);
        }
        System.out.println(asciiArgs+"-----------");
        System.out.println(OrderStatus.下单);


        String ppp="12,32,,,,,,,,22332,";

        System.out.println(ppp.split(",").length);

        for(String t:ppp.split(",")){
            System.out.println(t+"------------------");
        }


    }
}
