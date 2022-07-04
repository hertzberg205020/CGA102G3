package com.cga102g3.web.prod.model;

import com.cga102g3.web.prod.dao.ProdDao;
import com.cga102g3.web.prod.dao.ProdDaoImpl;
import com.cga102g3.web.prod.entity.ProdVO;

import javax.servlet.annotation.WebServlet;
import java.util.List;
import java.util.Map;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/
public class ProdService {
    private ProdDao dao;

    public ProdService() {
        dao = new ProdDaoImpl();
    }

    public ProdVO getOne(int prodID) {
        return dao.findOneProd(prodID);
    }
    
    
	public ProdVO addProd(Integer bookID, Integer price, Integer status) {

		ProdVO prodVO = new ProdVO();

		prodVO.setBookID(bookID);
		prodVO.setPrice(price);
		prodVO.setStatus(status);
		dao.insert(prodVO);

		return prodVO;
	}
	
	public ProdVO updateProd(Integer price, Integer status, Integer prodID) {

		ProdVO prodVO = new ProdVO();

		prodVO.setPrice(price);
		prodVO.setStatus(status);
		prodVO.setProdID(prodID);
		dao.update(prodVO);

		return prodVO;
	}
	
	
	   public List<Map<String, Object>> getALL() {
	        return dao.findAll();
	    }

		public List<Map<String, Object>> getCategory(int categoryID) {
			return dao.findCategory(categoryID);
		}

}