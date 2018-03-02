package com.accp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 专门用来跳转jsp页面的类
 */
@Controller
//@RequestMapping("/page")
public class LocationController {
    @RequestMapping("/register")
    public String register(){
        return "/register";
    }
    @RequestMapping("/login")
    public String login(){
        return "/login";
    }
    @RequestMapping("/index")
    public String index(){
        return "/index";
    }
    @RequestMapping("/usermanagement")
    public String usermanagement(){
        return "/usermanagement";
    }
}
