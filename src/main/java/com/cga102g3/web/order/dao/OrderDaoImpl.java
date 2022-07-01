package com.cga102g3.web.order.dao;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order_Item.dao.OrderItemDao;
import com.cga102g3.web.order_Item.dao.OrderItemDaoImpl;
import com.cga102g3.web.order_Item.entity.OrderItemVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public class OrderDaoImpl implements OrderDao {
    @Override
    public void insertWithOrderItem(OrderVO orderVO, List<OrderItemVO> list) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowCount = 0;  //影響資料筆數
        int orderID = -1;  //自增主鍵

        final String sql = "INSERT INTO `bookstore`.`order` (`mbr_ID`, `total_price`, `order_status`, `ship_status`, `pay_status`, `pay_method`) \n" +
                "VALUES (?, ?, ?, ?, ?, ?);";
        final String[] columns = {"order_ID"};

        try {
            con = JDBCUtil.getConnection();
            ps = con.prepareStatement(sql, columns);
            //關閉自動交易
            con.setAutoCommit(false);

            ps.setInt(1, orderVO.getMbrID());
            ps.setInt(2, orderVO.getTotalPrice());
            ps.setInt(3, orderVO.getOrderStatus());
            ps.setInt(4, orderVO.getShipStatus());
            ps.setInt(5, orderVO.getPayStatus());
            ps.setInt(6, orderVO.getPayMethod());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderID = rs.getInt(1);
            }
            rs.close();
            OrderItemDaoImpl dao = new OrderItemDaoImpl();
            for (OrderItemVO aItem : list) {
                aItem.setOrderID(orderID);
                dao.insert2(aItem, con);
            }
            con.commit();
            con.setAutoCommit(true);

        } catch (SQLException se) {
            if (con != null) {
                try {
                    // 3●設定於當有exception發生時之catch區塊內
                    System.err.print("Transaction is being ");
                    System.err.println("rolled back-由-Order");
                    con.rollback();
                } catch (SQLException excep) {
                    throw new RuntimeException("rollback error occured. "
                            + excep.getMessage());
                }
            }
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            JDBCUtil.close(con, ps, rs);
        }
    }

    @Override
    public void update(OrderVO orderVO) {

    }

    @Override
    public OrderVO findByPrimaryKey(Integer orderID) {
        return null;
    }

    @Override
    public List<OrderVO> getAll(Integer mbrID) {
        return null;
    }
}
