package com.cga102g3.web.order.controller; /**
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

@WebServlet(name = "OrderServlet", value = "/OrderServlet.do")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        //=================會員查詢訂單==================

        if("getByMbrID".equals(action)){
//            request.getSession().setAttribute("mbrID",2);
            Integer mbrID = (Integer) request.getSession().getAttribute("mbrID");
            if (mbrID != null ){
                OrderService orderService = new OrderService();
                List<OrderVO> list = orderService.getByMember(Integer.valueOf(mbrID));
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                out.print(gson.toJson(list));
            }
            return;
        }

        //=================會員訂單明細==================

        if ("getDetail".equals(action)) {
            String orderID = request.getParameter("orderID");
            if (orderID != null && orderID.trim().length() != 0){
                OrderItemService svc = new OrderItemService();
                List<Map<String, Object>> list = svc.getByOrderID(Integer.parseInt(orderID));
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                Gson gson = new Gson();
                out.print(gson.toJson(list));
            }
            return;
        }

        //=================會員取消訂單==================
        if ("cancel".equals(action)) {
            String orderID = request.getParameter("orderID");
            if (orderID != null && orderID.trim().length() != 0){
                OrderService svc = new OrderService();
                boolean ans = svc.cancel(Integer.parseInt(orderID));
                response.setContentType("text/html; chardet=UTF-8");
                PrintWriter out = response.getWriter();
                out.print(ans);
            }
            return;
        }


        //=================會員完成訂單==================
        if ("finish".equals(action)) {
            String orderID = request.getParameter("orderID");
            if (orderID != null && orderID.trim().length() != 0){
                OrderService svc = new OrderService();
                boolean ans = svc.finish(Integer.parseInt(orderID));
                response.setContentType("text/html; chardet=UTF-8");
                PrintWriter out = response.getWriter();
                out.print(ans);
            }
            return;
        }
    }
}
