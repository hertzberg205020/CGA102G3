package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-26 下午 11:36
 */
public enum BidErrStat {
    NoBidder("未傳遞出價資訊"), UnAffordable("錢包餘額不足"), OverDirectPrice("高於直購價"), LowerStartPrice("低於底價"), OverrideYourself("重複出價"),
    Success("成功"), NotWin("出價未高於當前價格");

    private final String stat;

    BidErrStat(String stat) {
        this.stat = stat;
    }

    public String getStat() {
        return stat;
    }
}
