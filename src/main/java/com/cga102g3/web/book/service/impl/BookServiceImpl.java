package com.cga102g3.web.book.service.impl;

import com.cga102g3.web.book.dao.BookDao;
import com.cga102g3.web.book.dao.impl.BookDaoImpl;
import com.cga102g3.web.book.entity.Book;
import com.cga102g3.web.book.service.BookService;

import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-15 下午 01:57
 */
public class BookServiceImpl implements BookService {
    private static final String[] EXTENSIONS = {".jpg", ".png", ".jpeg", ".tiff"};
    private BookDao dao;

    public BookServiceImpl() {
        dao = new BookDaoImpl();
    }

    @Override
    public List<Integer> findEditionsByISBN(String ISBN) {
        List<Book> books = dao.selectByISBN(ISBN);
        List<Integer> editions = new ArrayList<>();

        for (Book book :
                books) {
            editions.add(book.getEdition());
        }

        return editions;
    }

    @Override
    public Boolean addBook(Book book, Part part, String destDirPath) throws IOException {
        File destDir = new File(destDirPath);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }
        // dao層添加book數據
        // 獲取id號並以id作為檔名
        int bookId = dao.insert(book);

        if (bookId != 0) {
            // 建立照片
            String fileExtension = getFileNameExtension(part);
            if (Arrays.asList(EXTENSIONS).contains(fileExtension)) {
                File bookImgFile = new File(destDir, bookId + fileExtension);
                System.out.println(bookImgFile);
                part.write(bookImgFile.toString());
//                byte[] bytes = part.getInputStream().readAllBytes();
            }
            return true;
        }

        return false;
    }

    @Override
    public Book getBookById(Integer bookID) {
        return dao.selectByPrimaryKey(bookID);
    }

    @Override
    public List<Integer> findEditionsByISBNExclID(String ISBN, Integer bookID) {
        List<Book> books = dao.selectByISBNExclID(ISBN, bookID);
        List<Integer> editions = new ArrayList<>();

        for (Book book :
                books) {
            editions.add(book.getEdition());
        }

        return editions;
    }

    @Override
    public Boolean updateBook(Book book, Part part, String destDirPath) throws IOException {
        File destDir = new File(destDirPath);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }
        // dao層添加book數據
        // 獲取id號並以id作為檔名
        if (dao.update(book) != 0) {
            // 建立照片
            String fileExtension = getFileNameExtension(part);
            if (Arrays.asList(EXTENSIONS).contains(fileExtension)) {
                File bookImgFile = new File(destDir, book.getBookID() + fileExtension);
                System.out.println(bookImgFile);
                part.write(bookImgFile.toString());
            }
            return true;
        }
        return false;
    }

    @Override
    public Book getBookByISBNAndEdition(String ISBN, Integer edition) {
        return dao.selectByISBNAndEdition(ISBN, edition);
    }

    @Override
    public Map<String, Object> getBooksByKeyword(String keyword, int page) {
//        int nextPage = -1;
//        Map<String, Object> res = new HashMap<>();
        List<Book> books = null;
        if (keyword == null || keyword.isEmpty()) {
            books = dao.selectAll(page);
//            if (books.size() == 13) {
//                nextPage = page + 1;
//                books.remove(books.size()-1);
//            }
//            res.put("nextPage", nextPage);
//            res.put("data", books);
//            return res;
            return getMapResult(books, page);
        }
        // 這裡邏輯還沒寫
        String isbnOrTitle = isISBNOrTitle(keyword);
        if ("ISBN".equals(isbnOrTitle)) {
            books = dao.selectByISBN(keyword, page);
        } else {
            books = dao.selectByTitle(keyword, page);
        }
        return getMapResult(books, page);
    }

    /**
     * 返回的形式為{
     *     nextPage: ?,
     *     data: list of book
     * }
     * @param books
     * @param page
     * @return
     */
    private Map<String, Object> getMapResult(List<Book> books, int page) {
        int nextPage = -1;
        Map<String, Object> res = new HashMap<>();
        if (books.size() == 13) {
            nextPage = page + 1;
            books.remove(books.size()-1);
        }
        res.put("nextPage", nextPage);
        res.put("data", books);
        return res;
    }

    public String getFileNameFromPart(Part part) {
        String header = part.getHeader("content-disposition");
//        System.out.println("header=" + header); // 測試用
        String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
//        System.out.println("filename=" + filename); // 測試用
        if (filename.length() == 0) {
            return null;
        }
        return filename;
    }

    /**
     * 得到文件的副檔名
     * @param part 上傳流
     * @return 副檔名(ex: .jpg, .png)
     */
    public String getFileNameExtension(Part part) {
        String fileName = getFileNameFromPart(part);
        if (fileName == null) {
            return null;
        }
        int index = fileName.lastIndexOf('.');
        if(index > 0) {
            return fileName.substring(index);
        }
        return null;
    }

    /**
     * 判斷keyword是isbn還是title
     * @param keyword
     * @return
     */
    private String isISBNOrTitle(String keyword) {
        return is13Digits(keyword) ? "ISBN" : "title";
    }

    /**
     * 簡易判斷是否為13位的數字
     * @param strNum
     * @return
     */
    public boolean is13Digits(String strNum) {
        Pattern pattern = Pattern.compile("^\\d{13}$");
        if (strNum == null) {
            return false;
        }
        return pattern.matcher(strNum).matches();
    }
}
