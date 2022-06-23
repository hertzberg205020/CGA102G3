package com.cga102g3.web.bid_record.dao.impl;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.bid_record.dao.BidRecordDao;
import com.cga102g3.web.bid_record.entity.BidRecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 競標商品出價紀錄dao
 * @Author Robert
 * @Version
 * @Date 2022-06-10 下午 10:34
 */
public class BidRecordDaoImpl implements BidRecordDao {

    @Override
    public int insert(BidRecord pojo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int res = 0;
        final String sql =
                "insert into bid_record(bid_ID, mbr_ID, bid_amount) \n" +
                "VALUES (?, ?, ?);";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pojo.getBidID());
            pstmt.setInt(2, pojo.getMbrID());
            pstmt.setInt(3, pojo.getBidAmount());
            res = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return res;
    }

    /**
     * 出價紀錄不能刪除
     * @param id
     * @return
     */
    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    /**
     * 出價紀錄不能修改
     * @param pojo
     * @return
     */
    @Override
    public int update(BidRecord pojo) {
        return 0;
    }

    @Override
    public BidRecord selectByPrimaryKey(Integer id) {
        BidRecord bidRecord = new BidRecord();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        final String sql =
                "select bid_rec_ID, bid_ID, mbr_ID, bid_amount, bid_time\n" +
                "from bid_record\n" +
                "where bid_rec_ID = ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            rs = pstmt.executeQuery();
            List<BidRecord> list = retrieve(rs);
            bidRecord = list.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return bidRecord;
    }

    /**
     * 未實現
     * @return
     */
    @Override
    public List<BidRecord> selectAll() {
        return null;
    }

    /**
     * 將查詢結果放入list中，並返回
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<BidRecord> retrieve(ResultSet rs) throws SQLException {
        List<BidRecord> list = new ArrayList<>();
        while (rs.next()) {
            BidRecord bidRecord = new BidRecord();
            bidRecord.setBidRecID(rs.getInt("bid_rec_ID"));
            bidRecord.setBidID(rs.getInt("bid_ID"));
            bidRecord.setMbrID(rs.getInt("mbr_ID"));
            bidRecord.setBidAmount(rs.getInt("bid_amount"));
            bidRecord.setBidTime(rs.getTimestamp("bid_time"));
            list.add(bidRecord);
        }
        return list;
    }

    /**
     * 詢全部競標商品，每頁12筆資料
     * @param page
     * @return
     */
    @Override
    public List<BidRecord> selectAll(Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidRecord> list = null;
        final String sql =
                "select bid_rec_ID, bid_ID, mbr_ID, bid_amount, bid_time\n" +
                "from bid_record\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pageSize * (page - 1));
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
     * 依競標者編號查詢競標商品出價紀錄，每頁12筆資料
     * @param mbrID
     * @param page
     * @return
     */
    @Override
    public List<BidRecord> selectByMbrID(Integer mbrID, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidRecord> list = null;
        final String sql =
                "select bid_rec_ID, bid_ID, mbr_ID, bid_amount, bid_time\n" +
                "from bid_record\n" +
                "where mbr_ID = ?\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mbrID);
            pstmt.setInt(2, pageSize * (page - 1));
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
     * 依競標商品編號查詢競標商品出價紀錄，每頁12筆資料
     * @param bidID
     * @param page
     * @return
     */
    @Override
    public List<BidRecord> selectByBidID(Integer bidID, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidRecord> list = null;
        final String sql =
                "select bid_rec_ID, bid_ID, mbr_ID, bid_amount, bid_time\n" +
                "from bid_record\n" +
                "where bid_ID = ?\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bidID);
            pstmt.setInt(2, pageSize * (page - 1));
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

    public static void main(String[] args) {
//        BidRecordDao bidRecordDao = new BidRecordDaoImpl();
//        BidRecord bidRecord = bidRecordDao.selectByPrimaryKey(1);
//        System.out.println(bidRecord);

//        BidRecordDao bidRecordDao = new BidRecordDaoImpl();
//        List<BidRecord> list = bidRecordDao.selectAll(1);
//        System.out.println(list);

//        BidRecordDao bidRecordDao = new BidRecordDaoImpl();
//        List<BidRecord> list = bidRecordDao.selectByBidID(1,1);
//        System.out.println(list);

//        BidRecordDao bidRecordDao = new BidRecordDaoImpl();
//        List<BidRecord> list = bidRecordDao.selectByMbrID(2, 1);
//        System.out.println(list);

//        BidRecordDao bidRecordDao = new BidRecordDaoImpl();
//        BidRecord bidRecord = new BidRecord();
//        bidRecord.setMbrID(1);
//        bidRecord.setBidID(1);
//        bidRecord.setBidAmount(650);
//        bidRecordDao.insert(bidRecord);
    }
}
