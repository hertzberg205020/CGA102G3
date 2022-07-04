package com.cga102g3.web.prod_sale.dao;

import java.util.List;

import com.cga102g3.web.prod_sale.entity.ProdSaleVO;

public interface ProdSaleDAO_interface {
	

    public void insert(ProdSaleVO prodsaleVO);
    public void update(ProdSaleVO prodsaleVO);
    void delete(Integer sale_ID, Integer prod_ID);
    public ProdSaleVO findByPrimaryKey(Integer sale_ID, Integer prod_ID);
    public List<ProdSaleVO> getAll();
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
    //public List<SaleVO> getAll(Map<String, String[]> map);

    /**
     * @description: 同時新增促銷專案及產品
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/06/29 10:53:30
     */
    public void insert2(ProdSaleVO prodSaleVO, java.sql.Connection con);
    /**
     * @description: 使用saleID返回ProdSaleVO
     * @param:
     * @return:
     * @auther: Luke
     * @date: 2022/07/01 10:50:36
     */
    public List<ProdSaleVO> getBySaleID(Integer saleID);

}
