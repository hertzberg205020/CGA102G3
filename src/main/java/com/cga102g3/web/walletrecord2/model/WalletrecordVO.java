package com.cga102g3.web.walletrecord2.model;
import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;

public class WalletrecordVO implements java.io.Serializable{
	private Integer wallet_rec_no;
	private Integer mbr_ID;
	private Integer note;
	private Integer amount;
	private Timestamp rec_time;
	public Integer getWallet_rec_no() {
		return wallet_rec_no;
	}
	public void setWallet_rec_no(Integer wallet_rec_no) {
		this.wallet_rec_no = wallet_rec_no;
	}
	public Integer getMbr_ID() {
		return mbr_ID;
	}
	public void setMbr_ID(Integer mbr_ID) {
		this.mbr_ID = mbr_ID;
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
	public Timestamp getRec_time() {
		return rec_time;
	}
	public void setRec_time(Timestamp rec_time) {
		this.rec_time = rec_time;
	}
	

	
}
