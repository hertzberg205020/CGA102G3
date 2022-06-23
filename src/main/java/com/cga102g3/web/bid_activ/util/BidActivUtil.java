package com.cga102g3.web.bid_activ.util;

import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_prod.entity.BidProd;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 06:55
 */
public class BidActivUtil {
    public static BidActiv fromBidProd2BidActiv(BidProd bidProd) {
        return new BidActiv(
               "bidActiv:" + bidProd.getBidID(),
                bidProd.getBidID(),
                "bidActiv:" + bidProd.getBidID() + ":rec",
                bidProd.getBidStart().getTime(),
                bidProd.getBidEnd().getTime(),
                bidProd.getBidDirectPrice()
        );
    }
}
