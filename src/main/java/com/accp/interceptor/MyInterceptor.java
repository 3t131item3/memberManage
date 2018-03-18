package com.accp.interceptor;


import com.accp.entity.Users;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
         Object user = request.getSession().getAttribute("user");
        if(user==null){
            response.sendRedirect("/login");
            return false;
        }else{
            if("/index".equals(request.getRequestURI().toString())||"/Users/unlock".equals(request.getRequestURI().toString())){
                return true;
            }

            Users users=(Users)user;
            if(users.getBank()==null){
                if("/toModifyUser".equals(request.getRequestURI().toString())){
                    return true;
                }
                response.sendRedirect("/toModifyUser");
            }
        }
        return true;
    }
}
