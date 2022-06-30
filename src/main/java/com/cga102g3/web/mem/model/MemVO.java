package com.cga102g3.web.mem.model;
import java.sql.Date;

public class MemVO implements java.io.Serializable{
	private Integer mbrID;
	private String mbrAccount;
	private String mbrPassword;
	private Integer mbrStatus;
	private String mbrName;
	private Integer mbrGender;
	private String mbrMobile;
	private String mbrAddr;
	private String mbrEmail;
	private Date mbrBirth;
	private Date mbrJointime;
	private Date mbrVerifTime;
	private Integer tcoinBal;
	
	public MemVO() {
		
	}
	
	public MemVO(Integer mbrID, String mbrAccount, String mbrPassword, Integer mbrStatus, String mbrName,
			Integer mbrGender, String mbrMobile, String mbrAddr, String mbrEmail, Date mbrBirth, Date mbrJointime,
			Date mbrVerifTime, Integer tcoinBal) {
		super();
		this.mbrID = mbrID;
		this.mbrAccount = mbrAccount;
		this.mbrPassword = mbrPassword;
		this.mbrStatus = mbrStatus;
		this.mbrName = mbrName;
		this.mbrGender = mbrGender;
		this.mbrMobile = mbrMobile;
		this.mbrAddr = mbrAddr;
		this.mbrEmail = mbrEmail;
		this.mbrBirth = mbrBirth;
		this.mbrJointime = mbrJointime;
		this.mbrVerifTime = mbrVerifTime;
		this.tcoinBal = tcoinBal;
	}
	
	public Integer getMbrID() {
		return mbrID;
	}
	public void setMbrID(Integer mbrID) {
		this.mbrID = mbrID;
	}
	public  String getMbrAccount() {
		return mbrAccount;
	}
	public void setMbrAccount(String mbrAccount) {
		this.mbrAccount = mbrAccount;
	}
	public String getMbrPassword() {
		return mbrPassword;
	}
	public void setMbrPassword(String mbrPassword) {
		this.mbrPassword = mbrPassword;
	}
	public Integer getMbrStatus() {
		return mbrStatus;
	}
	public void setMbrStatus(Integer mbrStatus) {
		this.mbrStatus = mbrStatus;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public Integer getMbrGender() {
		return mbrGender;
	}
	public void setMbrGender(Integer mbrGender) {
		this.mbrGender = mbrGender;
	}
	public String getMbrMobile() {
		return mbrMobile;
	}
	public void setMbrMobile(String mbrMobile) {
		this.mbrMobile = mbrMobile;
	}
	public String getMbrAddr() {
		return mbrAddr;
	}
	public void setMbrAddr(String mbrAddr) {
		this.mbrAddr = mbrAddr;
	}
	public String getMbrEmail() {
		return mbrEmail;
	}
	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}
	public Date getMbrBirth() {
		return mbrBirth;
	}
	public void setMbrBirth(Date mbrBirth) {
		this.mbrBirth = mbrBirth;
	}
	public Date getMbrJointime() {
		return mbrJointime;
	}
	public void setMbrJointime(Date mbrJointime) {
		this.mbrJointime = mbrJointime;
	}
	public Date getMbrVerifTime() {
		return mbrVerifTime;
	}
	public void setMbrVerifTime(Date mbrVerifTime) {
		this.mbrVerifTime = mbrVerifTime;
	}
	public Integer getTcoinBal() {
		return tcoinBal;
	}
	public void setTcoinBal(Integer tcoinBal) {
		this.tcoinBal = tcoinBal;
	}
	
	
}
