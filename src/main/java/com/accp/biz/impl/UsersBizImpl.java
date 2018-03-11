package com.accp.biz.impl;

import com.accp.biz.UsersBiz;
import com.accp.dao.UsersDao;
import com.accp.entity.Pager;
import com.accp.entity.Users;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("usersBiz")
public class UsersBizImpl implements UsersBiz {
    @Resource
    private UsersDao usersDao;

    public Pager<Users> queryList(String userName, int pagerNo, int pagerSize){
        Pager<Users> pager=new Pager<Users>();
        pager.setPagerSize(pagerSize);
        pager.setPagerNo(pagerNo);
        pager.setTotalCount(usersDao.count(userName));
        pager.setTotalPageCount((pager.getTotalCount()+pagerSize-1)/pagerSize);
        pager.setData(usersDao.getlist(userName,(pagerNo-1)*pagerSize,pagerSize));
        return pager;
    }

    public Users queryUser(String userName, String password) {
        return usersDao.login(userName,password);
    }

    public boolean addUsers(Users users) {
        return usersDao.add(users)>0;
    }

    public Users queryUserId(int id) {
        return usersDao.getUsersId(id);
    }

    public int updateUsers(Users users) {
        return 0;
    }

    public int updatePwd(String pwd) {
        return 0;
    }

    public int updatePwd2(String pwd2) {
        return 0;
    }

    public boolean queryUserName(String userName) {
        Users userName1 = usersDao.getUserName(userName);
        return userName1!=null;
    }
    public boolean modify(Users user){
        return usersDao.modify(user)>0;
    }

    public boolean deleteUsers(int id) {
        return usersDao.remove(id)>0;
    }

    public Users queryUsersroleId(int roleId) {
        return usersDao.getUsersroleId(roleId);
    }

    public Users query(Users users){
        return usersDao.query(users);
    }
}
