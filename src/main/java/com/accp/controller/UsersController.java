package com.accp.controller;

import com.accp.biz.UsersBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class UsersController {
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;
    public  String usersList(){
        return null;
    }
}
