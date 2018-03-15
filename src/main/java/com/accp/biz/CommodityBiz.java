package com.accp.biz;

import com.accp.entity.Commodity;
import com.accp.entity.Order;
import com.accp.entity.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityBiz {
    //分页查询
    Pager<Commodity> getList(Commodity commodity, int pagerNo, int pagerSize);
    //id查询
    Commodity queryCommodityId(int id);
    //添加
    boolean addCommodity(Commodity commodity);
    //修改
    boolean updateCommodity(Commodity commodity);
    //id删除
    boolean deleteCommodity(Commodity commodity);
    //添加订单表
    boolean addOrder(Order order);
}
