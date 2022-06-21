package com.cga102g3.web.book.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

/**
 * @Description
 * @Author Robert
 * @Version
 * @Date 2022-06-05 下午 04:31
 */
public class Book implements Serializable {

    private static final long serialVersionUID  = 1L;

    private Integer bookID;
    private String ISBN;
    private Integer edition;
    private String categoryName;
    private String title;
    private String author;
    private String translator;
    private String publisher;
    private Date pubdate;
    private Integer pages;
    private String summary;
    private String tableContent;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book bookVO = (Book) o;
        return bookID.equals(bookVO.bookID);
    }

    public Book(Integer bookID, String ISBN, Integer edition, String categoryName, String title, String author, String translator, String publisher, Date pubdate, Integer pages, String summary, String tableContent) {
        this.bookID = bookID;
        this.ISBN = ISBN;
        this.edition = edition;
        this.categoryName = categoryName;
        this.title = title;
        this.author = author;
        this.translator = translator;
        this.publisher = publisher;
        this.pubdate = pubdate;
        this.pages = pages;
        this.summary = summary;
        this.tableContent = tableContent;
    }

    public Book() {
    }

    public Book(String ISBN, Integer edition, String categoryName, String title, String author, String translator, String publisher, Date pubdate, Integer pages, String summary, String tableContent) {
        this.ISBN = ISBN;
        this.edition = edition;
        this.categoryName = categoryName;
        this.title = title;
        this.author = author;
        this.translator = translator;
        this.publisher = publisher;
        this.pubdate = pubdate;
        this.pages = pages;
        this.summary = summary;
        this.tableContent = tableContent;
    }

    public Integer getBookID() {
        return bookID;
    }

    public void setBookID(Integer bookID) {
        this.bookID = bookID;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public Integer getEdition() {
        return edition;
    }

    public void setEdition(Integer edition) {
        this.edition = edition;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTranslator() {
        return translator;
    }

    public void setTranslator(String translator) {
        this.translator = translator;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTableContent() {
        return tableContent;
    }

    public void setTableContent(String tableContent) {
        this.tableContent = tableContent;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookID=" + bookID +
                ", ISBN='" + ISBN + '\'' +
                ", edition=" + edition +
                ", categoryName='" + categoryName + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", translator='" + translator + '\'' +
                ", publisher='" + publisher + '\'' +
                ", pubdate=" + pubdate +
                ", pages=" + pages +
                ", summary='" + summary + '\'' +
                ", tableContent='" + tableContent + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookID);
    }
}
