package com.cga102g3.web.bid_order.controller;
/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-07-02 上午 10:50
 */

import com.cga102g3.core.controller.BaseGetAPIServlet;
import com.cga102g3.core.pojo.ErrMsg;
import com.cga102g3.web.bid_order.service.BidOrderInfoService;
import com.cga102g3.web.bid_order.service.impl.BidOrderInfoServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

import static com.cga102g3.core.util.CommonUtil.writePojo2Json;

@WebServlet(name = "BidOrderGetApiServlet", urlPatterns = {"/bidOrder/api/*"})
public class BidOrderGetApiServlet extends BaseGetAPIServlet {
    private final BidOrderInfoService bidOrderInfoService = new BidOrderInfoServiceImpl();

    /**
     * 路由: /bidOrder/api/getBidOrderInfo?mbrID={int}
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getBidOrderInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer mbrID = null;
        mbrID = (Integer) session.getAttribute("mbrID");
        if (mbrID == null) {
            try {
                mbrID = Integer.parseInt(request.getParameter("mbrID")) ;
            } catch (Exception e) {
                e.printStackTrace();
                ErrMsg errMsg = new ErrMsg();
                errMsg.setMsg("未傳輸入mbrID參數");
                writePojo2Json(response, errMsg);
                return;
            }
        }

        Map<String, Object> res = bidOrderInfoService.getBidOrderInfo(mbrID);
        writePojo2Json(response, res);
    }


    /**
     * 路由: /bidOrder/api/updateStat2Delivered?bidOrderID={int}
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void updateStat2Delivered(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Integer bidOrderID = null;
        try {
            bidOrderID = Integer.parseInt(request.getParameter("bidOrderID")) ;
        } catch (Exception e) {
            e.printStackTrace();
            ErrMsg errMsg = new ErrMsg();
            errMsg.setMsg("未傳輸入mbrID參數");
            writePojo2Json(response, errMsg);
            return;
        }
        writePojo2Json(response, bidOrderInfoService.updateStat2Delivered(bidOrderID));
    }

}
