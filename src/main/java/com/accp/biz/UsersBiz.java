package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersBiz {
    //分页查询
    Pager<Users> queryList(String userName, int pagerNo, int pagerSize);
    //登录
    Users queryUser( String userName,String password);
    //添加
    boolean addUsers(Users users);
    //id查询
    Users queryUserId(int id);
    //修改Users表
    int updateUsers(Users users);
    //修改登录密码
    int updatePwd(@Param("pwd") String pwd);
    //修改支付密码
    int updatePwd2(@Param("pwd2") String pwd2);
    //名字查询
    boolean queryUserName(@Param("userName") String userName);
}
