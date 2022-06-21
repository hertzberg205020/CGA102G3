package com.cga102g3.web.category.service.impl;

import com.cga102g3.web.category.dao.CategoryDao;
import com.cga102g3.web.category.dao.impl.CategoryDaoImpl;
import com.cga102g3.web.category.entity.Category;
import com.cga102g3.web.category.service.CategoryService;


import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-14 下午 10:30
 */
public class CategoryServiceImpl implements CategoryService {
    private CategoryDao dao;

    public CategoryServiceImpl() {
        dao = new CategoryDaoImpl();
    }

    @Override
    public List<Category> getAll() {
        return dao.selectAll();
    }
}
