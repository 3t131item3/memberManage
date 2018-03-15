package com.accp.biz.impl;

import com.accp.biz.CommodityBiz;
import com.accp.dao.CommodityDao;
import com.accp.dao.OrderDao;
import com.accp.entity.Commodity;
import com.accp.entity.Order;
import com.accp.entity.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("commodityBiz")
public class CommodityBizImpl implements CommodityBiz {
    @Resource
    private CommodityDao commodityDao;
    @Resource
    private OrderDao orderDao;
    public Pager<Commodity> getList(Commodity commodity, int pagerNo, int pagerSize) {
        Pager<Commodity> pager=new Pager<Commodity>();
        pager.setPagerSize(pagerSize);
        pager.setPagerNo(pagerNo);
        pager.setTotalCount(commodityDao.count(commodity));
        pager.setTotalPageCount((pager.getTotalCount()+pagerSize-1)/pagerSize);
        pager.setData(commodityDao.getList(commodity.getCommodityNo(),commodity.getName(),(pagerNo-1)*pagerSize,pagerSize));
        return pager;
    }

    public Commodity queryCommodityId(int id) {
        return commodityDao.getCommodityId(id);
    }

    public boolean addCommodity(Commodity commodity) {
        return commodityDao.add(commodity)>0;
    }

    public boolean updateCommodity(Commodity commodity) {
        return commodityDao.modify(commodity)>0;
    }

    public boolean deleteCommodity(Commodity commodity) {
        return commodityDao.remove(commodity)>0;
    }

    public boolean addOrder(Order order) {
        return orderDao.add(order)>0;
    }
}
