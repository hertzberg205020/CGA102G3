package com.cga102g3.web.bid_activ.util;

import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_prod.entity.BidProd;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 06:55
 */
public class BidActivUtil {
    public static BidActiv fromBidProd2BidActiv(BidProd bidProd) {
//        return new BidActiv(
//               "bidActiv:" + bidProd.getBidID(),
//                bidProd.getBidID(),
//                bidProd.getBookID(),
//                bidProd.getStartPrice() != null ? bidProd.getStartPrice() : 0,
//                "bidActiv:" + bidProd.getBidID() + ":rec",
//                bidProd.getBidStart().getTime(),
//                bidProd.getBidEnd().getTime(),
//                bidProd.getBidDirectPrice()
//        );
        return new BidActiv.Builder()
                .setBidActivID("bidActiv:" + bidProd.getBidID())
                .setBidID(bidProd.getBidID())
                .setBookID(bidProd.getBookID())
                .setStartPrice(bidProd.getStartPrice() != null ? bidProd.getStartPrice() : 0)
                .setZsetKey4Recs("bidActiv:" + bidProd.getBidID() + ":rec")
                .setBidStart(bidProd.getBidStart().getTime())
                .setBidEnd(bidProd.getBidEnd().getTime())
                .setBidDirectPrice(bidProd.getBidDirectPrice())
                .build();
    }

    public static List<BidActiv> fromBidProd2BidActiv(List<BidProd> bidProds) {
        List<BidActiv> activities = new ArrayList<>();
        for (BidProd bidProd :
                bidProds) {
            activities.add(fromBidProd2BidActiv(bidProd));
        }
        return activities;
    }


}
