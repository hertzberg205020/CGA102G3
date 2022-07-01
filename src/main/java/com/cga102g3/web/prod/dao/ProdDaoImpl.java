package com.cga102g3.web.prod.dao;

import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.book.entity.Book;
import com.cga102g3.web.prod.entity.ProdVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/
public class ProdDaoImpl implements ProdDao{

    private static final String GET_ONE_STRING =
            "select p.status,p.prod_id,b.isbn,b.category_name,b.title,b.author,b.publisher,b.pubdate,b.pages,b.summary,b.table_content,p.price\n"
                    + "from book b\n"
                    + "join product p\n"
                    + "on b.book_id = p.book_id\n"
                    + "where p.prod_id = ?;";

    /**
     * @description: 透過prodID獲取單一ProdVO
     * @param: [prodID]
     * @return: com.cga102g3.web.prod.entity.ProdVO
     * @auther: Luke
     * @date: 2022/06/24 09:50:37
     */
    @Override
    public ProdVO findOneProd(int prodID) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            con = JDBCUtil.getConnection();
            ps = con.prepareStatement(GET_ONE_STRING);

            ps.setInt(1, prodID);
            rs = ps.executeQuery();

            rs.next();
            ProdVO pb = new ProdVO();
            Book book = new Book();
            book.setISBN(rs.getString("isbn"));
            book.setAuthor(rs.getString("author"));
            book.setCategoryName(rs.getString("category_name"));
            book.setTitle(rs.getString("title"));
            book.setPublisher(rs.getString("publisher"));
            book.setPubdate(rs.getDate("pubdate"));
            book.setPages(rs.getInt("pages"));
            book.setSummary(rs.getString("summary"));
            book.setTableContent(rs.getString("table_content"));
            pb.setBook(book);
            pb.setPrice(rs.getInt("price"));
            pb.setProdID(rs.getInt("prod_id"));
            pb.setStatus(rs.getInt("status"));
            return pb;

        } catch (SQLException e) {
            throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
        }finally {
            JDBCUtil.close(con,ps,rs);
        }
    }

    /**
     * @description: 商城首頁抓取status為1的資料
     * @param: []
     * @return: java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     * @auther: Luke
     * @date: 2022/06/24 09:51:23
     */
    @Override
    public List<Map<String,Object>> findAll() {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        final String GET_ALL_STRING =
            "select prod_id,title,price\n" +
                    "from book b\n" +
                    "join product p\n" +
                    "on b.book_ID = p.book_ID\n" +
                    "where p.status = 1";

        try{
            con = JDBCUtil.getConnection();
            ps = con.prepareStatement(GET_ALL_STRING);
            rs = ps.executeQuery();

            while(rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("prodID", rs.getInt("prod_ID"));
                map.put("price", rs.getInt("price"));
                map.put("title", rs.getString("title"));
                list.add(map);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
        }finally {
            JDBCUtil.close(con,ps,rs);
        }
        return list;
    }
    /**
     * @description:查詢符合優惠方案種類的prodID&price
     * @param: [category]
     * @return: java.util.List<java.util.Map<java.lang.String,java.lang.Integer>>
     * @auther: Luke
     * @date: 2022/06/29 10:38:08
     */
    @Override
    public List<Map<String, Integer>> useCategory(String category) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Map<String,Integer>> list = new ArrayList<>();
        final String sql = "select prod_ID,price\n" +
                "from book b\n" +
                "join product p\n" +
                "on b.book_ID = p.book_ID\n" +
                "where category_name = ?;";
        try {
            con = JDBCUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1,category);
            rs = ps.executeQuery();
            while (rs.next()){
                Map<String,Integer> map = new HashMap<>();
                map.put("prodID",rs.getInt("prod_ID"));
                map.put("price",rs.getInt("price"));
                list.add(map);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JDBCUtil.close(con,ps,rs);
        }
        return list;
    }
}
