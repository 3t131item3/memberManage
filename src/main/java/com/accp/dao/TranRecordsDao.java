package com.accp.dao;

import com.accp.entity.TranRecords;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TranRecordsDao {
    List<TranRecords>querys(TranRecords tranRecords);
    TranRecords query(TranRecords tranRecords);
    int add(TranRecords tranRecords);
    int modify(TranRecords tranRecords);
    int remove(@Param("id")int id);

    /**
     * 分页查询
     * @param tranRecords 查询条件对象
     * @param rowCount 每页行数
     * @param currentPageNo 当前页数
     * @param beginDate 开始时间 条件
     * @param endDate 结束时间 条件
     * @return List<TranRecords>
     */
    List<TranRecords>pageQuerys(@Param("TranRecords") TranRecords tranRecords,@Param("rowCount") int rowCount,@Param("currentPageNo") int currentPageNo,@Param("beginDate") Date beginDate,@Param("endDate") Date endDate);
}
