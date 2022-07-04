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
import com.cga102g3.web.prod.model.*;
import com.google.gson.Gson;

@MultipartConfig(fileSizeThreshold = 1, maxFileSize = 15 * 1024 * 1024, maxRequestSize = 50 * 1024 * 1024)
@WebServlet("/back-end/order/order.do")

public class BackOrderServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");


//	        if ("insert".equals(action)) {
//				
//				Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
//				req.setAttribute("errorMsgs", errorMsgs);
//
//					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/				
//					Integer bookID = null;
//					try{
//						bookID = Integer.valueOf(req.getParameter("bookID"));
//					}catch(NumberFormatException e) {
//						errorMsgs.put("bookID","編號請勿空白");
//					}
//					
//					Integer price = null;
//					try{
//						price = Integer.valueOf(req.getParameter("price"));
//					}catch(NumberFormatException e) {
//						errorMsgs.put("price","定價請勿空白");
//					}
//					
//					Integer status = Integer.valueOf(req.getParameter("status"));
//					
//					if (!errorMsgs.isEmpty()) {
//						RequestDispatcher failureView = req.
//								getRequestDispatcher("/back-end/prod/back_prod_add.jsp");
//						failureView.forward(req, res);
//						return;
//					}
//					/***************************2.開始新增資料***************************************/
//					ProdService prodSvc = new ProdService();
//					prodSvc.addProd(bookID, price, status);
//					/***************************3.新增完成,準備轉交(Send the Success view)***********/
//					String url ="/back-end/prod/back_prod_listAll.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交back_prod_lisAll.jsp
//					successView.forward(req, res);
//			}


        if ("getOne_For_Display".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();
            /***************************1.接收請求參數****************************************/
            Integer orderID = Integer.valueOf(request.getParameter("orderID"));

            /***************************2.開始查詢資料****************************************/
            OrderService orderSvc = new OrderService();
            OrderVO orderVO = orderSvc.getOne(orderID);

            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            String param =
                    "?orderID=" + orderVO.getOrderID() +
                            "&mbrID=" + orderVO.getMbrID() +
                            "&order_date=" + orderVO.getOrderDate() +
                            "&total_price=" + orderVO.getTotalPrice() +
                            "&order_status=" + orderVO.getOrderStatus() +
                            "&ship_status=" + orderVO.getShipStatus() +
                            "&pay_status=" + orderVO.getPayStatus() +
                            "&pay_method=" + orderVO.getPayMethod();
            String url = "/back-end/order/back_order_listOne.jsp" + param;
            RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 back_order_listOne.jsp
            successView.forward(request, response);
        }

        //=================會員查詢訂單==================

        if ("getByMbrID".equals(action)) {
            request.getSession().setAttribute("mbrID", 2);
            Integer mbrID = (Integer) request.getSession().getAttribute("mbrID");
            System.out.println(mbrID);
            if (mbrID != null) {
                OrderService orderService = new OrderService();
                List<OrderVO> list = orderService.getByMember(Integer.valueOf(mbrID));
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                out.print(gson.toJson(list));
                System.out.println(list);
            }
            return;
        }

    }
}

