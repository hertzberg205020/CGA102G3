package com.cga102g3.web.bid_order.dao.impl;



import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.bid_order.dao.BidOrderDao;
import com.cga102g3.web.bid_order.entity.BidOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-11 上午 11:33
 */
public class BidOrderDaoImpl implements BidOrderDao {
    @Override
    public int insert(BidOrder pojo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int res = 0;
        final String sql =
                "insert into bid_order(bid_ID, mbr_ID, bid_price) \n" +
                "VALUES (?, ?, ?); ";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pojo.getBidID());
            pstmt.setInt(2, pojo.getMbrID());
            pstmt.setInt(3, pojo.getBidPrice());
            res = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return res;
    }

    /**
     * 競標商品訂單不能刪除
     * @param id
     * @return
     */
    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    /**
     * 競標商品訂單僅能修改狀態bid_ship_stat, pay_seller
     * @param pojo
     * @return
     */
    @Override
    public int update(BidOrder pojo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int res = 0;
        final String sql =
                "update bid_order\n" +
                "set bid_ship_stat = ?, pay_seller = ?\n" +
                "where bid_order_ID = ?;";
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pojo.getBidShipStat());
            pstmt.setBoolean(2, pojo.getPaySeller());
            pstmt.setInt(3, pojo.getBidOrderID());
            res = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return res;
    }

    @Override
    public BidOrder selectByPrimaryKey(Integer id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BidOrder bidOrder = null;

        final String sql =
                "select bid_order_ID, bid_ID, mbr_ID, bid_price, bid_order_date,\n" +
                "       bid_ship_stat, pay_seller\n" +
                "from bid_order\n" +
                "where bid_order_ID = ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            bidOrder = retrieve(rs).get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return bidOrder;
    }

    /**
     * 未實現
     * @return
     */
    @Override
    public List<BidOrder> selectAll() {
        return null;
    }

    /**
     * 查詢全部競標商品訂單，每頁12筆資料
     * @param page
     * @return
     */
    @Override
    public List<BidOrder> selectAll(Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidOrder> list = null;

        final String sql =
                "select bid_order_ID, bid_ID, mbr_ID, bid_price, bid_order_date,\n" +
                "       bid_ship_stat, pay_seller\n" +
                "from bid_order\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (page - 1) * pageSize);
            pstmt.setInt(2, pageSize + 1);
            rs = pstmt.executeQuery();
            list = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    /**
     * 依會員編號查詢競標商品訂單，每頁12筆資料
     * @param mbrID
     * @param page
     * @return
     */
    @Override
    public List<BidOrder> selectByMbrID(Integer mbrID, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidOrder> list = null;

        final String sql =
                "select bid_order_ID, bid_ID, mbr_ID, bid_price, bid_order_date,\n" +
                "       bid_ship_stat, pay_seller\n" +
                "from bid_order\n" +
                "where mbr_ID = ?\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mbrID);
            pstmt.setInt(2, (page - 1) * pageSize);
            pstmt.setInt(3, pageSize + 1);
            rs = pstmt.executeQuery();
            list = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    /**
     * 依是否付款查詢競標商品訂單，每頁12筆資料
     * @param paySeller
     * @param page
     * @return
     */
    @Override
    public List<BidOrder> selectByPaySeller(Boolean paySeller, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidOrder> list = null;

        final String sql =
                "select bid_order_ID, bid_ID, mbr_ID, bid_price, bid_order_date,\n" +
                        "       bid_ship_stat, pay_seller\n" +
                        "from bid_order\n" +
                        "where pay_seller = ?\n" +
                        "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setBoolean(1, paySeller);
            pstmt.setInt(2, (page - 1) * pageSize);
            pstmt.setInt(3, pageSize + 1);
            rs = pstmt.executeQuery();
            list = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return list;
    }

    /**
     * 將查詢結果放入list中，並返回
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<BidOrder> retrieve(ResultSet rs) throws SQLException {
        List<BidOrder> list = new ArrayList<>();
        while (rs.next()) {
            BidOrder bidOrder = new BidOrder();
            bidOrder.setBidOrderID(rs.getInt("bid_order_id"));
            bidOrder.setBidID(rs.getInt("bid_id"));
            bidOrder.setMbrID(rs.getInt("mbr_id"));
            bidOrder.setBidPrice(rs.getInt("bid_price"));
            bidOrder.setBidOrderDate(rs.getTimestamp("bid_order_date"));
            bidOrder.setBidShipStat(rs.getInt("bid_ship_stat"));
            bidOrder.setPaySeller(rs.getBoolean("pay_seller"));
            list.add(bidOrder);
        }
        return list;
    }

    public static void main(String[] args) {
//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        BidOrder bidOrder= bidOrderDao.selectByPrimaryKey(1);
//        System.out.println(bidOrder);

//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        List<BidOrder> bidOrders = bidOrderDao.selectAll(1);
//        System.out.println(bidOrders.size());

//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        List<BidOrder> list = bidOrderDao.selectByMbrID(1, 1);
//        System.out.println(list);

//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        List<BidOrder> list = bidOrderDao.selectByPaySeller(true, 1);
//        System.out.println(list);

//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        BidOrder bidOrder = new BidOrder();
//        bidOrder.setBidID(1);
//        bidOrder.setMbrID(1);
//        bidOrder.setBidPrice(650);
//        bidOrderDao.insert(bidOrder);

//        BidOrderDao bidOrderDao = new BidOrderDaoImpl();
//        BidOrder bidOrder = new BidOrder();
//        bidOrder.setBidOrderID(4);
//        bidOrder.setPaySeller(true);
//        bidOrder.setBidShipStat(1);
//        bidOrderDao.update(bidOrder);

    }
}
