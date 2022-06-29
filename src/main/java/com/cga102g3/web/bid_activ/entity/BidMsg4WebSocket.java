package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-27 上午 10:18
 */
public class BidMsg4WebSocket {
    private String action;
    private Bidder bidder;
    private Integer traceBidID;

    public BidMsg4WebSocket() {
    }

    public BidMsg4WebSocket(String action, Bidder bidder, Integer traceBidID) {
        this.action = action;
        this.bidder = bidder;
        this.traceBidID = traceBidID;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Bidder getBidder() {
        return bidder;
    }

    public void setBidder(Bidder bidder) {
        this.bidder = bidder;
    }

    public Integer getTraceBidID() {
        return traceBidID;
    }

    public void setTraceBidID(Integer traceBidID) {
        this.traceBidID = traceBidID;
    }

    @Override
    public String toString() {
        return "BidMsg4WebSocket{" +
                "action='" + action + '\'' +
                ", bidder=" + bidder +
                ", traceBidID=" + traceBidID +
                '}';
    }
}
