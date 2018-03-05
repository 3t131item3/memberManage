package com.accp.biz;

import com.accp.entity.TranRecords;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TranRecordsBiz {
    List<TranRecords>querys(TranRecords tranRecords);
    TranRecords query(TranRecords tranRecords);
    boolean add(TranRecords tranRecords);
    boolean modify(TranRecords tranRecords);
    boolean remov(int id);
}
