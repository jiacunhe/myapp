package cn.com.hyrt.test;

import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.CommonService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.alibaba.fastjson.JSON;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:ApplicationContext.xml" })
public class FirstTest {

	private static final Logger logger = Logger.getLogger(FirstTest.class);

    @Autowired
	private CommonService commonService;


    @Test
    public void test1() {
        User u = (User)commonService.selectByPrimaryKey(User.class, "1");
        logger.info(JSON.toJSONStringWithDateFormat(u, "yyyy-MM-dd HH:mm:ss"));
        System.out.println("userName:"+u.getUsername()+"-----------------------");
    }

}
