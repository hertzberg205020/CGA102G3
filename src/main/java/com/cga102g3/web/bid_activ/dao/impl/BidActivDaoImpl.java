package com.cga102g3.web.bid_activ.dao.impl;

import com.cga102g3.core.util.JedisPoolUtil;
import com.cga102g3.web.bid_activ.dao.BidActivDao;
import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_activ.entity.Bidder;
import com.cga102g3.web.bid_activ.util.BidActivUtil;
import com.cga102g3.web.bid_prod.dao.BidProdDao;
import com.cga102g3.web.bid_prod.dao.impl.BidProdDaoImpl;
import com.cga102g3.web.bid_prod.entity.BidProd;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 07:13
 */
public class BidActivDaoImpl implements BidActivDao {
    private final Gson gson = new GsonBuilder().create();
    private static final JedisPool pool = JedisPoolUtil.getJedisPool();

    @Override
    public void insert(BidActiv bidActiv) {
        try (Jedis jedis = pool.getResource();) {
            String jsonActiv = gson.toJson(bidActiv);
            jedis.set(bidActiv.getBidActivID(), jsonActiv);
            jedis.sadd("activitiesIDs", bidActiv.getBidActivID());
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
            if (jedis.get("bidActiv:" + bidID) != null &&
                    this.getCurWinner(bidID).getPrice() < bidder.getPrice()) {
                // 當有相對應的競標商品，且出價高於目前最高出價才新增成功
                jedis.zadd("bidActiv:" + bidID + ":rec", bidder.getPrice(), bidder.getMbrID().toString());
            }
        }
    }

    @Override
    public Bidder getCurWinner(Integer bidID) {

        try (Jedis jedis = pool.getResource();) {
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
//        bidActivDao.updateRec(2, new Bidder(1, 500));
//        bidActivDao.updateRec(2, new Bidder(2, 600));
//        bidActivDao.updateRec(2, new Bidder(3, 700));
//        bidActivDao.updateRec(2, new Bidder(1, 800));
//        bidActivDao.updateRec(2, new Bidder(3, 1000));

        // 依競標商品編號查詢目前最高出價者以及出資金額
//        Bidder curWinner = bidActivDao.getCurWinner(2);
//        System.out.println(curWinner);

        // 依競標商品編號查詢目前所有出價者以及出資金額
        List<Bidder> allBidders = bidActivDao.getAllBidders(2);
        System.out.println(allBidders);

        // 依bidActivID刪除redis對應的競標活動
//        bidActivDao.delete(1);

        //

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

        // 關閉連接池
        JedisPoolUtil.shutdownJedisPool();
    }
}
