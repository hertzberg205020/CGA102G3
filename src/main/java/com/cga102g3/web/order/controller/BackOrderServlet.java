package com.cga102g3.web.order.controller;

import java.io.*;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order.service.OrderService;
import com.cga102g3.web.order_Item.service.OrderItemService;

@MultipartConfig(fileSizeThreshold = 1, maxFileSize = 15*1024*1024, maxRequestSize = 50*1024*1024)
@WebServlet("/back-end/order/order.do")

public class BackOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");


	        if ("getOne_For_Display".equals(action)) {

					/***************************1.接收請求參數****************************************/
					Integer orderID = Integer.valueOf(req.getParameter("orderID"));
					/***************************2.開始查詢資料****************************************/
					OrderService orderSvc = new OrderService();
					OrderVO orderVO = orderSvc.getOne(orderID);
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					String param =
								"?a=a"+
							   "&orderID="     +orderVO.getOrderID()+
						       "&mbrID="       +orderVO.getMbrID()+
						       "&order_date="  +orderVO.getOrderDate()+
						       "&total_price=" +orderVO.getTotalPrice()+
						       "&order_status="+orderVO.getOrderStatus()+
						       "&ship_status=" +orderVO.getShipStatus()+
						       "&pay_status="  +orderVO.getPayStatus()+
						       "&pay_method="  +orderVO.getPayMethod()+
						       "&oiVO_prodID=" +orderVO.getOrderItemVO().getProdID()+
						       "&oiVO_saleprice="+orderVO.getOrderItemVO().getSalePrice()+
						       "&oiVO_amount=" +orderVO.getOrderItemVO().getAmount();
					String url = "/back-end/order/back_order_listOne.jsp"+param;
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 back_order_listOne.jsp
					successView.forward(req, res);
			}

		}
	}