package com.accp.biz.impl;

import com.accp.biz.RoleBiz;
import com.accp.dao.RoleDao;
import com.accp.entity.Pager;
import com.accp.entity.Role;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service("roleBiz")
public class RoleBizImpl implements RoleBiz {
    @Resource
    private RoleDao roleDao;
    public Pager<Role> queryList(int pagerNo, int pagerSize) {
        Pager<Role> pager=new Pager<Role>();
        pager.setPagerSize(pagerSize);
        pager.setPagerNo(pagerNo);
        pager.setTotalCount(roleDao.count());
        pager.setTotalPageCount((pager.getTotalCount()+pagerSize-1)/pagerSize);
        pager.setDate(roleDao.getList((pagerNo-1)*pagerSize,pagerSize));
        return pager;
    }

    public Role queryRoleId(int id) {
        return roleDao.getRoleId(id);
    }

    public boolean updateRole(Role role) {
        return roleDao.modify(role)>0;
    }

    public boolean deleteRole(int id) {
        return roleDao.remove(id)>0;
    }

    public boolean addRole(Role role) {
        return roleDao.add(role)>0;
    }
}
