package com.cga102g3.web.order_Item.controller; /**
 * @description: TODO
 * @author: Luke
 * @date: 2022/7/4
 **/

import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order.service.OrderService;
import com.cga102g3.web.order_Item.service.OrderItemService;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderItemServlet", value = "/OrderItemServlet.do")
public class OrderItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        //=================會員查詢訂單==================

        if("getDetail".equals(action)){
            String orderID = request.getParameter("orderID");
            if (orderID != null && orderID.trim().length() != 0){
                OrderItemService svc = new OrderItemService();
                List<Map<String, Object>> list = svc.getByOrderID(Integer.valueOf(orderID));
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                out.print(gson.toJson(list));
            }
            return;
        }
    }
}
