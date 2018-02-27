package com.accp.dao;

import com.accp.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersDao {
    //分页查询
    List<Users> getlist(@Param("userName") String userName,@Param("pagerNo") int pagerNo,@Param("pagerSize") int pagerSize);
    //查询所有行
    int count(@Param("userName") String userName);
    //登录
    Users queryUser(@Param("userName") String userName, @Param("password") String password);
    //注册
    int add(Users user);
    //id查询
    Users getUsersId(@Param("id") int id);
    //修改Users表
    int modify(Users users);
    //修改登录密码
    int modifyPwd(@Param("pwd") String pwd);
    //修改支付密码
    int modifyPwd2(@Param("pwd2") String pwd2);
    //名字查询
    Users getUserName(@Param("userName") String userName);

}

