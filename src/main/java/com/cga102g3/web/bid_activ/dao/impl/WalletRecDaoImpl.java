package com.cga102g3.web.bid_activ.dao.impl;

import com.cga102g3.web.bid_activ.dao.WalletRecDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 02:50
 */
public class WalletRecDaoImpl implements WalletRecDao {

//    錢包使用備註 0: 會員儲值, 1: 支出, 2: 收入(平台支付二手賣家), 3: 競標預扣除金額, 4: 競標金額退回
    @Override
    public int prepaid4Bid(Connection conn, Integer mbrID, Integer amount) throws SQLException {
        final String sql =
                "INSERT INTO wallet_record(mbr_ID, note, amount) \n" +
                "values (?, 3, ?);";
        try(PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, mbrID);
            ps.setInt(2, amount);
            return ps.executeUpdate();
        }
    }

    @Override
    public int refund4bid(Connection conn, Integer mbrID, Integer amount) throws SQLException {
        final String sql =
                "INSERT INTO wallet_record(mbr_ID, note, amount) \n" +
                "values (?, 4, ?);";
        try(PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, mbrID);
            ps.setInt(2, amount);
            return ps.executeUpdate();
        }
    }
}
