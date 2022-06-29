package com.cga102g3.web.bid_prod.dao;


import com.cga102g3.core.dao.CoreDao;
import com.cga102g3.web.bid_prod.entity.BidProd;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-06 上午 08:55
 */
public interface BidProdDao extends CoreDao<BidProd, Integer> {
    List<BidProd> selectByBidProdStat(Integer bidProdStat, Integer page);
    List<BidProd> selectByBidProdStat(Integer bidProdStat);
    List<BidProd> selectByBidProdName(String bookName, Integer page);
    List<BidProd> selectAll(Integer page);
    int updateStat2Launch(Connection conn, Integer bidID);
    int updateStat2Launch(Connection conn, List<BidProd> bidProds) throws SQLException;
    int updateStat2Sold(Integer bidID);
    int updateStat2Sold(Connection conn, Integer bidID) throws SQLException;
    int updateStat2NoTender(Integer bidID);
    int updateStat2Abandon(Integer bidID);
    List<BidProd> selectEnableLaunchProducts(Connection conn) throws SQLException;
}
