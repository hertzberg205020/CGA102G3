package com.cga102g3.web.bid_activ.listener; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-23 下午 04:42
 */

import com.cga102g3.web.bid_activ.service.BidActivitiesSchedulingService;
import com.cga102g3.web.bid_activ.service.impl.BidActivitiesSchedulingServiceImpl;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Timer;
import java.util.TimerTask;

public class BidActivitiesSchedulingListener implements ServletContextListener {
    private Timer timer;
    public BidActivitiesSchedulingListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is initialized(when the Web application is deployed). */
        BidActivitiesSchedulingService service = new BidActivitiesSchedulingServiceImpl();
        // 建立競拍活動排程器
        this.timer = new Timer();
        GregorianCalendar cal = new GregorianCalendar(2022, Calendar.JUNE, 29, 11, 41, 0);
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                // 安排上架
                service.launchProducts();
                // 安排下架
                service.discontinuedProducts();
            }
        };

        // 每5分鐘執行一次
        timer.scheduleAtFixedRate(task, cal.getTime(), 5 * 60 * 1000);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
        // 關閉競拍活動排程器
        if (timer != null) {
            timer.cancel();
            timer = null;
        }
    }


}
