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


}
