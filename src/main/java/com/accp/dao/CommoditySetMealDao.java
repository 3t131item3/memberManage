package com.accp.dao;

import com.accp.entity.CommoditySetMeal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommoditySetMealDao {
    List<CommoditySetMeal> getList(@Param("name") String name, @Param("pagerNo") int pagerNo, @Param("pagerSize") int pagerSize);

    //查询总行数
    int count(@Param("name") String name);

    //id查询
    CommoditySetMeal getListId(@Param("id") int id);

    //添加
    int add(CommoditySetMeal commoditySetMeal);

    //修改
    int modify(CommoditySetMeal commoditySetMeal);

    //id删除
    int remove(CommoditySetMeal commoditySetMeal);
}
