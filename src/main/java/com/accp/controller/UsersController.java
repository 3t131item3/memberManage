package com.accp.controller;

import com.accp.biz.UsersBiz;
import com.accp.entity.Errors;
import com.accp.entity.Users;
import com.accp.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Users")
public class UsersController {
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;
    public  String usersList(){
        return null;
    }
    @RequestMapping(value = "/add.do/{userName}/{password}",method = RequestMethod.GET)
    public  String addUsers(@PathVariable String userName,@PathVariable String password){
        Users users=new Users();
        users.setUserName(userName);
        users.setPwd(MD5.MD5Encode(password));
        if( usersBiz.addUsers(users)){
            return "redirect:/login";
        }
        return  "redirect:/register";
    }
    @RequestMapping("/pwdmodifys/{oldpassword}")
    @ResponseBody
    private Object updatepwd(@PathVariable String oldpassword, HttpServletRequest req) {
        Errors errors = new Errors();
//        if (oldpassword != null&& oldpassword!="") {
//            if(usersBiz.queryUserName(oldpassword)){
//                errors.setResult("false");
//            }else {
//                errors.setResult("true");
//            }
//        } else {
//            errors.setResult("error");
//        }
        return errors;
    }
//判断二级密码是否正确
    @ResponseBody
    @RequestMapping("/pwdeq")
    private String pwd2eq(HttpServletRequest request){
        Users user = (Users) request.getSession().getAttribute("user");
//        String pwd2 = MD5.MD5Encode(request.getParameter("pwd2"));
        String pwd2 = request.getParameter("pwd2");
        if(user.getPwd2().equals(pwd2)){
            return "{\"result\":\"true\"}";
        }else {
            return "{\"result\":\"false\"}";
        }
    }
    @ResponseBody
    @RequestMapping("/unlock")
    public String unlock(HttpServletRequest request){
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(usersBiz.queryUser(userName,password)!=null){
            return "{\"rel\":\"true\"}";
        }else {
            return "{\"rel\":\"密码错误！(ps:解锁密码为登录密码)\"}";
        }
    }
}
