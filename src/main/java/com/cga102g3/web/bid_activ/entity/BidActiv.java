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
    private Integer bookID;
    private Integer startPrice;
    // 存redis中對應的zset的key值, ex: bidActiv:1:rec
    private String zsetKey4Recs;
    private long bidStart;
    private long bidEnd;
    private Integer bidDirectPrice;

    public BidActiv() {
    }

    public BidActiv(String bidActivID, Integer bidID, Integer bookID, Integer startPrice, String zsetKey4Recs, long bidStart, long bidEnd, Integer bidDirectPrice) {
        this.bidActivID = bidActivID;
        this.bidID = bidID;
        this.bookID = bookID;
        this.startPrice = startPrice;
        this.zsetKey4Recs = zsetKey4Recs;
        this.bidStart = bidStart;
        this.bidEnd = bidEnd;
        this.bidDirectPrice = bidDirectPrice;
    }

    private BidActiv(BidActiv.Builder builder) {
        bidActivID = builder.bidActivID;
        bidID = builder.bidID;
        bookID = builder.bookID;
        startPrice = builder.startPrice;
        zsetKey4Recs = builder.zsetKey4Recs;
        bidStart = builder.bidStart;
        bidEnd = builder.bidEnd;
        bidDirectPrice = builder.bidDirectPrice;
    }

    public static class Builder {
        private String bidActivID = "";
        private Integer bidID = 0;
        private Integer bookID = 0;
        private Integer startPrice = 0;
        private String zsetKey4Recs = "";
        private long bidStart = 0L;
        private long bidEnd = 0L;
        private Integer bidDirectPrice = 0;



        public Builder setBidActivID(String bidActivID) {
            this.bidActivID = bidActivID;
            return this;
        }

        public Builder setBidID(Integer bidID) {
            this.bidID = bidID;
            return this;
        }

        public Builder setBookID(Integer bookID) {
            this.bookID = bookID;
            return this;
        }

        public Builder setStartPrice(Integer startPrice) {
            this.startPrice = startPrice;
            return this;
        }

        public Builder setZsetKey4Recs(String zsetKey4Recs) {
            this.zsetKey4Recs = zsetKey4Recs;
            return this;
        }

        public Builder setBidStart(long bidStart) {
            this.bidStart = bidStart;
            return this;
        }

        public Builder setBidEnd(long bidEnd) {
            this.bidEnd = bidEnd;
            return this;
        }

        public Builder setBidDirectPrice(Integer bidDirectPrice) {
            this.bidDirectPrice = bidDirectPrice;
            return this;
        }

        public BidActiv build() {
            return new BidActiv(this);
        }
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

    public Integer getBookID() {
        return bookID;
    }

    public void setBookID(Integer bookID) {
        this.bookID = bookID;
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

    public Integer getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Integer startPrice) {
        this.startPrice = startPrice;
    }

    @Override
    public String toString() {
        return "BidActiv{" +
                "bidActivID='" + bidActivID + '\'' +
                ", bidID=" + bidID +
                ", bookID=" + bookID +
                ", startPrice=" + startPrice +
                ", zsetKey4Recs='" + zsetKey4Recs + '\'' +
                ", bidStart=" + bidStart +
                ", bidEnd=" + bidEnd +
                ", bidDirectPrice=" + bidDirectPrice +
                '}';
    }
}
