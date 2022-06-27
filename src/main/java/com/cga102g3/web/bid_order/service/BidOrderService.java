package com.cga102g3.web.bid_order.service;

import java.sql.Timestamp;
import java.util.List;

import com.cga102g3.web.bid_order.dao.BidOrderDao;
import com.cga102g3.web.bid_order.dao.impl.BidOrderDaoImpl;
import com.cga102g3.web.bid_order.entity.BidOrder;

public class BidOrderService {
	private BidOrderDao dao;
	
	public BidOrderService() {
		dao = new BidOrderDaoImpl();
	}
	
	public BidOrder showOne(Integer bidOrderID) {
		return dao.selectByPrimaryKey(bidOrderID);
	}
	
	public List<BidOrder> showDate(Timestamp startDate, Timestamp endDate) {
		return dao.selectByOrderDate(startDate, endDate);
	}
	
	public List<BidOrder> showAll() {
		return dao.selectAll();
	}
	
	public List<BidOrder> showNewOrder() {
		return dao.selectNewOrder();
	}
	
	public List<BidOrder> showShipStat(Integer bidShipStat) {
		return dao.selectShipStat(bidShipStat);
	}
}
