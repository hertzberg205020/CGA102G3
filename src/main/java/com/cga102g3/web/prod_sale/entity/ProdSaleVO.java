package com.cga102g3.web.prod_sale.entity;

public class ProdSaleVO implements java.io.Serializable{
	
	private Integer saleID;
	private Integer prodID;
	private Integer salePrice;
	
	public Integer getSaleID() {
		return saleID;
	}
	public void setSaleID(Integer saleID) {
		this.saleID = saleID;
	}
	public Integer getProdID() {
		return prodID;
	}
	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}
	public Integer getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}

}
