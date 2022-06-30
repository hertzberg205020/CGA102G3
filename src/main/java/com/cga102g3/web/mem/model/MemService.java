package com.cga102g3.web.mem.model;

import java.sql.Date;
import java.util.List;



public class MemService {
	
	private MemDAO_interface dao;
	
	public MemService() {
		dao = new MemJDBCDAO();
	}
	
	public MemVO signup(String mbrAccount, String mbrPassword, String mbrName, Integer mbrGender, String mbrMobile,
			String mbrAddr, String mbrEmail, Date hiredate) {
		MemVO memVO01 = new MemVO();

		memVO01.setMbrAccount(mbrAccount);
		memVO01.setMbrPassword(mbrPassword);
		memVO01.setMbrName(mbrName);
		memVO01.setMbrGender(mbrGender);
		memVO01.setMbrMobile(mbrMobile);
		memVO01.setMbrAddr(mbrAddr);
		memVO01.setMbrEmail(mbrEmail);
		memVO01.setMbrBirth(hiredate);
		dao.signup(memVO01);
		
		return memVO01;
	}
	
	
	public MemVO signup(MemVO memVO) {
		dao.signup(memVO);
		return memVO;
	}
	
	
	public MemVO insert(MemVO memVO) {
		dao.insert(memVO);
		return memVO;
	}
	
	
	public MemVO update(Integer mbr_ID,  String mbr_password,
			 String mbr_name,  String mbr_mobile, String mbr_addr,
			String mbr_email, Date mbr_birth ) {
		
	MemVO memVO2 = new MemVO();

	memVO2.setMbrID(mbr_ID);	
	memVO2.setMbrPassword(mbr_password);
	memVO2.setMbrName(mbr_name);
	memVO2.setMbrMobile(mbr_mobile);
	memVO2.setMbrAddr(mbr_addr);
	memVO2.setMbrEmail(mbr_email);
	memVO2.setMbrBirth(mbr_birth);
	
	dao.update(memVO2);
	
	return memVO2;
	}
	
	public void deleteMem(Integer mbrID) {
		dao.delete(mbrID);
	}

	public MemVO getOneMem(Integer mbrID) {
		return dao.findByPrimaryKey(mbrID);
	}

	public List<MemVO> getAll() {
		return dao.getAll();
	}
	
	public MemVO login(String mbrAccount, String mbrPassword) {
		return dao.findMemAccountAndPassword(mbrAccount, mbrPassword);		
	}
	
}
