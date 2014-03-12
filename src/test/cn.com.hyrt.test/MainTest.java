package cn.com.hyrt.test;

import com.hyrt.saic.util.enums.OrderStatus;

import org.springframework.util.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: yang
 * Date: 13-12-30
 * Time: 下午3:25
 * To change this template use File | Settings | File Templates.
 */
public class MainTest {

    public static void main(String args[]){


       /* char [] chars = "中国梦".toCharArray();
        String asciiArgs="";
        for(char c:chars){
                         asciiArgs+="\\u"+Integer.toHexString(c);
        }
        System.out.println(asciiArgs+"-----------");



        String ppp="12,32,,,,,,,,22332,";

        System.out.println(ppp.split(",").length);

        for(String t:ppp.split(",")){
            System.out.println(t+"------------------");
        }
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(sdf.format(cal.getTime()));

        cal.add(Calendar.MONTH,-12);

        System.out.println(sdf.format(cal.getTime()));


        */
String sss="/manage/images/*";
        String  url="/manage/images/abc.jpg";
        String acb= url.substring(url.indexOf("/")+1,url.length());

        System.out.println(acb.substring(0,acb.lastIndexOf("/")));
        System.out.println(sss.lastIndexOf("*"));
        System.out.println(sss.length());
        System.out.println(sss.contains("/manage/images/"));

        String  urls="<span id=/\"tiao/\">3</span>";

        System.out.println(urls);
        Calendar cal = Calendar.getInstance();

        String beginDate="20140312133751";

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat abc=new SimpleDateFormat("yyyy-MM-dd,HH:mm:ss");
        Date sd=new Date();
        try {
            sd = sdf.parse(beginDate);
        }catch  (Exception e){

        }


        System.out.println(abc.format(sd));
    }
}
