package com.cga102g3.web.order.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/24
 **/
public class OrderVO implements Serializable {
    private Integer orderID;
    private Integer mbrID;
    private Timestamp orderDate;
    private Integer totalPrice;
    private Integer orderStatus;
    private Integer shipStatus;
    private Integer payStatus;
    private Integer payMethod;

    public Integer getOrderID() {
        return orderID;
    }
    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }
    public Integer getMbrID() {
        return mbrID;
    }
    public void setMbrID(Integer mbrID) {
        this.mbrID = mbrID;
    }
    public Timestamp getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Timestamp date) {
        this.orderDate = date;
    }
    public Integer getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }
    public Integer getOrderStatus() {
        return orderStatus;
    }
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }
    public Integer getShipStatus() {
        return shipStatus;
    }
    public void setShipStatus(Integer shipStatus) {
        this.shipStatus = shipStatus;
    }
    public Integer getPayStatus() {
        return payStatus;
    }
    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }
    public Integer getPayMethod() {
        return payMethod;
    }
    public void setPayMethod(Integer payMethod) {
        this.payMethod = payMethod;
    }
}
