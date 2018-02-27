package com.accp.controller;

import com.accp.biz.UsersBiz;
import com.accp.entity.Users;
import com.accp.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class LoginController {
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;
    @RequestMapping(value = "/login.do")
    public  String login(String userName, String password){
        String s = MD5.MD5Encode(password);
        Users users = usersBiz.queryUser(userName,s);
        if(users!=null){
            return "/index";
        }

        return "/login";
    }
}
