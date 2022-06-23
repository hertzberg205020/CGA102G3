package com.cga102g3.web.bid_prod.entity;


import com.cga102g3.web.book.dao.BookService;
import com.cga102g3.web.book.entity.Book;

import java.sql.Timestamp;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 10:14
 */
public class BidProd implements java.io.Serializable {
    private Integer bidID;
    private Integer bookID;
    private Integer startPrice = 0;
    private Integer bidDirectPrice = 0;
    private Integer bidCurPrice = 0;
    // 0: 安排競標, 1: 待上架, 2: 標案進行中, 3: 結帳售出, 4: 流標, 5: 撤銷
    private Integer bidProdStat = 0;
    private Timestamp bidStart;
    private Timestamp bidEnd;

    public Integer getBidID() {
        return bidID;
    }

    public void setBidID(Integer bidID) {
        this.bidID = bidID;
    }

    public Integer getBookID() {
        return bookID;
    }

    public void setBookID(Integer bookID) {
        this.bookID = bookID;
    }

    public Integer getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Integer startPrice) {
        this.startPrice = startPrice;
    }

    public Integer getBidDirectPrice() {
        return bidDirectPrice;
    }

    public void setBidDirectPrice(Integer bidDirectPrice) {
        this.bidDirectPrice = bidDirectPrice;
    }

    public Integer getBidCurPrice() {
        return bidCurPrice;
    }

    public void setBidCurPrice(Integer bidCurPrice) {
        this.bidCurPrice = bidCurPrice;
    }

    public Integer getBidProdStat() {
        return bidProdStat;
    }

    public void setBidProdStat(Integer bidProdStat) {
        this.bidProdStat = bidProdStat;
    }
    
    public Timestamp getBidStart() {
        return bidStart;
    }

    public void setBidStart(Timestamp bidStart) {
        this.bidStart = bidStart;
    }

    public Timestamp getBidEnd() {
        return bidEnd;
    }

    public void setBidEnd(Timestamp bidEnd) {
        this.bidEnd = bidEnd;
    }

    @Override
    public String toString() {
        return "BidProd{" +
                "bidID=" + bidID +
                ", bookID=" + bookID +
                ", startPrice=" + startPrice +
                ", bidDirectPrice=" + bidDirectPrice +
                ", bidCurPrice=" + bidCurPrice +
                ", bidProdStat=" + bidProdStat +
                ", bidStart=" + bidStart +
                ", bidEnd=" + bidEnd +
                '}';
    }
    
    public Book getBook() {
    	BookService sc = new BookService();
    	Book book = sc.showOne(bookID);
    	
    	return book;
    }
}
