package com.accp.dao;

import com.accp.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleDao {
    //分页查询
    List<Role> getList(@Param("pagerNo") int pagerNo,@Param("pagerSize") int pagerSize);
    //id查询
    Role getRoleId(@Param("id") int id);
    //修改
    int modify(Role role);
    //删除
    int remove(@Param("id") int id);
    //新增
    int add(Role role);
    //查询分页总行数
    int count();

    List<Role>queryrole();
}
