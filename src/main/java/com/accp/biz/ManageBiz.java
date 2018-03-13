package com.accp.biz;

import com.accp.entity.Manage;

import java.util.List;

public interface ManageBiz {
    Manage getManage(Manage manage);
    List<Manage>queryManages();

}
