package com.accp.biz.impl;

import com.accp.biz.TranRecordsBiz;
import com.accp.dao.TranRecordsDao;
import com.accp.entity.Pager;
import com.accp.entity.TranRecords;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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

    public boolean remove(int id) {
        return tranRecordsDao.remove(id)>0;
    }

    public Pager<TranRecords> pageQuerys(TranRecords tranRecords, int rowCount, int currentPageNo, Date beginDate, Date endDate) {
        Pager<TranRecords>pager=new Pager<TranRecords>();
//        每页行数
        pager.setPagerSize(rowCount);
//        当前页数
        pager.setPagerNo(currentPageNo);
//        总行数
        int size = tranRecordsDao.pageQuerys(tranRecords, 0, 0, beginDate, endDate).size();
        pager.setTotalCount(size);
//        总页数
        pager.setTotalPageCount((rowCount+size-1)/rowCount);
        pager.setData(tranRecordsDao.pageQuerys(tranRecords,rowCount,(currentPageNo-1)*rowCount,beginDate,endDate));
        return pager;
    }
}
