package com.cga102g3.web.prod.controller;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/

import com.cga102g3.web.order.entity.OrderVO;
import com.cga102g3.web.order.service.OrderService;
import com.cga102g3.web.order_Item.entity.OrderItemVO;
import com.cga102g3.web.prod.entity.ProdVO;
import com.cga102g3.web.prod.service.ProdService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.hibernate.Session;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(urlPatterns = {"/ProdServlet.do"})
public class ProdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        //=====================商城首頁====================

        if ("shop".equals(action)) {
            ProdService service = new ProdService();
            List<Map<String, Object>> list = service.getALL();
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            out.print(gson.toJson(list));
            return;
        }

        //=======================商品明細=====================

        if ("getOne_For_Display".equals(action)) {
            String prodID = request.getParameter("prodID");
            if (!(prodID == null)) {
                ProdService service = new ProdService();
                ProdVO prodVO = service.getOne(Integer.parseInt(prodID));
                request.setAttribute("prodID", prodVO);

                RequestDispatcher rd = request.getRequestDispatcher("/front-end/prod/prod_detail.jsp");
                rd.forward(request, response);

            }
            return;

        }

        //=======================添加商品至購物車=====================

        if ("add".equals(action)) {

            HttpSession session = request.getSession();
            Vector<Integer> list = (Vector<Integer>) session.getAttribute("prodList");

            Integer prodID = Integer.valueOf(request.getParameter("prodID"));
            PrintWriter out = response.getWriter();

            if (list == null) {
                list = new Vector<Integer>();
                list.add(prodID);
            } else {
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i) == prodID) {
                        out.print("fail");
                        return;
                    }
                }
                list.add(prodID);
            }
            session.setAttribute("prodList", list);
            out.print("success");
            return;
        }

        //=======================刪除購物車商品=====================

        if ("delete".equals(action)) {

            HttpSession session = request.getSession();
            Vector<Integer> list = (Vector<Integer>) session.getAttribute("prodList");

            Integer prodID = Integer.valueOf(request.getParameter("prodID"));
            list.remove(prodID);
            PrintWriter out = response.getWriter();
            if (list.get(0) == 0) {
                out.print("empty");
            }else out.print("success");
            System.out.println(list.isEmpty());

            return;
        }

        //=======================購物車=====================

        if ("car".equals(action)) {

            HttpSession session = request.getSession();
            Vector<Integer> list = (Vector<Integer>) session.getAttribute("prodList");
            Integer prodID = Integer.valueOf(request.getParameter("prodID"));

            if (!(prodID == null)) {
                if (list == null) {
                    list = new Vector<Integer>();
                    list.add(prodID);
                } else {
                    if (!(list.contains(prodID))) {
                        list.add(prodID);
                    }
                }
            }

            ProdService service = new ProdService();
            ArrayList<ProdVO> prodList = new ArrayList<ProdVO>();
            for (int i : list) {
                if (i != 0)
                    prodList.add(service.getOne(i));
            }
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            out.print(gson.toJson(prodList));
            return;
        }
        //=======================結帳頁面=====================

        if ("checkout".equals(action)) {
            Gson gson = new Gson();
            ProdService service = new ProdService();
            int total = 0;
            String json = request.getParameter("json");

            JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
            JsonArray jsonArray = jsonObject.getAsJsonArray("prodID");
            JsonArray jsonArray1 = jsonObject.getAsJsonArray("quantityarray");
            HttpSession session = request.getSession();
            ArrayList<ProdVO> prodVOList = new ArrayList<>();
            ArrayList<Integer> quantityList = new ArrayList<>();
            for (int i = 0; i < jsonArray.size(); i++) {
                prodVOList.add(service.getOne(jsonArray.get(i).getAsInt()));
                quantityList.add(jsonArray1.get(i).getAsInt());
                int price = service.getOne(jsonArray.get(i).getAsInt()).getPrice();
                int quantity = jsonArray1.get(i).getAsInt();
                total += price * quantity;
            }
            session.setAttribute("prodVOList", prodVOList);
            session.setAttribute("quantityList", quantityList);
            PrintWriter out = response.getWriter();
            out.print(total);
            return;
        }

        //=======================結帳頁面=====================

        if ("order".equals(action)) {

            //錯誤處理
            Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
            request.setAttribute("errorMsgs", errorMsgs);

            String payerName = request.getParameter("payerName");
            String nameReg = "^[(\u4e00-\u9fa5))]{2,4}$";
            if(payerName == null || payerName.trim().length() == 0){
                errorMsgs.put("payerName","付款人姓名 : 請勿空白");
            }else if(!payerName.trim().matches(nameReg)){
                errorMsgs.put("payerName","付款人姓名 : 只能是中文字，且長度必須在2到4之間");
            }
            String payerPhone = request.getParameter("payerPhone");
            String phoneReg = "^09\\d{8}$";
            if(payerPhone == null || payerPhone.trim().length() == 0){
                errorMsgs.put("payerPhone","付款人手機 : 請勿空白");
            }else if (!payerPhone.trim().matches(phoneReg)){
                errorMsgs.put("payerPhone","付款人手機 : 格式不正確");
            }
            String method = request.getParameter("method");
            if (method == null){
                errorMsgs.put("method","請選擇付款方式");
            }
            String receiverName =request.getParameter("receiverName");
            String receiverPhone = request.getParameter("receiverPhone");
            if(receiverName == null || receiverName.trim().length() == 0){
                errorMsgs.put("receiverName","收貨人姓名 : 請勿空白");
            }else if(!receiverName.trim().matches(nameReg)){
                errorMsgs.put("receiverName","收貨人姓名 : 只能是中文字，且長度必須在2到4之間");
            }
            if(receiverPhone == null || receiverPhone.trim().length() == 0){
                errorMsgs.put("receiverPhone","收貨人手機 : 請勿空白");
            }else if (!receiverPhone.trim().matches(phoneReg)){
                errorMsgs.put("receiverPhone","收貨人手機 : 格式不正確");
            }
            String street = request.getParameter("street");
            String streetReg = "^[(\u4e00-\u9fa5)(0-9)]{2,10}$";
            if (street == null || street.trim().length() == 0){
                errorMsgs.put("street","收貨人地址 : 請勿空白");
            }else if (!street.trim().matches(streetReg)){
                errorMsgs.put("street","收貨人地址 : 格式不正確");
            }

            if (!errorMsgs.isEmpty()){
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/front-end/prod/checkout.jsp");
                requestDispatcher.forward(request,response);
                return;
            }

            HttpSession session = request.getSession();
            ArrayList<ProdVO> prodVOList = (ArrayList<ProdVO>) session.getAttribute("prodVOList");
            if (prodVOList != null) {
                ArrayList<Integer> quantityList = (ArrayList<Integer>) session.getAttribute("quantityList");
                if (quantityList != null) {
                    List<OrderItemVO> list = new ArrayList<>();
                    int total = 0;
                    for (int i = 0; i < prodVOList.size(); i++) {
                        OrderItemVO orderItemVO = new OrderItemVO();
                        ProdVO prodVO = prodVOList.get(i);
                        int quantity = quantityList.get(i);
                        orderItemVO.setProdID(prodVO.getProdID());
                        orderItemVO.setAmount(quantity);
                        orderItemVO.setSalePrice(prodVO.getPrice());
                        total += (prodVO.getPrice()) * quantity;
                        list.add(orderItemVO);
                    }
                    OrderVO orderVO = new OrderVO();
                    orderVO.setMbrID(2);
                    orderVO.setTotalPrice(total);
                    orderVO.setOrderStatus(0);
                    orderVO.setShipStatus(0);

                    if("信用卡".equals(method)){
                        orderVO.setPayMethod(0);
                    }else if("TibaNi錢包".equals(method)){
                        orderVO.setPayMethod(1);
                    }else {
                        orderVO.setPayMethod(2);
                    }
                    if(!("貨到付款".equals(method))) orderVO.setPayStatus(0);
                    else orderVO.setPayStatus(1);

                    OrderService service = new OrderService();
                    service.addWithOrderItem(orderVO,list);
                    session.removeAttribute("prodList");
                    session.removeAttribute("prodVOList");
                    session.removeAttribute("quantityList");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/front-end/prod/order.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
            return;
        }

        //訂單完成
        if ("finish".equals(action)) {
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            ProdService service = new ProdService();


            String json = request.getParameter("json");
            JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
            JsonArray jsonArray = jsonObject.getAsJsonArray("prodID");
            JsonArray jsonArray1 = jsonObject.getAsJsonArray("quantityarray");

            List<Map<String, Object>> list = new ArrayList<>();
            for (int i = 0; i < jsonArray.size(); i++) {
                Map<String, Object> map = new HashMap<>();
                map.put("prodVO", service.getOne(jsonArray.get(i).getAsInt()));
                map.put("quantity", jsonArray1.get(i).getAsInt());
                list.add(map);
            }
            out.print(gson.toJson(list));
            return;
        }
    }
}

