package com.cga102g3.web.emp.model;

import java.util.List;

public interface AdminAuthDAO_interface {
	public void insert(AdminAuthVO adminAuthVO);
    public void update(AdminAuthVO adminAuthVO);
    public void delete(Integer adminID);
    public AdminVO findByPrimaryKey(Integer adminID);
    public List<AdminAuthVO> getAll();
}
