/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-17 下午 05:18
 */
package com.cga102g3.web.book.controller;


import com.cga102g3.core.controller.GetBaseServlet;
import com.cga102g3.web.book.entity.Book;
import com.cga102g3.web.book.service.BookService;
import com.cga102g3.web.book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateBookServlet", urlPatterns = {"/book/update/*"})
public class UpdateBookServlet extends GetBaseServlet {
    private final BookService service = new BookServiceImpl();

    /**
     * /book/update/getOneForUpdate?bookID={int}
     * 依據書目編碼返回要查找的書目修改頁面
     * 若查找不到找定書目id則跳轉到書目查詢總表頁面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer bookID = Integer.valueOf(request.getParameter("bookID"));
        Book book = service.getBookById(bookID);
        if (book == null) {
            // 跳轉到書目總表查詢頁面
            // redirect具有穿透性，所以要在redirect下方return
            response.sendRedirect(request.getContextPath() + "/back-end/book/back_book_view.jsp");
            return;
        }
        request.setAttribute("book", book);
        request.getRequestDispatcher("/back-end/book/update_book.jsp").forward(request, response);
    }

}
