package com.cga102g3.web.category.dao.impl;


import com.cga102g3.core.util.JDBCUtil;
import com.cga102g3.web.category.dao.CategoryDao;
import com.cga102g3.web.category.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 09:32
 */
public class CategoryDaoImpl implements CategoryDao {


    @Override
    public int insert(Category pojo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int res = 0;
        String sql = "insert into category(category_name) values (?);";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pojo.getCategoryName());
            res = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return res;
    }

    /**
     * 未實現
     * @param id
     * @return
     */
    @Override
    public int deleteById(Integer id) {
        return 0;
    }

    @Override
    public int update(Category pojo) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int res = 0;
        String sql = "update category set category_name = ? where category_ID = ?;";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pojo.getCategoryName());
            ps.setInt(2, pojo.getCategoryID());
            res = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return res;
    }

    @Override
    public Category selectByPrimaryKey(Integer id) {
        Category category = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql =
                "select category_ID, category_name\n" +
                "from category where category_ID = ?;";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            List<Category> categoryList = retrieve(rs);
            if (categoryList.size() != 0) {
                category = categoryList.get(0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return category;
    }

    @Override
    public List<Category> selectAll() {
        List<Category> categoryList = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql =
                "select category_ID, category_name\n" +
                "from category\n" +
                "order by category_ID;";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            categoryList = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return categoryList;
    }

    /**
     * 查詢所有書目種類，每頁12筆
     * @param page
     * @return
     */
    @Override
    public List<Category> selectAll(Integer page) {
        List<Category> categoryList = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql =
                "select category_ID, category_name\n" +
                "from category\n" +
                "limit ?, ?;";
        try {
            conn = JDBCUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pageSize * (page - 1));
            ps.setInt(2, pageSize + 1);
            rs = ps.executeQuery();
            categoryList = retrieve(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, ps, rs);
        }
        return categoryList;
    }

    /**
     * 將查詢結果放入list中，並返回
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<Category> retrieve(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        Category category = null;
        while (rs.next()) {
            category = new Category();
            category.setCategoryID(rs.getInt("category_ID"));
            category.setCategoryName(rs.getString("category_name"));
            categories.add(category);
        }
        return categories;
    }

    public static void main(String[] args) {
        // 測試依主鍵查找書籍種類
        CategoryDao categoryDao = new CategoryDaoImpl();
        Category category = categoryDao.selectByPrimaryKey(5);
        System.out.println(category);

        // 查找所有書籍種類，每頁12筆
//        CategoryDao categoryDao = new CategoryDaoImpl();
//        List<Category> categories = categoryDao.selectAll(1);
//        System.out.println(categories);
//        List<Category> categories = categoryDao.selectAll();
//        System.out.println(categories);


        // 測試增加一筆書籍種類資料
//        Category category = new Category();
//        category.setCategoryName("Go");
//        CategoryDao categoryDao = new CategoryDaoImpl();
//        categoryDao.insert(category);

        // 測試異動一筆書籍種類資料
//        CategoryDao categoryDao = new CategoryDaoImpl();
//        Category category = categoryDao.selectByPrimaryKey(8);
//        category.setCategoryName("Go");
//        categoryDao.update(category);
    }
}
