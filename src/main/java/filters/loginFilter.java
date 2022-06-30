package filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginFilter implements Filter {

    private FilterConfig config;

    public void init(FilterConfig config) {
        this.config = config;
    }

    public void destroy() {
        config = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();

        Object memVO = session.getAttribute("memVO");
        if (memVO == null ) {        //失敗
//            session.setAttribute("location", req.getRequestURI());
            res.sendRedirect(req.getContextPath() + "/front-end/mem/login.jsp");
            return;
        } else {        //成功
            chain.doFilter(request, response);
        }
    }
}