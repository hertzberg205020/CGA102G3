package com.cga102g3.web.sale.dao;

import java.util.*;

import com.cga102g3.web.sale.entity.SaleVO;

public interface SaleDAO_interface {

    public void insert(SaleVO saleVO);
    public void update(SaleVO saleVO);
    public void delete(Integer saleID);
    public SaleVO findByPrimaryKey(Integer saleID);
    public List<SaleVO> getAll();
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
    //public List<SaleVO> getAll(Map<String, String[]> map); 

}
