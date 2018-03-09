package com.accp.biz;

import com.accp.entity.CommoditySetMeal;
import com.accp.entity.Pager;

public interface CommoditySetMealBiz {

    //分页查询
    Pager<CommoditySetMeal> getList(String name, int pagerNo, int pagerSize);
    //id查询
    CommoditySetMeal queryCommodityId(int id);
    //添加
    boolean addCommodity(CommoditySetMeal commodity);
    //修改
    boolean updateCommodity(CommoditySetMeal commodity);
    //id删除
    boolean deleteCommodity(CommoditySetMeal commodity);

}
