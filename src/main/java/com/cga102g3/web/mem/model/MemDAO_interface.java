package com.cga102g3.web.mem.model;

import java.util.*;



public interface MemDAO_interface {
	public void signup(MemVO memVO);
	public void insert(MemVO memVO);
    public void update(MemVO memVO);
    public void delete(Integer mbrID);
    public MemVO findByPrimaryKey(Integer mbrID);
    public MemVO findMemAccountAndPassword(String mbrAccount, String mbrPassword);
    public List<MemVO> getAll();
}
