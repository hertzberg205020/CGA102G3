package com.cga102g3.web.prod.dao;

import com.cga102g3.web.prod.entity.ProdVO;

import java.util.List;
import java.util.Map;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/
public interface ProdDao {
    /**
     * @description: 利用商品編號返回商品
     * @param: 商品編號
     * @return: 商品物件
     * @auther: Luke
     * @date: 2022/06/22 10:36:23
     */
    public ProdVO findOneProd(int prodID);
    /**
     * @description: 查詢所有商品
     * @param: 
     * @return: 
     * @auther: Luke
     * @date: 2022/06/22 10:37:01
     */
    public List<Map<String,Object>> findAll();

    /**
     * @description: 使用 category 找尋優惠種類商品ID及價格
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/06/29 10:30:05
     */
    public List<Map<String,Integer>> useCategory(String category);

}
