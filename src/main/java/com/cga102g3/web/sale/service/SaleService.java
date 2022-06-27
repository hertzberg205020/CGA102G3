package com.cga102g3.web.sale.service;

import java.sql.Date;
import java.util.List;

import com.cga102g3.web.sale.dao.SaleDAO_interface;
import com.cga102g3.web.sale.dao.impl.SaleJDBCDAO;
import com.cga102g3.web.sale.entity.SaleVO;

public class SaleService {

	private SaleDAO_interface dao;

	public SaleService() {
		dao = new SaleJDBCDAO();
	}

	public SaleVO insert(SaleVO saleVO) {
		dao.insert(saleVO);
		return saleVO;
	}

	public SaleVO update(Date saleStart, Date saleEnd) {

		SaleVO saleVO2 = new SaleVO();

		saleVO2.setSaleStart(saleStart);
		saleVO2.setSaleEnd(saleEnd);
		dao.update(saleVO2);

		return saleVO2;
	}

//	public void delete(Integer saleID) {
//		dao.delete(saleID);
//	}

	public SaleVO findByPrimaryKey(Integer saleID) {
		return dao.findByPrimaryKey(saleID);
	}

	public List<SaleVO> getAll() {
		return dao.getAll();
	}

}
