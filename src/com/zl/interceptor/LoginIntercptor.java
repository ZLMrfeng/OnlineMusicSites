package com.zl.interceptor;

import com.zl.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIntercptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //获取请求URL
        String url =request.getRequestURI();
        //URL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
        if(url.indexOf("/login") >= 0){
            return true;
        }
        HttpSession session =request.getSession();
        User user =(User) session.getAttribute("user");
        if(user != null){
            return true;
        }

        request.setAttribute("msg","您没有登录，请先登录！");
        request.getRequestDispatcher("/frontDesk/logins/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
