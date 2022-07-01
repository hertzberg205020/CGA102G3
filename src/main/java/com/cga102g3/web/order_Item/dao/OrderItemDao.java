package com.cga102g3.web.order_Item.dao;

import com.cga102g3.web.order_Item.entity.OrderItemVO;

import java.util.List;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public interface OrderItemDao {
    public void insert(OrderItemVO orderItemVO);

    /**使用訂單編號查詢明細**/
    public List<OrderItemVO> getAll(Integer orderID);

    /**新增訂單同時新增明細**/
    public void insert2 (OrderItemVO orderItemVO , java.sql.Connection con);
}
