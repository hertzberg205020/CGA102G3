package com.cga102g3.core.dao;

import java.util.List;
import java.util.ResourceBundle;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 04:22
 */
public interface CoreDao<P, I> {
    int pageSize = Integer.parseInt(
            ResourceBundle.getBundle("jdbc").getString("pageSize"));
    int insert(P pojo);

    int deleteById(I id);

    int update(P pojo);

    P selectByPrimaryKey(I id);

    List<P> selectAll();
}
