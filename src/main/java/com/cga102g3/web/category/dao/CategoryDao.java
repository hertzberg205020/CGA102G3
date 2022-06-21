package com.cga102g3.web.category.dao;


import com.cga102g3.core.dao.CoreDao;
import com.cga102g3.web.category.entity.Category;

import java.util.List;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 09:27
 */
public interface CategoryDao extends CoreDao<Category, Integer> {
    List<Category> selectAll(Integer page);
}
