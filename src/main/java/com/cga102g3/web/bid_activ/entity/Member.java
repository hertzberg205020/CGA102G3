package com.cga102g3.web.bid_activ.entity;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 02:04
 */
public class Member {
    Integer mbrID;
    Integer tCoinBal;

    public Member() {
    }

    public Member(Integer mbrID, Integer tCoinBal) {
        this.mbrID = mbrID;
        this.tCoinBal = tCoinBal;
    }

    public Integer getMbrID() {
        return mbrID;
    }

    public void setMbrID(Integer mbrID) {
        this.mbrID = mbrID;
    }

    public Integer gettCoinBal() {
        return tCoinBal;
    }

    public void settCoinBal(Integer tCoinBal) {
        this.tCoinBal = tCoinBal;
    }

    @Override
    public String toString() {
        return "Member{" +
                "mbrID=" + mbrID +
                ", tCoinBal=" + tCoinBal +
                '}';
    }
}
