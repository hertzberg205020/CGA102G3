package com.cga102g3.web.bid_activ.controller; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-23 下午 05:38
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "BidActivitiesSchedulingServlet", value = "/BidActivitiesSchedulingServlet")
public class BidActivitiesSchedulingServlet extends HttpServlet {
    private Timer timer;
    @Override
    public void destroy() {

    }

    @Override
    public void init() throws ServletException {
        // 建立競拍活動排程器
        this.timer = new Timer();
        GregorianCalendar cal = new GregorianCalendar(2022, Calendar.MAY, 17, 0, 0, 0);
        TimerTask task = new TimerTask() {
            @Override
            public void run() {

            }
        };
        TimerTask task2 = new TimerTask() {
            @Override
            public void run() {
                // 排程器要做的事
            }
        };
        // 每5分鐘執行一次
        timer.scheduleAtFixedRate(task, cal.getTime(), 5 * 60 * 1000);
    }
}
