package com.cga102g3.web.bid_activ.entity;

import java.util.Objects;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 04:42
 */
public class BidActiv {
    // bidActiv:bidID, ex: bidActiv:1
    private String bidActivID;
    private Integer bidID;
    // 存redis中對應的zset的key值, ex: bidActiv:1:rec
    private String zsetKey4Recs;
    private long bidStart;
    private long bidEnd;
    private Integer bidDirectPrice;

    public BidActiv() {
    }

    public BidActiv(String bidActivID, Integer bidID, String zsetKey4Recs, long bidStart, long bidEnd, Integer bidDirectPrice) {
        this.bidActivID = bidActivID;
        this.bidID = bidID;
        this.zsetKey4Recs = zsetKey4Recs;
        this.bidStart = bidStart;
        this.bidEnd = bidEnd;
        this.bidDirectPrice = bidDirectPrice;
    }

    public String getBidActivID() {
        return bidActivID;
    }

    public void setBidActivID(String bidActivID) {
        this.bidActivID = bidActivID;
    }

    public Integer getBidID() {
        return bidID;
    }

    public void setBidID(Integer bidID) {
        this.bidID = bidID;
    }

    public String getZsetKey4Recs() {
        return zsetKey4Recs;
    }

    public void setZsetKey4Recs(String zsetKey4Recs) {
        this.zsetKey4Recs = zsetKey4Recs;
    }

    public long getBidStart() {
        return bidStart;
    }

    public void setBidStart(long bidStart) {
        this.bidStart = bidStart;
    }

    public long getBidEnd() {
        return bidEnd;
    }

    public void setBidEnd(long bidEnd) {
        this.bidEnd = bidEnd;
    }

    public Integer getBidDirectPrice() {
        return bidDirectPrice;
    }

    public void setBidDirectPrice(Integer bidDirectPrice) {
        this.bidDirectPrice = bidDirectPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BidActiv bidActiv = (BidActiv) o;
        return bidActivID.equals(bidActiv.bidActivID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bidActivID);
    }

    @Override
    public String toString() {
        return "BidActiv{" +
                "bidActivID='" + bidActivID + '\'' +
                ", bidID=" + bidID +
                ", zsetKey4Recs='" + zsetKey4Recs + '\'' +
                ", bidStart=" + bidStart +
                ", bidEnd=" + bidEnd +
                ", bidDirectPrice=" + bidDirectPrice +
                '}';
    }
}
