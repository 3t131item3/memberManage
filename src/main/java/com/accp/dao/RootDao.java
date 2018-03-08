package com.accp.dao;

import com.accp.entity.Role;
import com.accp.entity.Root;
import com.accp.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RootDao {

    /**
     * 3表联查
     * @return
     */
    List<Root>roots(Root root);

}
