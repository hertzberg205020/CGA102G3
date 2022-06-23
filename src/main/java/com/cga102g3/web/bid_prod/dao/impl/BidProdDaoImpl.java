package com.cga102g3.web.bid_prod.dao.impl;


import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.bid_prod.dao.BidProdDao;
import com.cga102g3.web.bid_prod.entity.BidProd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 競標商品dao
 * @Author Robert
 * @Version
 * @Date 2022-06-06 上午 09:00
 */
public class BidProdDaoImpl implements BidProdDao {

    @Override
    public int insert(BidProd pojo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        final String sql =
                "insert into bid_prod(book_id, start_price, bid_direct_price, bid_cur_price,\n" +
                "                     bid_prod_stat, bid_start, bid_end)\n" +
                "VALUES(?, ?, ?, ?, ?, ?, ?);";
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            setBidProdInfo(pstmt, pojo);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return 0;
    }

    /**
     * 將pojo屬性設置給佔位符
     * @param ps
     * @param pojo
     * @throws SQLException
     */
    private void setBidProdInfo(PreparedStatement ps, BidProd pojo) throws SQLException {
        ps.setInt(1, pojo.getBookID());
        ps.setInt(2, pojo.getStartPrice());
        ps.setInt(3, pojo.getBidDirectPrice());
        ps.setInt(4, pojo.getBidCurPrice());
        ps.setInt(5, pojo.getBidProdStat());
        ps.setTimestamp(6, pojo.getBidStart());
        ps.setTimestamp(7, pojo.getBidEnd());
    }

    /**
     * 未實現
     * @param id
     * @return
     */
    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(BidProd pojo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        final String sql =
                "update bid_prod\n" +
                "set book_id = ?, start_price = ?, bid_direct_price = ?, bid_cur_price = ?,\n" +
                "    bid_prod_stat = ?, bid_start = ?, bid_end = ?\n" +
                "where bid_id = ?;";
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            setBidProdInfo(pstmt, pojo);
            pstmt.setInt(8, pojo.getBidID());
            return pstmt.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return 0;
    }

    @Override
    public BidProd selectByPrimaryKey(Integer id) {
        BidProd bidProd = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        final String sql =
                "select bid_id, book_id, start_price, bid_direct_price,\n" +
                "       bid_cur_price, bid_prod_stat, bid_start, bid_end\n" +
                "from bid_prod\n" +
                "where bid_id = ?;";
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

//            List<BidProd> list = retrieve(rs);
//            bidProd = list.get(0);
            
            while (rs.next()) {
            	bidProd = new BidProd();
            	bidProd.setBidID(rs.getInt("bid_id"));
                bidProd.setBookID(rs.getInt("book_id"));
                bidProd.setStartPrice(rs.getInt("start_price"));
                bidProd.setBidDirectPrice(rs.getInt("bid_direct_price"));
                bidProd.setBidCurPrice(rs.getInt("bid_cur_price"));
                bidProd.setBidProdStat(rs.getInt("bid_prod_stat"));
                bidProd.setBidStart(rs.getTimestamp("bid_start"));
                bidProd.setBidEnd(rs.getTimestamp("bid_end"));
                
            }
            

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return bidProd;

    }

    /**
     * 未實現
     * @return
     */
    @Override
    public List<BidProd> selectAll() {
        List<BidProd> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        final String sql =
                "select bid_id, book_id, start_price, bid_direct_price,\n" +
                "       bid_cur_price, bid_prod_stat, bid_start, bid_end\n" +
                "from bid_prod\n";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            list = retrieve(rs); 
            }
        catch (SQLException e){
        	 e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return list;
        }
    

    /**
     * 查詢全部競標商品，每頁12筆資料
     * Update page limit section 
     * @param page
     * @return
     */
    @Override
    public List<BidProd> selectAll(Integer page) {
        List<BidProd> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        final String sql =
                "select bid_id, book_id, start_price, bid_direct_price,\n" +
                "       bid_cur_price, bid_prod_stat, bid_start, bid_end\n" +
                "from bid_prod\n" +
                "limit ?, ?;";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
              ps.setInt(1, pageSize * (page - 1));
//            ps.setInt(1, page * (pageSize - 1)); // 原本的寫法
            ps.setInt(2, pageSize + 1) ; // 取13筆
            rs = ps.executeQuery();
            list = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return list;
    }

    /**
     * 依賣家編號查詢競標商品，每頁12筆資料 
     * Remove this method 
     * @param mbrID
     * @param page
     * @return
     */
//    @Override
//    public List<BidProd> selectByMbr(Integer mbrID, Integer page) {
//        List<BidProd> list = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        final String sql =
//                "select bid_id, book_id, mbr_id, start_price, bid_direct_price,\n" +
//                "       bid_cur_price, bid_prod_stat, `condition`, bid_start, bid_end\n" +
//                "from bid_prod\n" +
//                "where mbr_id = ?\n" +
//                "limit ?, ?;";
//        try {
//            conn = JDBCUtil.getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(2,  page * (pageSize - 1));
//            ps.setInt(3, pageSize );
//            rs = ps.executeQuery();
//            list = retrieve(rs);
//        } catch (SQLException e) { 
//            e.printStackTrace();
//        } finally {
//            JDBCUtil.close(conn, ps, rs);
//        }
//
//        return list;
//    	return null;
//    }

    /**
     * 依競標商品狀態查詢競標商品，每頁12筆資料
     * @param bidProdStat
     * @param page
     * @return
     */
    @Override
    public List<BidProd> selectByBidProdStat(Integer bidProdStat, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidProd> list = null;
        final String sql =
                "select bid_id, book_id, start_price, bid_direct_price,\n" +
                "       bid_cur_price, bid_prod_stat, bid_start, bid_end\n" +
                "from bid_prod\n" +
                "where bid_prod_stat = ?\n" +
                "limit ?, ?;";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bidProdStat);
            pstmt.setInt(2, pageSize * (page - 1));
            pstmt.setInt(3, pageSize);
            rs = pstmt.executeQuery();
            list = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return list;
    }
    @Override
	public List<BidProd> selectByBidProdStat(Integer bidProdStat) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidProd> list = null;
        final String sql =
                "select bid_id, book_id, start_price, bid_direct_price,\n" +
                "       bid_cur_price, bid_prod_stat, bid_start, bid_end\n" +
                "from bid_prod\n" +
                "where bid_prod_stat = ?\n";
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bidProdStat);
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
     * 依競標商品名稱查詢競標商品，每頁12筆資料
     * @param bookName
     * @param page
     * @return
     */
    @Override
	public List<BidProd> selectByBidProdName(String bookName, Integer page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BidProd> list = null;
        final String sql = "";

    	return null;
	}

	/**
     * 將查詢結果放入list中，並返回
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<BidProd> retrieve(ResultSet rs) throws SQLException {
        List<BidProd> list = new ArrayList<>();
        while (rs.next()) {
            BidProd bidProd = new BidProd();
            bidProd.setBidID(rs.getInt("bid_id"));
            bidProd.setBookID(rs.getInt("book_id"));
            bidProd.setStartPrice(rs.getInt("start_price"));
            bidProd.setBidDirectPrice(rs.getInt("bid_direct_price"));
            bidProd.setBidCurPrice(rs.getInt("bid_cur_price"));
            bidProd.setBidProdStat(rs.getInt("bid_prod_stat"));
            bidProd.setBidStart(rs.getTimestamp("bid_start"));
            bidProd.setBidEnd(rs.getTimestamp("bid_end"));
            list.add(bidProd);
        }
        return list;
    }

    public static void main(String[] args) {
        BidProdDao bidProdDao = new BidProdDaoImpl();
        
        /* Find by Primary Key*/
//          BidProd bidProd = bidProdDao.selectByPrimaryKey(36);
//          System.out.println(bidProd);

        /* List All (limit 12 row per page) */
//        List<BidProd> list = bidProdDao.selectAll();
//        for (BidProd aBidProd: list) {
//        	System.out.println(aBidProd);}
//
//        System.out.println(list);
//
        /* (X) Find by Member */
//        List<BidProd> list = bidProdDao.selectByMbr(1, 1);
//        System.out.println(list);

        /* Find by Product State */
//        List<BidProd> list = bidProdDao.selectByBidProdStat(0, 2);
//	      for (BidProd aBidProd: list) {
//	    	System.out.println(aBidProd);
//	    }
//        List<BidProd> list = bidProdDao.selectByBidProdStat(1);
//	      for (BidProd aBidProd: list) {
//	    	System.out.println(aBidProd);
//	    }
//        System.out.println(list);

        
        /* Insert data into bid_prod table */
//        BidProd bidProd = new BidProd();
//        bidProd.setBookID(12);
//        GregorianCalendar calendar = new GregorianCalendar(2022, Calendar.AUGUST, 15, 9, 0,0);
//        Timestamp start = new Timestamp(calendar.getTimeInMillis());
//        calendar.add(Calendar.DATE, 1);
//        Timestamp end = new Timestamp(calendar.getTimeInMillis());
//        
//        bidProd.setBidProdStat(0);
//        bidProd.setBidStart(start);
//        bidProd.setBidEnd(end);
//        bidProdDao.insert(bidProd);

        /* Update data for bid_prod table */ 
//        BidProd bidProd = new BidProd();
//        bidProd.setBidID(5);
//        bidProd.setBookID(10);
//        
//        GregorianCalendar calendar = new GregorianCalendar(2022, Calendar.JULY, 15, 9, 0,0);
//	    Timestamp start = new Timestamp(calendar.getTimeInMillis());
//	    calendar.add(Calendar.DATE, 30);
//	    Timestamp end = new Timestamp(calendar.getTimeInMillis());
//
//        bidProd.setBidStart(start);
//        bidProd.setBidEnd(end);
//        
//        bidProdDao.update(bidProd);


    }
}
