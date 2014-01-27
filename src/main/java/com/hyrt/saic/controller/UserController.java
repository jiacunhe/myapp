package com.hyrt.saic.controller;

import com.alibaba.fastjson.JSON;
import com.hyrt.saic.bean.SysMessage;
import com.hyrt.saic.bean.User;
import com.hyrt.saic.service.UserService;
import me.sfce.library.mybatis.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 13-12-27
 * Time: 下午2:57
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @RequestMapping("/checkUserId")
    public
    @ResponseBody
    String check(String userId) {
        return String.valueOf(userService.checkUserId(userId));
    }

    @RequestMapping("/password/check")
    public
    @ResponseBody
    String checkPassword(String userId, String password) {
        return String.valueOf(userService.checkPassword(userId, password));
    }

    @RequestMapping(value = "/password/modify", method = RequestMethod.POST)
    public String modifyPassword(String userId, String password) {
        userService.modifyPassword(userId, password);
        return redirectTo("result");
    }

    @RequestMapping(value = "/password/result", method = RequestMethod.GET)
    public String modifyPasswordResult() {
        return jsp("/manage/passwordResult");
    }

    @RequestMapping(value = "/password/modify/UI", method = RequestMethod.GET)
    public String modifyPasswordUI() {
        return jsp("/manage/password");
    }

    @RequestMapping("/info")
    public String userInfo(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        User user2 = userService.getById(userId);
        return "userInfo.jsp";
    }

    @RequestMapping("/message")
    public String userMessageList(String messageType, String messageStatus, String recentTime, Integer pageNo, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (null == pageNo) {
            pageNo = 1;
        }

        Page page = new Page();
        if (messageType != null&&!"".equals(messageType))
            page.put("messageType", messageType);
        if (messageStatus != null&&!"".equals(messageStatus))
            page.put("messageStatus", messageStatus);
        if (recentTime != null&&!"".equals(recentTime)) {
            page.put("recentTime",recentTime);
        }
        if (user != null) {
            page.put("userId",user.getUserId());
        }
        page.setPageNo(pageNo);
        List sysMessageList = userService.getUserMessage(page);
        page.setResults(sysMessageList);
        request.setAttribute("page", page);
        return "/user/userMessage.jsp";
    }
    @RequestMapping(value="/changeMessageStatusAjax", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody String changeMessageStatusAjax(String[] messageIds,HttpServletRequest request){
        StringBuffer sb=new StringBuffer();
         Map result=new HashMap();
        if(messageIds.length>0){
            for(String ids:messageIds){
                sb.append(ids);
                sb.append(",");
            }
            sb.deleteCharAt(sb.length()-1);
        }

        try {
            userService.changeMessageStatus(sb.toString());
            result.put("res","success");
        } catch (Exception e) {
            result.put("res","fail");
            e.printStackTrace();
        }
        return  JSON.toJSONString(result);

    }

    @RequestMapping(value="/deleteMessageByIdsAjax", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody String deleteMessageByIdsAjax(String[] messageIds,HttpServletRequest request){
        StringBuffer sb=new StringBuffer();
        Map result=new HashMap();
        if(messageIds.length>0){
            for(String ids:messageIds){
                sb.append(ids);
                sb.append(",");
            }
            sb.deleteCharAt(sb.length()-1);
        }

        try {
            userService.deleteMessageByIds(sb.toString());
            result.put("res","success");
        } catch (Exception e) {
            result.put("res","fail");
            e.printStackTrace();
        }
        return  JSON.toJSONString(result);

    }

}
