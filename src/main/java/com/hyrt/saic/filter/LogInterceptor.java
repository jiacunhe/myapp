package com.hyrt.saic.filter;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: sfce
 * Date: 14-1-17
 * Time: 上午11:22
 */
@Deprecated
public class LogInterceptor extends HandlerInterceptorAdapter {
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        /*System.out.println("==================LogInterceptor=====================");
        System.out.println("==================" + ex == null + "=====================");
        if (ex == null) {
            HttpSession session = request.getSession();
            if (null != session) {

            }
            String uri = request.getRequestURI();
        }*/

    }
}
