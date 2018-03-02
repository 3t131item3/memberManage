package com.accp.biz.impl;

import com.accp.biz.CommodityBiz;
import com.accp.dao.CommodityDao;
import com.accp.entity.Commodity;
import com.accp.entity.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("commodityBiz")
public class CommodityBizImpl implements CommodityBiz {
    @Resource
    private CommodityDao commodityDao;
    public Pager<Commodity> getList(String name, int pagerNo, int pagerSize) {
        Pager<Commodity> pager=new Pager<Commodity>();
        pager.setPagerSize(pagerSize);
        pager.setPagerNo(pagerNo);
        pager.setTotalCount(commodityDao.count(name));
        pager.setTotalPageCount((pager.getTotalCount()+pagerSize-1)/pagerSize);
        pager.setDate(commodityDao.getList(name,(pagerNo-1)*pagerSize,pagerSize));
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
}
