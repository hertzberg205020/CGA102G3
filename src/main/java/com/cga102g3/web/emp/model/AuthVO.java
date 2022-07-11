package com.cga102g3.web.emp.model;

public class AuthVO implements java.io.Serializable{
	private Integer authID;
	private String authName;
	public Integer getAuthID() {
		return authID;
	}
	public void setAuthID(Integer authID) {
		this.authID = authID;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
}
