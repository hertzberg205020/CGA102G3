package com.cga102g3.web.book.service;


import com.cga102g3.web.book.entity.Book;

import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-15 下午 01:44
 */
public interface BookService {
    List<Integer> findEditionsByISBN(String ISBN);
    Boolean addBook(Book book, Part part, String destDir) throws IOException;
    Book getBookById(Integer bookID);
    List<Integer> findEditionsByISBNExclID(String ISBN, Integer bookID);
    Boolean updateBook(Book book, Part part, String destDir) throws IOException;

    /**
     * 依isbn和版次查找書籍
     * @return
     */
    Book getBookByISBNAndEdition(String ISBN, Integer edition);

    Map<String, Object> getBooksByKeyword(String keyword, int page);
}
