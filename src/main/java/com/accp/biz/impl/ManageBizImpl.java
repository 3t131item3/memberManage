package com.accp.biz.impl;

import com.accp.biz.ManageBiz;
import com.accp.dao.ManageDao;
import com.accp.entity.Manage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("manageBiz")
public class ManageBizImpl implements ManageBiz {
    @Resource
    private ManageDao manageDao;

    public Manage getManage(Manage manage) {

        return manageDao.getManage(manage);
    }

    public List<Manage> queryManages() {
        return manageDao.queryManages();
    }
}
