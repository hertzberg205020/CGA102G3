package com.cga102g3.web.emp.model;

import java.util.List;

public class AdminAuthService {

private  AdminAuthJDBCDAO dao;
	
	public AdminAuthService() {
		dao = new AdminAuthJDBCDAO();
	}
	
	public AdminAuthVO insert(Integer AdminID, Integer authID){
		
		AdminAuthVO adminAuthVO = new AdminAuthVO();
		adminAuthVO.setAdminmID(AdminID);
		adminAuthVO.setAuthID(authID);
		dao.insert(adminAuthVO);
		return adminAuthVO;
	}
	public void delete(Integer AdminID){
		AdminAuthVO adminAuthVO = new AdminAuthVO();
		adminAuthVO.setAdminmID(AdminID);
	
		dao.delete(adminAuthVO);	
	}
	public List<AdminAuthVO> getAdminAuth(Integer AdminID) {
		return dao.findByPrimaryKey(AdminID);
	}
	
}
