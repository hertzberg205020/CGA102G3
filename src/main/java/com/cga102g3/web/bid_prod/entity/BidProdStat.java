package com.cga102g3.web.bid_prod.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-23 下午 11:01
 */
public interface BidProdStat {
    // 0: 安排競標, 1: 待上架, 2: 標案進行中, 3: 結帳售出, 4: 流標, 5: 撤銷
    int ON_SCHEDULE = 0;
    int ALREADY = 1;
    int LAUNCHED = 2;
    int SOLD = 3;
    int NO_TENDER = 4;
    int ABANDON = 5;
}
