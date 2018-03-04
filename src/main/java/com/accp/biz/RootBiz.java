package com.accp.biz;

import com.accp.entity.Role;
import com.accp.entity.Root;

import java.util.List;

public interface RootBiz {
    /**
     * 3表联查
     * @return
     */
    List<Root> roots(Role role);
}
