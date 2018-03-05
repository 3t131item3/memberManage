package com.accp.dao;

import com.accp.entity.TranRecords;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TranRecordsDao {
    List<TranRecords>querys(TranRecords tranRecords);
    TranRecords query(TranRecords tranRecords);
    int add(TranRecords tranRecords);
    int modify(TranRecords tranRecords);
    int remov(@Param("id")int id);
}
