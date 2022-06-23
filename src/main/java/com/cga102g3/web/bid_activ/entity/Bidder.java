package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 下午 05:00
 */
public class Bidder {
    private Integer MbrID;
    private Integer price;

    public Bidder() {
    }

    public Bidder(Integer mbrID, Integer price) {
        MbrID = mbrID;
        this.price = price;
    }

    public Integer getMbrID() {
        return MbrID;
    }

    public void setMbrID(Integer mbrID) {
        MbrID = mbrID;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Bidder{" +
                "MbrID=" + MbrID +
                ", price=" + price +
                '}';
    }
}
