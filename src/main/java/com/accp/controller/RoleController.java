package com.accp.controller;

import com.accp.biz.RoleBiz;
import com.accp.entity.Pager;
import com.accp.entity.Role;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/role")
public class RoleController{
    @Resource(name = "roleBiz")
    private RoleBiz roleBiz;
@RequestMapping(value = "/List")
    public  String roleList(){
        Pager<Role> rolePager = roleBiz.queryList(1, 3);
        return null;
    }

}
