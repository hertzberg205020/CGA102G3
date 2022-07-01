package com.cga102g3.web.order_Item.service;

import com.cga102g3.web.order_Item.dao.OrderItemDao;
import com.cga102g3.web.order_Item.dao.OrderItemDaoImpl;
import com.cga102g3.web.order_Item.entity.OrderItemVO;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public class OrderItemService {
    private OrderItemDao dao;

    public OrderItemService() {
        dao = new OrderItemDaoImpl();
    }
    public boolean addWithOrder(OrderItemVO orderItemVO , java.sql.Connection con){
        dao.insert2(orderItemVO ,con);
        return true;
    }
}
