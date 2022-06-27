package com.cga102g3.web.bid_order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cga102g3.web.bid_order.entity.BidOrder;
import com.cga102g3.web.bid_order.service.BidOrderService;

@WebServlet("/back-end/bid_order/bidOrder.do")
public class BidOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
/************************ Search by Primary Key *********************************/
		if ("showOne".equals(action)) {
			/** Error Messages List **/
			List<String> errMsgsOrd = new LinkedList<>();
			req.setAttribute("errMsgsOrd", errMsgsOrd);
			/* Check Bid Order ID */
			String str = req.getParameter("bidOrderID");
			if (str == null || str.trim().length() == 0) {
				errMsgsOrd.add("請輸入商品訂單編號");
			}
			
			if (!errMsgsOrd.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}

			Integer bidOrderID = null;
			try {
				bidOrderID = Integer.valueOf(str);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errMsgsOrd.add("訂單編號格式不正確");
			}
			
			if (!errMsgsOrd.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}
			
			BidOrderService bs = new BidOrderService();
			BidOrder bidOrder = bs.showOne(bidOrderID);
			if (bidOrder == null) {
				errMsgsOrd.add("查無資料");
			}
			
			if (!errMsgsOrd.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}
			
			req.setAttribute("bidOrder", bidOrder);
			RequestDispatcher success = req.getRequestDispatcher("/back-end/bid_order/bid_order_show_page.jsp");
			success.forward(req, res);
			}
	
/************************ Search by Order Date **************************************************/
		if ("showRange".equals(action)) {
			List<String> errMsgsDate = new LinkedList<>();
			req.setAttribute("errMsgsDate", errMsgsDate);
			
			String startStr = req.getParameter("start");
			if (startStr == null || startStr.trim().length() == 0) {
				errMsgsDate.add("請輸入查詢日期");
			}
			
			if (!errMsgsDate.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}
			
			String endStr = req.getParameter("end");
			if (endStr == null || endStr.trim().length() == 0) {
				errMsgsDate.add("請輸入查詢日期");
			}
			
			if (!errMsgsDate.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}


			Timestamp startDate = Timestamp.valueOf(startStr);
			Timestamp endDate = Timestamp.valueOf(endStr);
			BidOrderService bs = new BidOrderService();
			List<BidOrder> bidOrder = bs.showDate(startDate, endDate);
//			System.out.println(bidOrder);
			if (bidOrder.size() == 0) {
				errMsgsDate.add("查無資料");
			}
			if (!errMsgsDate.isEmpty()) {
				RequestDispatcher fail = req.getRequestDispatcher("/back-end/bid_order/bid_order_page.jsp");
				fail.forward(req, res);
				return;
			}
			
			
			req.setAttribute("startDate", startDate);
			req.setAttribute("endDate", endDate);
			RequestDispatcher success = req.getRequestDispatcher("/back-end/bid_order/bid_order_show_date.jsp");
			success.forward(req, res);
			}
		
/************************ Show  **************************************************/
//		if("showAll".equals(action)) {
//			BidOrderService bs = new BidOrderService();
//			List<BidOrder> list = bs.showAll();
//			
//			System.out.println(list);
//			req.setAttribute("list", list);
//			RequestDispatcher success = req.getRequestDispatcher("/back-end/bid_order/bid_order_show_all.jsp");
//			success.forward(req, res);
//
//		}
		
	}
}
