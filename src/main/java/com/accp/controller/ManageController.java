package com.accp.controller;

import com.accp.biz.ManageBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class ManageController {
    @Resource(name = "manageBiz")
    private ManageBiz manageBiz;

    @RequestMapping("/queryManages")
    public String queryManages(Model model){
        model.addAttribute("manages",manageBiz.queryManages());
        return "/authoritymanagement";
    }
}
