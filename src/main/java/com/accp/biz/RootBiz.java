package com.accp.biz;

import com.accp.entity.Role;
import com.accp.entity.Root;

import java.util.List;

public interface RootBiz {
    /**
     * 3表联查
     * @return
     */
    List<Root> roots(Root root);
    boolean modifyRoot(Root root);
    boolean add(Root root);

}
