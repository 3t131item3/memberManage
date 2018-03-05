package com.accp.biz.impl;

import com.accp.biz.TranRecordsBiz;
import com.accp.dao.TranRecordsDao;
import com.accp.entity.TranRecords;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("tranRecordsBiz")
public class TranRecordsBizImpl implements TranRecordsBiz{

    @Resource
    private TranRecordsDao tranRecordsDao;

    public List<TranRecords> querys(TranRecords tranRecords) {
        return tranRecordsDao.querys(tranRecords);
    }

    public TranRecords query(TranRecords tranRecords) {
        return tranRecordsDao.query(tranRecords);
    }

    public boolean add(TranRecords tranRecords) {
        return tranRecordsDao.add(tranRecords)>0;
    }

    public boolean modify(TranRecords tranRecords) {
        return tranRecordsDao.modify(tranRecords)>0;
    }

    public boolean remov(int id) {
        return tranRecordsDao.remov(id)>0;
    }
}
