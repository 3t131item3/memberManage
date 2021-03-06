package com.accp.biz.impl;

import com.accp.biz.RootBiz;
import com.accp.dao.RootDao;
import com.accp.entity.Role;
import com.accp.entity.Root;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("rootBiz")
public class RootBizImpl implements RootBiz {
    /**
     * 3表联查
     * @return
     */
    @Resource
    private RootDao rootDao;

    public List<Root> roots(Root root) {

        return rootDao.roots(root);
    }

    public boolean modifyRoot(Root root) {
        return rootDao.modifyRoot(root)>0;
    }

    public boolean add(Root root) {
        return rootDao.add(root)>0;
    }
}
