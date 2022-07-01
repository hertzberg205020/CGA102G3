package com.cga102g3.web.order_Item.dao;

import com.cga102g3.web.order_Item.entity.OrderItemVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public class OrderItemDaoImpl implements OrderItemDao{
    @Override
    public void insert(OrderItemVO orderItemVO) {

    }

    @Override
    public List<OrderItemVO> getAll(Integer orderID) {
        return null;
    }

    @Override
    public void insert2(OrderItemVO orderItemVO, Connection con) {
        PreparedStatement ps = null;
        final String sql = "INSERT INTO `bookstore`.`order_item` (order_ID,prod_ID, amount, sale_price) \n" +
                "VALUES (?,?, ?, ?);";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,orderItemVO.getOrderID());
            ps.setInt(2,orderItemVO.getProdID());
            ps.setInt(3,orderItemVO.getAmount());
            ps.setInt(4,orderItemVO.getSalePrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            if (con != null) {
                try {
                    // exception發生，rollback()
                    System.err.print("Transaction is being ");
                    System.err.println("rolled back-由-orderItem");
                    con.rollback();
                } catch (SQLException excep) {
                    //rollback失敗
                    throw new RuntimeException("rollback error occured. "
                            + excep.getMessage());
                }
            }
            throw new RuntimeException("A database error occured. "
                    + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
        }
    }
}
