package com.cga102g3.web.bid_order.dao;


import com.cga102g3.core.dao.CoreDao;
import com.cga102g3.web.bid_order.entity.BidOrder;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-11 上午 11:31
 */
public interface BidOrderDao extends CoreDao<BidOrder, Integer> {
    List<BidOrder> selectByMbrID(Integer mbrID, Integer page);

//    List<BidOrder> selectByPaySeller(Boolean paySeller, Integer page);
    List<BidOrder> selectAll(Integer page);
    int insert(Connection conn, BidOrder bidOrder) throws SQLException;
    List<Map<String, Object>> selectByMbrID(Integer mbrID);
    int updateStat2Delivered(Integer bidOrderID);

    List<BidOrder> selectByOrderDate(Timestamp startDate, Timestamp endDate);
    List<BidOrder> selectNewOrder();
    List<BidOrder> selectShipStat(Integer bidShipStat);
    int updateShipped(Integer bidOrderID);

}
