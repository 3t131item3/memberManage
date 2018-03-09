package com.accp.controller;

import com.accp.biz.RoleBiz;
import com.accp.biz.UsersBiz;
import com.accp.entity.Pager;
import com.accp.entity.Role;
import com.accp.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController{
    @Resource(name = "roleBiz")
    private RoleBiz roleBiz;
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;
    @ResponseBody
    @RequestMapping("/list")
    private Map<String, Object> getList(HttpServletRequest request){
        int pagerNo =1;
        if(request.getParameter("pageIndex")!=null){
            pagerNo=Integer.parseInt(request.getParameter("pageIndex"));
        }
        String userName=null;
        if(request.getParameter("name")!=null && request.getParameter("name")!="" ){
            userName= request.getParameter("name");
        }
        int   pageSize=1;
        if(request.getParameter("pageSize")!=null){
            pageSize=Integer.parseInt(request.getParameter("pageSize"));
        }

        Pager<Role> usersPager = roleBiz.queryList(pagerNo, pageSize);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("rel",true);
        map.put("msg","获取成功");
        map.put("list",usersPager.getData());
        map.put("count",usersPager.getTotalCount());
        return  map ;
    }
    //删除
    @ResponseBody
    @RequestMapping(value ="/delete/{id}",method = RequestMethod.GET)
    private  Map<String, Object>  delete(@PathVariable int id){
        Map<String, Object> map=new HashMap<String, Object>();
        Role role = roleBiz.queryRoleId(id);
        Users users = usersBiz.queryUsersroleId(role.getId());
        if(users!=null){
//            map.put("msg", "用户表有数据，请先删除用户表!");
            map.put("msg", "noNull");
        }else {
            if (roleBiz.deleteRole(id)) {
                map.put("msg", "true");
            } else {
                map.put("msg", "fales");
            }
        }
        return map;
    }


    //查询修改
    @RequestMapping(value ="/updateRole/{id}",method = RequestMethod.GET)
    private String updateRole(@PathVariable int id,HttpServletRequest request){
        Map<String, Object> map=new HashMap<String, Object>();
        Role role = roleBiz.queryRoleId(id);
        request.setAttribute("role",role);
        return "/addRole";
    }
    //添加
    @ResponseBody
    @RequestMapping(value ="/add/{mycars}",method = RequestMethod.GET)
    private  Map<String, Object>  add(@PathVariable String[] mycars){
        Map<String, Object> map=new HashMap<String, Object>();
        Map<String,String>map1=new HashMap<String,String>();
        Role role=new Role();
        role.setNo(mycars[0]);
        role.setRoleName(mycars[1]);
        role.setStats(Integer.parseInt(mycars[2]));
        role.setModifyTime(new Date());
        if(roleBiz.addRole(role)){
//        if(2<1){
            map.put("msg","成功");
        }else {
            map.put("msg","失败");
        }
        return map;
    }


}
