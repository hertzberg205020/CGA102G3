package com.cga102g3.web.bid_activ.controller;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-27 下午 09:14
 */
import com.cga102g3.core.controller.GetBaseServlet;
import com.cga102g3.core.pojo.ErrMsg;
import com.cga102g3.web.bid_activ.entity.BidActiv;
import com.cga102g3.web.bid_activ.service.BidGameService;
import com.cga102g3.web.bid_activ.service.impl.BidGameServiceImpl;
import com.cga102g3.web.book.entity.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

import static com.cga102g3.core.util.CommonUtil.writePojo2Json;

@WebServlet(name = "BidGameServlet", urlPatterns = {"/bid/participate/*"})
public class BidGameServlet extends GetBaseServlet {
    private final BidGameService bidGameService = new BidGameServiceImpl();
    /**
     * /bid/participate/getOneBid?bidID={int}
     * 依據競拍商品編號返回要查找的競拍商品
     * 若查找不到找定書競拍商品id則跳轉到競拍查詢總表頁面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getOneBid(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 得知競拍商品 獲取相關圖書資訊
        response.setCharacterEncoding("utf-8");
        Integer bidID = null;
        try {
            bidID = Integer.parseInt(request.getParameter("bidID"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            ErrMsg errMsg = new ErrMsg();
            errMsg.setMsg("bidID參數格數錯誤");
            writePojo2Json(response, errMsg);
            return;
        }

        Map<String, Object> bidInfo = bidGameService.getBidInfo(bidID);
        if (bidInfo == null || bidInfo.isEmpty()) {
            ErrMsg errMsg = new ErrMsg();
            errMsg.setMsg("無效的bidID");

            writePojo2Json(response, errMsg);
            return;
        }
        Book book = (Book) bidInfo.get("book");
        request.setAttribute("book", book);
        BidActiv bidActivity = (BidActiv) bidInfo.get("bidActivity");
        request.setAttribute("bidActivity", bidActivity);
        request.getRequestDispatcher("/front-end/bid/bid_prod_detail.jsp").forward(request, response);
    }

}
