package com.cga102g3.web.book.controller; /**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-16 上午 11:26
 */

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

@WebServlet(name = "DownloadServlet", urlPatterns = {"/download"})
public class DownloadServlet extends HttpServlet {
    private static final String PREFIX = "images/books/";
    private static final String SUFFIX = ".jpg";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletOutputStream out = response.getOutputStream();
        String image = request.getParameter("image");
        ServletContext servletContext = getServletContext();
        String file = servletContext.getRealPath(PREFIX+image+SUFFIX);

        if (file == null) {
            out.println("No file to view");
            return;
        }

        String contentType = getServletContext().getMimeType(file);
        System.out.println("contentType=" + contentType);
        response.setContentType(contentType);  // 瀏覽器瀏覽檔案，告知瀏覽器如何解析檔案

//        response.setHeader("Content-Disposition", "attachment; filename=\""+(new File(file)).getName()+"\" ");

        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            byte[] buf = new byte[in.available()]; // buffer
            in.read(buf);
            out.write(buf);
        } catch (FileNotFoundException e) {
            out.println("File not found");
        } catch (IOException e) {
            out.println("Problem sending file: " + e.getMessage());
        } finally {
            if (in != null)
                in.close();
        }
    }

}
