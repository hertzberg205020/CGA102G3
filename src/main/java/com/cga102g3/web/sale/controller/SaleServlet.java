package com.cga102g3.web.sale.controller; /**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/28
 **/

import com.cga102g3.web.category.entity.Category;
import com.cga102g3.web.category.service.impl.CategoryServiceImpl;
import com.cga102g3.web.prod_sale.entity.ProdSaleVO;
import com.cga102g3.web.prod_sale.service.ProdSaleService;
import com.cga102g3.web.sale.entity.SaleVO;
import com.cga102g3.web.sale.service.SaleService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SaleServlet", value = "/SaleServlet.do")
public class SaleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        //=====================查詢單一saleID========================
        if ("getOne".equals(action)){
            String saleID = request.getParameter("saleID");
            if (saleID != null || saleID.trim().length() != 0){
                SaleService svc = new SaleService();
                SaleVO saleVO = svc.findByPrimaryKey(Integer.valueOf(saleID));
                Gson gson = new Gson();
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print(gson.toJson(saleVO));
            }
            return;
        }
        //=====================查詢全部========================
        if("getAll".equals(action)){
            SaleService svc = new SaleService();
            List<SaleVO> list = svc.getAll();
            Gson gson = new Gson();
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(list));
            return;
        }
        //=====================查詢ProdSaleVO明細===============
        if ("getDetail".equals(action)) {
            String saleID = request.getParameter("saleID");
            if (saleID != null || saleID.trim().length() != 0){
                ProdSaleService svc = new ProdSaleService();
                List<Map<String, Object>>  list = svc.getBySaleID(Integer.valueOf(saleID));
                Gson gson = new Gson();
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.print(gson.toJson(list));
            }
            return;
        }
        //=====================抓取Category====================
        if (("getCategory").equals(action)) {
            CategoryServiceImpl svc = new CategoryServiceImpl();
            Gson gson = new Gson();
            List<Category> list = svc.getAll();
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(list));
            return;
        }

        //=====================新增====================
        if ("add".equals(action)) {
            boolean ans ;
            String start = request.getParameter("saleStart");
            String end = request.getParameter("saleEnd");
            Gson gson = new Gson();
            if (start != null && end != null) {
                Date saleStart = Date.valueOf(start);
                Date saleEnd = Date.valueOf(end);
                String category = request.getParameter("category");
                double discount = Double.parseDouble(request.getParameter("discount"));
                SaleService svc = new SaleService();
                ans = svc.insertWithProdSale(saleStart,saleEnd,category,discount * 0.1);
                PrintWriter out = response.getWriter();
                out.print(ans);
            }
            return;
        }
        //=====================判斷起始時間====================
            if ("judge1".equals(action)) {
                String saleStart = request.getParameter("saleStart");
                if(saleStart != null && saleStart.trim().length() != 0){
                    Date start = Date.valueOf(saleStart);
                    SaleService svc = new SaleService();
                    boolean ans = svc.judge1(start);
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.print(ans);
                }
                return;
            }

        //=====================判斷時間區段====================
            if ("judge2".equals(action)) {
                String saleStart = request.getParameter("saleStart");
                String saleEnd = request.getParameter("saleEnd");
                if(saleStart != null && saleStart.trim().length() != 0){
                    if (saleEnd != null && saleEnd.trim().length() != 0){
                        Date start = Date.valueOf(saleStart);
                        Date end = Date.valueOf(saleEnd);
                        SaleService svc = new SaleService();
                        boolean ans = svc.judge2(start,end);
                        response.setContentType("text/html;charset=UTF-8");
                        PrintWriter out = response.getWriter();
                        out.print(ans);
                    }
                }
                return;
            }

    }
}
