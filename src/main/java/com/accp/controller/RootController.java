package com.accp.controller;

import com.accp.biz.RootBiz;
import com.accp.entity.Role;
import com.accp.entity.Root;
import com.accp.entity.Users;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RootController {
    @Resource(name = "rootBiz")
    private RootBiz rootBiz;

    @RequestMapping("/queryRoots")
    @ResponseBody
    public String queryRoots(HttpServletRequest request){
        Role role=new Role();
        Users users=(Users)request.getSession().getAttribute("user");
        role.setId(users.getId());
        List<Root> roots = rootBiz.roots(role);
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("navs","");
        return JSON.toJSONString(roots);
    }
}
