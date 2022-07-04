package com.cga102g3.web.category.service;

import com.cga102g3.web.category.entity.Category;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-14 下午 10:29
 */
public interface CategoryService {
    List<Category> getAll();
    List<Map<String, Object>> getALL();
}
