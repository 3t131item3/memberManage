package com.accp.dao;

import com.accp.entity.Order;
import com.accp.entity.Proclamation;

import java.util.List;

public interface OrderDao {
    List<Order> getList();

        int add(Order order);

}
