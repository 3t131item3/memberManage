package com.accp.controller;

import com.accp.biz.UsersBiz;
import com.accp.entity.Users;
import com.accp.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;
    @RequestMapping(value = "/login.do")
    public  String login(String userName, String password, boolean rememberPwd, HttpServletRequest request, HttpServletResponse response){
        String s = password;//MD5.MD5Encode(password);
        Users users = usersBiz.queryUser(userName,s);
        if(users!=null){
            if(users.getState()==0){
                request.setAttribute("msg","该用户已冻结");
                return "/login";
            }
            request.getSession().setAttribute("user",users);
            if(rememberPwd){
                Cookie cookie=new Cookie("user",users.getUserName()+"/"+users.getPwd()) ;
                cookie.setMaxAge(2592000);
                response.addCookie(cookie);
            }else{
                Cookie [] cookies=request.getCookies();
                if(cookies!=null){
                    for (Cookie cookie:cookies) {
                        if("user".equals(cookie.getName())){
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
            }
            return "redirect:/index";
        }
        request.setAttribute("msg","用户名或密码错误");
        return "/login";
    }
}
