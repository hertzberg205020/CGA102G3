package com.cga102g3.web.prod_sale.service;

import java.sql.Date;
import java.util.List;

import com.cga102g3.web.prod_sale.dao.ProdSaleDAO_interface;
import com.cga102g3.web.prod_sale.dao.impl.ProdSaleJDBCDAO;
import com.cga102g3.web.prod_sale.entity.ProdSaleVO;


public class ProdSaleService {
	
	private ProdSaleDAO_interface dao;

	public ProdSaleService() {
		dao = new ProdSaleJDBCDAO();
	}

	public ProdSaleVO insert(ProdSaleVO prodsaleVO) {
		dao.insert(prodsaleVO);
		return prodsaleVO;
	}

	public ProdSaleVO update(Integer saleID, Integer prodID, Integer salePrice) {

		ProdSaleVO saleVO2 = new ProdSaleVO();

		saleVO2.setSaleID(saleID);
		saleVO2.setProdID(prodID);
		saleVO2.setSalePrice(salePrice);
		dao.update(saleVO2);

		return saleVO2;
	}

//	public void delete(Integer saleID) {
//		dao.delete(saleID);
//	}

	public ProdSaleVO findByPrimaryKey(Integer saleID, Integer prodID) {
		return dao.findByPrimaryKey(saleID, prodID);
	}

	public List<ProdSaleVO> getAll() {
		return dao.getAll();
	}

}
