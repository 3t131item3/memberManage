package com.accp.biz.impl;

import com.accp.biz.CommodityBiz;
import com.accp.biz.CommoditySetMealBiz;
import com.accp.biz.UsersBiz;
import com.accp.dao.CommoditySetMealDao;
import com.accp.entity.CommoditySetMeal;
import com.accp.entity.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("commoditySetMealBiz")
public class CommoditySetMealBizImpl implements CommoditySetMealBiz {
    @Resource
    private CommoditySetMealDao commoditySetMealDao;
    @Resource
    private UsersBiz usersBiz;
    @Resource
    private CommodityBiz commodityBiz;

    public Pager<CommoditySetMeal> getList(String name, int pagerNo, int pagerSize) {
        Pager<CommoditySetMeal> pager=new Pager<CommoditySetMeal>();
        pager.setPagerSize(pagerSize);
        pager.setPagerNo(pagerNo);
        pager.setTotalCount(commoditySetMealDao.count(name));
        pager.setTotalPageCount((pager.getTotalCount()+pagerSize-1)/pagerSize);
        pager.setData(commoditySetMealDao.getList(name,(pagerNo-1)*pagerSize,pagerSize));
        return pager;
    }

    public CommoditySetMeal queryCommodityId(int id) {
        return commoditySetMealDao.getListId(id);
    }

    public boolean addCommodity(CommoditySetMeal commodity) {
        return commoditySetMealDao.add(commodity)>0;
    }

    public boolean updateCommodity(CommoditySetMeal commodity) {
        return commoditySetMealDao.modify(commodity)>0;
    }

    public boolean deleteCommodity(CommoditySetMeal commodity) {
        return commoditySetMealDao.remove(commodity)>0;
    }
}
