package com.cga102g3.web.prod.entity;

import com.cga102g3.web.book.entity.Book;

import java.io.Serializable;

/**
 * @description: TODO
 * @author: Luke
 * @date: 2022/6/22
 **/
public class ProdVO implements Serializable {

        private Integer prodID;
        private Integer bookID;
        private Integer price;
        private Integer status;
        private Book book;

        public ProdVO() {
            // TODO Auto-generated constructor stub
        }
        public ProdVO(Integer prodID, Integer bookID, Integer price, Integer status, Book book) {
            super();
            this.prodID = prodID;
            this.bookID = bookID;
            this.price = price;
            this.status = status;
            this.book = book;
        }
        public Integer getProdID() {
            return prodID;
        }
        public void setProdID(Integer prodID) {
            this.prodID = prodID;
        }
        public Integer getBookID() {
            return bookID;
        }
        public void setBookID(Integer bookID) {
            this.bookID = bookID;
        }
        public Integer getPrice() {
            return price;
        }
        public void setPrice(Integer price) {
            this.price = price;
        }
        public Integer getStatus() {
            return status;
        }
        public void setStatus(Integer status) {
            this.status = status;
        }
        public Book getBook() {
            return book;
        }
        public void setBook(Book book) {
            this.book = book;
        }
    }


