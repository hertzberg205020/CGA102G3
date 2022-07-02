package com.cga102g3.web.bid_order.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-07-02 下午 01:03
 */
public enum BidOrderStat {
    PICKING("撿貨中"), IN_TRANSIT("配送中"), DELIVERED("已送達"), ERROR("錯誤");
    private String stat;

    BidOrderStat(String stat) {
        this.stat = stat;
    }

    public String getStat() {
        return stat;
    }
}
