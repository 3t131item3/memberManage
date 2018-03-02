package com.accp.dao;

import com.accp.entity.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityDao {
    //分页查询
    List<Commodity> getList(@Param("name") String name,@Param("pagerNo") int pagerNo,@Param("pagerSize") int pagerSize);
    //查询总行数
    int count(@Param("name") String name);
    //id查询
    Commodity getCommodityId(@Param("id") int  id);
    //添加
    int add(Commodity commodity);
    //修改
    int modify(Commodity commodity);
    //id删除
    int remove(Commodity commodity);
}
