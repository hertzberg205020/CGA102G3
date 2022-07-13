package com.cga102g3.web.prod.dao;

import com.cga102g3.web.prod.entity.CarObj;
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

    public List<Map<String,Object>> findCategory(int categoryID);

    /**
     * @description: 使用 category 找尋優惠種類商品ID及價格
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/06/29 10:30:05
     */
    public List<Map<String,Integer>> useCategory(String category);

    /** Find products by price range **/
    public List<Map<String,Object>> findPrice(int price);

    //前台首頁搜尋
    public List<Map<String,Object>> selectTitle(String bookTitle);

    /**
     * @description: 購物車
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/07/06 14:05:51
     */
    public CarObj getForCar(int prodID);

    /**
     * @description: 商品明細確認是否特價
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/07/10 12:48:27
     */
    public Integer checkSale(int prodID);



    public List<Map<String,Object>> findAllSale();

    public List<Map<String,Object>> findTopSale();

    public List<ProdVO> searchTitle(String title);

    List<Map<String,Object>> findAll(Integer no);
    public List<Map<String,Object>> showAll();

}
