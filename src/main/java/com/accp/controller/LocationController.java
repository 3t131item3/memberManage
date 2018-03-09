package com.accp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public String login(HttpServletRequest request){
        request.getSession().invalidate();
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
    @RequestMapping("/remittanc")
    public String remittanc(){
        return "/remittanc";
    }
    @RequestMapping("/basicaccount")
    public String basicaccount(){
        return "/basicaccount";
    }

    @RequestMapping("/addRole")
    public String addUsers() {
        return "addRole";
    }

    @RequestMapping("/rolemanagement")
    public String rolemanagement() {
        return "/rolemanagement";
    }

    @RequestMapping("/commoditymanagement")
    public String commoditymanagement() {
        return "/commoditymanagement";
    }
    @RequestMapping("/sssList")
    public String CommoditySetMealList() {
        return "/CommoditySetMealList";
    }
    @RequestMapping("/authoritymanagement")
    public String authoritymanagement() {
        return "/authoritymanagement";
    }
}
