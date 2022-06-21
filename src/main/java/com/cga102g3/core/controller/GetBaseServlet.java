package com.cga102g3.core.controller; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-17 下午 05:21
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 使用額外路徑作為服務依據，
 * 註冊路徑一定要有/*
 * ex: url-pattern: /book/update/*
 */
public abstract class GetBaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        final String action = request.getPathInfo().substring(1);
        try {
            Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);
            // 調用目標業務方法
            method.invoke(this, request, response);
        } catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

}
