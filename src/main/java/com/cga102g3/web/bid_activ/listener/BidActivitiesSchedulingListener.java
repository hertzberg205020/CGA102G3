package com.cga102g3.web.bid_activ.listener; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-23 下午 04:42
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Timer;

@WebListener
public class BidActivitiesSchedulingListener implements ServletContextListener {
    private Timer timer;
    public BidActivitiesSchedulingListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is initialized(when the Web application is deployed). */
        // 建立競拍活動排程器
//        Thread thread = new Thread(() -> {
//            System.out.println("1");
//        });
        this.timer = new Timer();
        GregorianCalendar cal = new GregorianCalendar(2022, Calendar.MAY, 17, 0, 0, 0);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
        // 關閉競拍活動排程器
    }


}
