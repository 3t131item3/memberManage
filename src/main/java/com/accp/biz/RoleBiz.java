package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleBiz {
    //分页查询
    Pager<Role> queryList( int pagerNo,int pagerSize);
    //id查询
    Role queryRoleId( int id);
    //修改
    boolean updateRole(Role role);
    //删除
    boolean deleteRole( int id);
    //新增
    boolean addRole(Role role);
}
