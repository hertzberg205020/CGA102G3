package com.cga102g3.web.sale.entity;

import java.sql.Date;

public class SaleVO implements java.io.Serializable{
	private Integer saleID;
	private Date saleStart;
	private Date saleEnd;
	
	public Integer getSaleID() {
		return saleID;
	}
	public void setSaleID(Integer saleID) {
		this.saleID = saleID;
	}
	public Date getSaleStart() {
		return saleStart;
	}
	public void setSaleStart(Date saleStart) {
		this.saleStart = saleStart;
	}
	public Date getSaleEnd() {
		return saleEnd;
	}
	public void setSaleEnd(Date saleEnd) {
		this.saleEnd = saleEnd;
	}
	
}
