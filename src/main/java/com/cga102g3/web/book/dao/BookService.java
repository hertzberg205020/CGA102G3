package com.cga102g3.web.book.dao;


import com.cga102g3.web.book.dao.impl.BookDaoImpl;
import com.cga102g3.web.book.entity.Book;

import java.util.List;

public class BookService {
	
	private BookDao dao;
	public BookService() {
		dao = new BookDaoImpl();
	}
	public Book showOne(Integer bookID) {
		return dao.selectByPrimaryKey(bookID);
	}
	
	public List<Book> getAll() {
		return dao.selectAll();
	}
	
	
}
