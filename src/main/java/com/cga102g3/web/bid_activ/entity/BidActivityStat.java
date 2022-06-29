package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-26 下午 10:43
 */
public enum BidActivityStat {
    OVERRIDE("OVERRIDE"), ENDGAME("ENDGAME"), CONTINUED("CONTINUED"), FAIL("FAIL");
    private final String stat;

    BidActivityStat(String stat) {
        this.stat = stat;
    }

    public String getStat() {
        return stat;
    }
}
