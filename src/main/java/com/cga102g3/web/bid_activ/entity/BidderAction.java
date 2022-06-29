package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-26 下午 04:36
 */
public class BidderAction {
    private String action;
    private Bidder bidder;

    public BidderAction() {
    }

    public BidderAction(String action, Bidder bidder) {
        this.action = action;
        this.bidder = bidder;
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
}
