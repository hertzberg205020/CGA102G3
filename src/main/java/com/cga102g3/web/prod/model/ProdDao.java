package com.cga102g3.web.prod.model;

import com.cga102g3.web.prod.entity.ProdVO;

import java.util.List;
import java.util.Map;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/
	public interface ProdDao {
		
	void insert(ProdVO prodVO);
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
     * @description: 編輯價格及狀態後返回商品頁面(後台
     * @param: 價格、狀態
     * @return: 商品物件
     * @auther: Alan
     * @date: 2022/06/28 10:28
     */
    public void update(ProdVO prodVO);
    
    public List<Map<String,Object>> findAllSale();
    
    public List<Map<String,Object>> findTopSale();
    
    public List<ProdVO> searchTitle(String title);
    
    public List<Map<String,Object>> selectTitle(String bookTitle);
}
