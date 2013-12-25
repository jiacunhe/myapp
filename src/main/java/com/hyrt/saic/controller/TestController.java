package com.hyrt.saic.controller;

import com.hyrt.saic.bean.PersonGroupInfo;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.CommonService;
import com.hyrt.saic.util.enums.DataOperateType;
import com.hyrt.saic.util.enums.PersonGroupInfoType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.*;

@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    private CommonService commonService;


    @RequestMapping("/test")
    public String test(@ModelAttribute("user") User user, HttpServletRequest request){


        if(user.getUserid().equals("ftl")){
            request.setAttribute("name","ftl");
            return   "/index.ftl";
        }else{
            request.setAttribute("name","jsp");
            return   "/index.jsp";
        }

    }





    //按主键查询
    @RequestMapping("/select")
    public String selectByPrimaryKey(HttpServletRequest request){



        try {
            PersonGroupInfo p = (PersonGroupInfo)commonService.selectByPrimaryKey(PersonGroupInfo.class, 1);
            request.setAttribute("name",p.getA());
            return "index.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("name","error:"+e.getMessage());
            return "index.ftl";
        }


    }

    //增删改全套服务 ，同一个事务内完成
    @RequestMapping("/testall")
    public String testAll(HttpServletRequest request){

        try {

            User u = new User( "1","2","2",new  Timestamp(new Date().getTime()),"3","3");
            User u2 = new User( "9999");
            PersonGroupInfo p = new PersonGroupInfo(PersonGroupInfoType.legal,"测试员5");
            PersonGroupInfo p2 = new PersonGroupInfo(PersonGroupInfoType.senior,"测试员6");

            Map<DataOperateType,List<Object>> params = new HashMap<DataOperateType,List<Object>>();
            List list1 = new ArrayList();
            list1.add(p);
            list1.add(p2);

            List list2 = new ArrayList();
            list2.add(u) ;

            List list3 = new ArrayList();
            list3.add(u2) ;

            params.put(DataOperateType.INSERT,list1);
            params.put(DataOperateType.UPDATE,list2) ;
            params.put(DataOperateType.DELETE,list3);
            commonService.saveOrUpdateOrDeleteAll(params);
            request.setAttribute("name","dddddddd");
            return "index.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("name","error:"+e.getMessage());
            return "index.ftl";
        }

    }



    /*
    * 用sql直接查询 ，不建议使用
    **/
    @RequestMapping("/testsql")
    public String testSql(HttpServletRequest request){

          String sql = "select * from t_user";
          List<Map> list = commonService.selectBySql(sql) ;
          request.setAttribute("name",list.get(0).values());
          return "index.jsp";

    }


    /*
* 用sql直接查询 ，带分页，不建议使用
**/
    @RequestMapping("/testsqlpage")
    public String testSqlByPage(Integer page,HttpServletRequest request){
        int pagesize = 5;
        String sql = "select * from t_user order by regtime desc ";
        Map resmap = commonService.selectBySql(sql,page,pagesize);
        request.setAttribute("totalitem",resmap.get("totalitem"));    //总元素
        request.setAttribute("totalpage",resmap.get("totalpage"));    //总页数
        request.setAttribute("page",resmap.get("page"));    //当前页
        request.setAttribute("list",resmap.get("list"));    //查询结果list
        request.setAttribute("name",((List)resmap.get("list")).size());
        return "index.jsp";

    }
}
