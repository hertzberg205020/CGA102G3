package com.cga102g3.web.bid_activ.service.impl;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.core.util.JedisPoolUtil;
import com.cga102g3.web.bid_activ.dao.BidActivDao;
import com.cga102g3.web.bid_activ.dao.impl.BidActivDaoImpl;
import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_activ.entity.Bidder;
import com.cga102g3.web.bid_activ.service.BidActivitiesSchedulingService;
import com.cga102g3.web.bid_order.dao.BidOrderDao;
import com.cga102g3.web.bid_order.dao.impl.BidOrderDaoImpl;
import com.cga102g3.web.bid_order.entity.BidOrder;
import com.cga102g3.web.bid_prod.dao.BidProdDao;
import com.cga102g3.web.bid_prod.dao.impl.BidProdDaoImpl;
import com.cga102g3.web.bid_prod.entity.BidProd;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import static com.cga102g3.web.bid_activ.util.BidActivUtil.fromBidProd2BidActiv;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-24 上午 09:52
 */
public class BidActivitiesSchedulingServiceImpl implements BidActivitiesSchedulingService {
    private final BidProdDao bidProdDao = new BidProdDaoImpl();
    private final BidActivDao bidActivDao = new BidActivDaoImpl();
    private final BidOrderDao bidOrderDao = new BidOrderDaoImpl();
    @Override
    public void launchProducts() {
        // 1. 查找狀態為ALREADY(待上架的商品) 且 競標時間 小於或等於目前時間，回傳List<BidProd>
        // 2. 將待上架商品狀態調整成LAUNCHED(上架中)
        // 3. 以上2個為一次交易
        List<BidProd> launchProducts = getLaunchProducts();
        // 4. 將待上架放到redis
        if (launchProducts != null) {
            List<BidActiv> bidActivs = fromBidProd2BidActiv(launchProducts);
            bidActivDao.insert(bidActivs);
        }
    }

    @Override
    public void discontinuedProducts() {
        // 1. 獲取逾期的競標活動，取得投標金額最高者會員id與投標金額
        Set<BidActiv> expiredActivs = bidActivDao.getExpiredActivs();
        // 2-1. 若有人投標，則取出投標金額最高找並記錄，商品狀態邊更為結帳售出
        // 2-2. 新增標訂單
        // 3. 若沒人投標，則商品狀態變更為流標
        persistActivsRes(expiredActivs);
        // 4. 將活動下架
        for (BidActiv activity :
                expiredActivs) {
            bidActivDao.delete(activity.getBidActivID());
        }
    }

    /**
     * 查找狀態為ALREADY(待上架的商品) 且 競標時間 小於或等於目前時間
     * 將待上架商品狀態調整成LAUNCHED(上架中)
     * @return List<BidProd> 要上架的商品
     */
    public List<BidProd> getLaunchProducts() {
        List<BidProd> bidProds = null;
        try (Connection conn = JDBCUtil.getConnection();){
            // 開啟交易模式
            conn.setAutoCommit(false);
            try{
                bidProds = bidProdDao.selectEnableLaunchProducts(conn);
                bidProdDao.updateStat2Launch(conn, bidProds);
                conn.commit();
                // 結束交易模式
                conn.setAutoCommit(true);
                return bidProds;
            } catch (SQLException se) {
                se.printStackTrace();
                try {
                    conn.rollback();
                } catch (SQLException excep) {
                    throw new RuntimeException("rollback error occurred. "
                            + excep.getMessage());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void persistActivsRes(Set<BidActiv> activities) {
        for (BidActiv activity :
                activities) {
            if (bidActivDao.getCurWinner(activity.getBidID()) != null) {
                // 若有人投標，則取出投標金額最高找並記錄，商品狀態邊更為結帳售出
                // 新增標訂單
                Bidder curWinner = bidActivDao.getCurWinner(activity.getBidID());
                Integer price = curWinner.getPrice();
                Integer mbrID = curWinner.getMbrID();
                try (Connection conn = JDBCUtil.getConnection();){
                    // 開啟交易模式
                    conn.setAutoCommit(false);
                    try{
                        bidProdDao.updateStat2Sold(conn, activity.getBidID());
                        bidOrderDao.insert(conn, new BidOrder(activity.getBidID(), mbrID, price));
                        conn.commit();
                        // 結束交易模式
                        conn.setAutoCommit(true);
                    } catch (SQLException se) {
                        se.printStackTrace();
                        try {
                            conn.rollback();
                        } catch (SQLException excep) {
                            throw new RuntimeException("rollback error occurred. "
                                    + excep.getMessage());
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                // 若沒人投標，則商品狀態變更為流標
                bidProdDao.updateStat2NoTender(activity.getBidID());
            }
        }
    }


    public static void main(String[] args) {
        BidActivitiesSchedulingService bidActivitiesSchedulingService = new BidActivitiesSchedulingServiceImpl();
//        List<BidProd> launchProducts = null;
//        launchProducts = bidActivitiesSchedulingService.getLaunchProducts();
//        System.out.println(launchProducts);
//        bidActivitiesSchedulingService.launchProducts();
        bidActivitiesSchedulingService.discontinuedProducts();
        JedisPoolUtil.shutdownJedisPool();
    }
}
