package com.cga102g3.web.order.dao;

import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order_Item.entity.OrderItemVO;

import java.util.List;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public interface OrderDao {
    public void insertWithOrderItem(OrderVO orderVO , List<OrderItemVO> list);
    public void update(OrderVO orderVO);
    /**使用訂單編號查詢訂單**/
    public OrderVO findByPrimaryKey(Integer orderID);
    /**找相同會員訂單**/
    public List<OrderVO> getAll(Integer mbrID);
}
