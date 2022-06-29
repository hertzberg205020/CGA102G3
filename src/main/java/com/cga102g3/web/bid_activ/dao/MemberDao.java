package com.cga102g3.web.bid_activ.dao;

import com.cga102g3.web.bid_activ.entity.Member;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 02:10
 */
public interface MemberDao {
    Member selectByIDWithTCoinBal(Integer mbrID);
    boolean chkEnufBal(Integer mbrID, Integer price);
    int prepaid4Bid(Connection conn, Integer mbrID, Integer amount) throws SQLException;
    int refund4bid(Connection conn, Integer mbrID, Integer amount) throws SQLException;
}
