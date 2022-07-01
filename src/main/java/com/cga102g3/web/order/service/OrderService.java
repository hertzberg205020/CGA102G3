package com.cga102g3.web.order.service;

import com.cga102g3.web.order.dao.OrderDao;
import com.cga102g3.web.order.dao.OrderDaoImpl;
import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order_Item.entity.OrderItemVO;

import java.util.List;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public class OrderService {
    private OrderDao dao;

    public OrderService() {
        dao = new OrderDaoImpl();
    }
    public boolean addWithOrderItem(OrderVO orderVO, List<OrderItemVO> list){
        dao.insertWithOrderItem(orderVO, list);
        return true;
    }
}
