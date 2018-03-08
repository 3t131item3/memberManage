package com.accp.biz.impl;

import com.accp.biz.ManageItemBiz;
import com.accp.dao.ManageItemDao;
import com.accp.entity.ManageItem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("manageItemBiz")
public class ManageItemBizImpl implements ManageItemBiz{

    @Resource
    private ManageItemDao manageItemDao;

    public List<ManageItem> getList(ManageItem manageItem) {
        return manageItemDao.getList(manageItem);
    }
}
