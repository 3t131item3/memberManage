package com.accp.biz;

import com.accp.entity.ManageItem;

import java.util.List;

public interface ManageItemBiz {
    List<ManageItem> getList(ManageItem manageItem);
}
