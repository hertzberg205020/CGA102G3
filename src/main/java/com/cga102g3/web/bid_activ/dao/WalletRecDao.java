package com.cga102g3.web.bid_activ.dao;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 02:44
 */
public interface WalletRecDao {
    int prepaid4Bid(Connection conn, Integer mbrID, Integer amount) throws SQLException;
    int refund4bid(Connection conn, Integer mbrID, Integer amount) throws SQLException;
}
