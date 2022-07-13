package com.cga102g3.core.filter; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-22 上午 11:17
 */

import javax.servlet.*;
import java.io.IOException;

public class SetCharacterEncodingFilter implements Filter {
    protected String encoding = null;
    protected FilterConfig config = null;

    public void init(FilterConfig config) throws ServletException {
        this.config = config;
        this.encoding = config.getInitParameter("encoding");
    }

    public void destroy() {
        this.encoding = null;
        this.config = null;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        // 使用 Filter 解決 Query String 之編碼問題
        // request.setCharacterEncoding("特定的字碼集");  // 這是設置post 請求request body內的字符集解析; get默認使用utf-8，要變更的話，要調設定
        request.setCharacterEncoding(encoding);
        // 將程式控制權交棒
        chain.doFilter(request, response);

    }
}
