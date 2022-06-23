package com.cga102g3.web.bid_record.entity;

import java.sql.Timestamp;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 10:15
 */
public class BidRecord {
    private Integer bidRecID;
    private Integer bidID;
    private Integer mbrID;  // 出價會員編號
    private Integer bidAmount;
    private Timestamp bidTime;

    public Integer getBidRecID() {
        return bidRecID;
    }

    public void setBidRecID(Integer bidRecID) {
        this.bidRecID = bidRecID;
    }

    public Integer getBidID() {
        return bidID;
    }

    public void setBidID(Integer bidID) {
        this.bidID = bidID;
    }

    public Integer getMbrID() {
        return mbrID;
    }

    public void setMbrID(Integer mbrID) {
        this.mbrID = mbrID;
    }

    public Integer getBidAmount() {
        return bidAmount;
    }

    public void setBidAmount(Integer bidAmount) {
        this.bidAmount = bidAmount;
    }

    public Timestamp getBidTime() {
        return bidTime;
    }

    public void setBidTime(Timestamp bidTime) {
        this.bidTime = bidTime;
    }

    @Override
    public String toString() {
        return "BidRecord{" +
                "bidRecID=" + bidRecID +
                ", bidID=" + bidID +
                ", mbrID=" + mbrID +
                ", bidAmount=" + bidAmount +
                ", bidTime=" + bidTime +
                '}';
    }
}
