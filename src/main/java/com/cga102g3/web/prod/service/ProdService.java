package com.cga102g3.web.prod.service;

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

    public List<Map<String, Object>> getALL() {
        return dao.findAll();
    }
    
    public List<Map<String, Integer>> getCategory(String categoryID) {
    	return dao.useCategory(categoryID);
    }

}
