package com.accp.biz.impl;

import com.accp.biz.ProclamationBiz;
import com.accp.dao.ProclamationDao;
import com.accp.entity.Proclamation;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("proclamationBiz")
public class ProclamationBizImpl implements ProclamationBiz{
    @Resource
    private ProclamationDao proclamationDao;

    public List<Proclamation> getList() {

        return proclamationDao.getList();
    }
}
