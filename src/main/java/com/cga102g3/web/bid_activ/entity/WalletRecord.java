package com.cga102g3.web.bid_activ.entity;

import java.sql.Timestamp;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-25 下午 02:34
 */
public class WalletRecord {
    private Integer walletRecNo;
    private Integer mbrID;
    private Integer note;
    private Integer amount;
    private Timestamp recTime;

    public WalletRecord() {
    }

    public WalletRecord(Integer mbrID, Integer note, Integer amount) {
        this.mbrID = mbrID;
        this.note = note;
        this.amount = amount;
    }

    public WalletRecord(Integer walletRecNo, Integer mbrID, Integer note, Integer amount, Timestamp recTime) {
        this.walletRecNo = walletRecNo;
        this.mbrID = mbrID;
        this.note = note;
        this.amount = amount;
        this.recTime = recTime;
    }

    public Integer getWalletRecNo() {
        return walletRecNo;
    }

    public void setWalletRecNo(Integer walletRecNo) {
        this.walletRecNo = walletRecNo;
    }

    public Integer getMbrID() {
        return mbrID;
    }

    public void setMbrID(Integer mbrID) {
        this.mbrID = mbrID;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Timestamp getRecTime() {
        return recTime;
    }

    public void setRecTime(Timestamp recTime) {
        this.recTime = recTime;
    }

    @Override
    public String toString() {
        return "WalletRecord{" +
                "walletRecNo=" + walletRecNo +
                ", mbrID=" + mbrID +
                ", note=" + note +
                ", amount=" + amount +
                ", recTime=" + recTime +
                '}';
    }
}
