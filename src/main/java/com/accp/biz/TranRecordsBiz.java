package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.TranRecords;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TranRecordsBiz {
    List<TranRecords>querys(TranRecords tranRecords);
    TranRecords query(TranRecords tranRecords);
    boolean add(TranRecords tranRecords);
    boolean modify(TranRecords tranRecords);
    boolean remove(int id);
    Pager<TranRecords>pageQuerys(TranRecords tranRecords, int rowCount,int currentPageNo, Date beginDate, Date endDate);
}
