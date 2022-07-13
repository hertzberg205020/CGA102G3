package com.cga102g3.web.bid_activ.dao.impl;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.core.util.JedisPoolUtil;
import com.cga102g3.web.bid_activ.dao.BidActivDao;
import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_activ.entity.Bidder;
import com.cga102g3.web.bid_activ.util.BidActivUtil;
import com.cga102g3.web.bid_prod.dao.BidProdDao;
import com.cga102g3.web.bid_prod.dao.impl.BidProdDaoImpl;
import com.cga102g3.web.bid_prod.entity.BidProd;
import com.cga102g3.web.book.entity.Book;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 07:13
 */
public class BidActivDaoImpl implements BidActivDao {
    private final Gson gson = new GsonBuilder().create();
    private static final JedisPool pool = JedisPoolUtil.getJedisPool();
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    private final int pageSize = Integer.parseInt(
            ResourceBundle.getBundle("jdbc").getString("pageSize"));

    @Override
    public void insert(BidActiv bidActiv) {
        try (Jedis jedis = pool.getResource();) {
            String jsonActiv = gson.toJson(bidActiv);
            jedis.set(bidActiv.getBidActivID(), jsonActiv);
            jedis.sadd("activitiesIDs", bidActiv.getBidActivID());
        }
    }

    @Override
    public void insert(List<BidActiv> bidActivs) {
        try (Jedis jedis = pool.getResource();) {
            String jsonActiv = null;
            for (BidActiv bidActiv :
                    bidActivs) {
                jsonActiv = gson.toJson(bidActiv);
                jedis.set(bidActiv.getBidActivID(), jsonActiv);
                jedis.sadd("activitiesIDs", bidActiv.getBidActivID());
            }
        }
    }

    @Override
    public void delete(Integer bidID) {
        try (Jedis jedis = pool.getResource();) {
            jedis.del("bidActiv:" + bidID + ":rec");
            jedis.del("bidActiv:" + bidID);
            jedis.srem("activitiesIDs", "bidActiv:" + bidID);
        }

        // 不可以在方法中直接刪除ACTIVITIES對應的activityID，會出現同步問題
//        ACTIVITIES.remove(bidActivID);

    }

    @Override
    public void delete(String bidActivID) {
        try (Jedis jedis = pool.getResource();) {
            // 刪除競標價格紀錄
            jedis.del(bidActivID + ":rec");
            // 刪除競標活動訊息
            jedis.del(bidActivID);
            //
            jedis.srem("activitiesIDs", bidActivID);
        }
    }

    @Override
    public List<BidActiv> getAll() {

        List<BidActiv> bidActivs = new ArrayList<>();
        try (Jedis jedis = pool.getResource();) {
            Set<String> allActivitiesIDs = this.getAllActivitiesIDs();
            for (String bidActivID : allActivitiesIDs) {
                String json = jedis.get(bidActivID);
                BidActiv bidActiv = gson.fromJson(json, BidActiv.class);
                bidActivs.add(bidActiv);
            }
        }
        return bidActivs;
    }

    @Override
    public void updateRec(Integer bidID, Bidder bidder) {
        try(Jedis jedis = pool.getResource();) {
            String json = jedis.get("bidActiv:" + bidID);
            if (json != null) {
                BidActiv bidActiv = gson.fromJson(json, BidActiv.class);
                // 當有相對應的競標商品，且 出價高於目前最高出價才新增成功， 且 出價金額小於 直購價
                if (bidActiv.getStartPrice() <= bidder.getPrice() && // 當有相對應的競標商品
                        // 出價高於目前最高出價才新增成功
                        (this.getCurWinner(bidID) == null || this.getCurWinner(bidID).getPrice() < bidder.getPrice()) &&
                        // 出價金額 小於 直購價
                        bidder.getPrice() <= bidActiv.getBidDirectPrice()
                ) {
                    jedis.zadd("bidActiv:" + bidID + ":rec", bidder.getPrice(), bidder.getMbrID().toString());
                }
            }
        }
    }

    @Override
    public Bidder getCurWinner(Integer bidID) {

        try (Jedis jedis = pool.getResource();) {
            // 找到出價排名最高的
            Set<String> mbrIDSet = jedis.zrange("bidActiv:" + bidID + ":rec", -1, -1);
            if (!mbrIDSet.isEmpty()) {
                String mbrID = mbrIDSet.toArray(new String[1])[0];
                Double price = jedis.zscore("bidActiv:" + bidID + ":rec", mbrID);
                return new Bidder(Integer.valueOf(mbrID), price.intValue());
            }
            return null;
        }
    }

    @Override
    public List<Bidder> getAllBidders(Integer bidID) {
        List<Bidder> bidders = new ArrayList<>();
        try (Jedis jedis = pool.getResource();) {
            // 找出所有的出價者
            Set<String> mbrIDsSet = jedis.zrange("bidActiv:" + bidID + ":rec", 0, -1);
            if (!mbrIDsSet.isEmpty()) {
                String[] mbrIDsStrArr = mbrIDsSet.toArray(new String[1]);
                for (String mbrIDStr :
                        mbrIDsStrArr) {
                    bidders.add(new Bidder(Integer.valueOf(mbrIDStr),
                            jedis.zscore("bidActiv:" + bidID + ":rec", mbrIDStr).intValue()));
                }
                return bidders;
            }
            return bidders;
        }
    }

    @Override
    public Set<String> getAllActivitiesIDs() {
        try (Jedis jedis = pool.getResource();) {
            return jedis.smembers("activitiesIDs");
        }
    }

    @Override
    public boolean isExists(Integer bidID) {
        try (Jedis jedis = pool.getResource();) {
            Set<String> activitiesIDs = jedis.smembers("activitiesIDs");
            String activity = "bidActiv:" + bidID;
            return activitiesIDs.contains(activity);
        }
    }



    @Override
    public Set<BidActiv> getExpiredActivs() {
        Set<BidActiv> expiredActivs = new HashSet<>();
        long now = new Date().getTime();
        try (Jedis jedis = pool.getResource();) {
            Set<String> activitiesIDs = jedis.smembers("activitiesIDs");
            for (String activID :
                    activitiesIDs) {
                String json = jedis.get(activID);
                BidActiv bidActiv = gson.fromJson(json, BidActiv.class);
                if (bidActiv.getBidEnd() <= now) {
                    expiredActivs.add(bidActiv);
                }
            }
        }
        return expiredActivs;
    }

    @Override
    public BidActiv getBidActivity(Integer bidID) {
        try (Jedis jedis = pool.getResource();) {
            if (isExists(bidID)) {
                String json = jedis.get("bidActiv:" + bidID);
                return gson.fromJson(json, BidActiv.class);
            }
            return null;
        }
    }

    @Override
    public List<Map<String, Object>> selectAllBidInfo(Integer page) {
        final String sql =
                    "SELECT bp.bid_id, b.ISBN, b.edition, b.title, bp.bid_end, b.book_ID\n" +
                    "FROM bid_prod AS bp\n" +
                    "     join book b on bp.book_id = b.book_ID\n" +
                    "WHERE now() between bid_start AND bid_end\n" +
                    "     AND bid_prod_stat = 2\n" +
                    "ORDER BY bp.bid_id\n" +
                    "LIMIT ?, ?;";

        List<Map<String, Object>> bidInfoList = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setInt(1, pageSize * (page - 1));
            pstmt.setInt(2, pageSize + 1);
            ResultSet rs = pstmt.executeQuery();
            bidInfoList = retrieve(rs);
            return bidInfoList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> selectBidInfoByISBN(String ISBN, int page) {
        final String sql =
                "SELECT bp.bid_id, b.ISBN, b.edition, b.title, bp.bid_end, b.book_ID\n" +
                "FROM bid_prod AS bp\n" +
                "         JOIN book AS b\n" +
                "                ON bp.book_id = b.book_ID\n" +
                "WHERE\n" +
                "    NOW() BETWEEN bid_start AND bid_end\n" +
                "    AND bid_prod_stat = 2\n" +
                "    AND b.ISBN = ?\n" +
                "ORDER BY bp.bid_id\n" +
                "LIMIT ?, ?;";

        List<Map<String, Object>> bidInfoList = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, ISBN);
            pstmt.setInt(2, pageSize * (page - 1));
            pstmt.setInt(3, pageSize + 1);
            ResultSet rs = pstmt.executeQuery();
            bidInfoList = retrieve(rs);
            return bidInfoList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> selectBidInfoByTitle(String title, int page) {
//        final String sql =
//                "SELECT bp.bid_id, b.ISBN, b.edition, b.title, bp.bid_end\n" +
//                "FROM bid_prod AS bp\n" +
//                "         JOIN (SELECT *\n" +
//                "               FROM book\n" +
//                "               WHERE lower(title) regexp concat(lower(?), '')\n" +
//                "             ) AS b\n" +
//                "                ON bp.bid_id = b.book_ID\n" +
//                "WHERE\n" +
//                "    NOW() BETWEEN bid_start AND bid_end\n" +
//                "    AND bid_prod_stat = 2\n" +
//                "ORDER BY bp.bid_id\n" +
//                "LIMIT ?, ?;";

        final String sql =
                "SELECT bp.bid_id, b.ISBN, b.edition, b.title, bp.bid_end, b.book_ID\n" +
                "FROM bid_prod AS bp\n" +
                "         JOIN book AS b\n" +
                "                ON bp.book_id = b.book_ID\n" +
                "WHERE\n" +
                "    NOW() BETWEEN bid_start AND bid_end\n" +
                "    AND bid_prod_stat = 2\n" +
                "    AND LOWER(b.title) LIKE CONCAT('%', LOWER(?), '%')\n" +
                "ORDER BY bp.bid_id\n" +
                "LIMIT ?, ?;";

        List<Map<String, Object>> bidInfoList = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, title);
            pstmt.setInt(2, pageSize * (page - 1));
            pstmt.setInt(3, pageSize + 1);
            ResultSet rs = pstmt.executeQuery();
            bidInfoList = retrieve(rs);
            return bidInfoList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> selectAllBidInfo() {
        final String sql =
                "SELECT bp.bid_id, b.ISBN, b.edition, b.title, bp.bid_end, b.book_ID\n" +
                "FROM bid_prod AS bp\n" +
                "     join book b on bp.book_id = b.book_ID\n" +
                "WHERE now() between bid_start AND bid_end\n" +
                "     AND bid_prod_stat = 2\n" +
                "ORDER BY bp.bid_id\n";

        List<Map<String, Object>> bidInfoList = null;

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            ResultSet rs = pstmt.executeQuery();
            bidInfoList = retrieve(rs);
            return bidInfoList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 將查詢結果放入list中，並返回
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<Map<String, Object>> retrieve(ResultSet rs) throws SQLException {
        List<Map<String, Object>> bidInfoList = new ArrayList<>();
        while (rs.next()) {
            Map<String, Object> bidInfo = new HashMap<>();
            bidInfo.put("bid_id", rs.getInt("bid_id"));
            bidInfo.put("ISBN", rs.getString("ISBN"));
            bidInfo.put("edition", rs.getInt("edition"));
            bidInfo.put("title", rs.getString("title"));
            bidInfo.put("bid_end", sdf.format(rs.getTimestamp("bid_end")));
            bidInfo.put("book_id", rs.getInt("book_id"));
            bidInfoList.add(bidInfo);
        }
        return bidInfoList;
    }

    public static void main(String[] args) {
        // 將競拍可以上架商品放到redis中
        BidActivDao bidActivDao = new BidActivDaoImpl();
        // 添加競拍活動到redis
//        BidProdDao bidProdDao = new BidProdDaoImpl();
//        BidProd bidProd = bidProdDao.selectByPrimaryKey(1);
//        BidActiv bidActiv = BidActivUtil.fromBidProd2BidActiv(bidProd);
//        bidActivDao.insert(bidActiv);
//        System.out.println(ACTIVITIES);

        // 查詢測試
//        BidProdDao bidProdDao = new BidProdDaoImpl();
//        List<BidProd> bidProds = new ArrayList<>();
//        bidProds.add(bidProdDao.selectByPrimaryKey(1));
//        bidProds.add(bidProdDao.selectByPrimaryKey(2));
//        bidProds.add(bidProdDao.selectByPrimaryKey(3));
//        List<BidActiv> activities = new ArrayList<>();
//        for (BidProd bidProd :
//                bidProds) {
//            activities.add(BidActivUtil.fromBidProd2BidActiv(bidProd));
//        }
//        for (BidActiv activity :
//                activities) {
//            bidActivDao.insert(activity);
//        }
//        System.out.println(bidActivDao.getAllActivitiesIDs());
//
//        for (String bidActivID : bidActivDao.getAllActivitiesIDs()) {
//            int i = bidActivID.lastIndexOf(":");
//            bidActivDao.delete(Integer.valueOf(bidActivID.substring(i + 1)));
//        }
//        System.out.println(bidActivDao.getAllActivitiesIDs());

        // 測試查閱目前所有的競標活動
//        BidProdDao bidProdDao = new BidProdDaoImpl();
//        List<BidProd> bidProds = new ArrayList<>();
//        bidProds.add(bidProdDao.selectByPrimaryKey(1));
//        bidProds.add(bidProdDao.selectByPrimaryKey(2));
//        bidProds.add(bidProdDao.selectByPrimaryKey(3));
//        List<BidActiv> activities = new ArrayList<>();
//        for (BidProd bidProd :
//                bidProds) {
//            activities.add(BidActivUtil.fromBidProd2BidActiv(bidProd));
//        }
//        for (BidActiv activity :
//                activities) {
//            bidActivDao.insert(activity);
//        }
//        System.out.println(bidActivDao.getAll());


        // 每次添加一筆投標紀錄
//        bidActivDao.updateRec(2, new Bidder(1, 110));
//        bidActivDao.updateRec(2, new Bidder(2, 150));
//        bidActivDao.updateRec(2, new Bidder(3, 200));
//        bidActivDao.updateRec(2, new Bidder(1, 800));

        // 依競標商品編號查詢目前最高出價者以及出資金額
//        Bidder curWinner = bidActivDao.getCurWinner(2);
//        System.out.println(curWinner);

        // 依競標商品編號查詢目前所有出價者以及出資金額
//        List<Bidder> allBidders = bidActivDao.getAllBidders(2);
//        System.out.println(allBidders);

        // 依bidActivID刪除redis對應的競標活動
//        bidActivDao.delete(1);

        // 找出逾期的上架標案
//        Set<BidActiv> expiredActivIDs = bidActivDao.getExpiredActivs();
//        System.out.println(expiredActivIDs);

        // 依競標商品編號查詢競標活動
//        System.out.println(bidActivDao.getBidActivity(1));

        // -----------------------------jedis範例-----------------------------
//        // jedis範例
//        Jedis jedis = pool.getResource();
//        // 添加數據
//        jedis.zadd("scores1", 92, "Vincent");
//        // 取得最高分人的名字
//        // 若找不到對應的scores1這個key，則回傳空的Set，不是null
//        jedis.zrange("scores1", -1, -1);
//        String stu = jedis.zrange("scores1", -1, -1).toArray(new String[1])[0];
//        // 取得最高分人的分數
//        System.out.println(stu +": "+ jedis.zscore("scores1", stu));
//        // 刪除此次小考成績
//        jedis.del("scores1");
        // -----------------------------jedis範例-----------------------------




        // sql
//        System.out.println(bidActivDao.selectAllBidInfo(1));
//        List<Map<String, Object>> maps = bidActivDao.selectBidInfoByTitle("c", 1);
//        maps.forEach(e -> System.out.println(e.get("title")));
//        System.out.println(bidActivDao.selectBidInfoByISBN("9787121408564", 1));
//        List<Map<String, Object>> maps = bidActivDao.selectBidInfoByISBN("9789864761760", 1);
//        System.out.println(maps);
        // 關閉連接池
        JedisPoolUtil.shutdownJedisPool();
    }
}
