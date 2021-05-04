package com.fish.business.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
/**
 * @ClassName Book
 * @Description 书籍实体类
 * @Author 柚子茶
 * @Date 2021/4/16 14:55
 * @Version 1.0
 */
public class Book implements Serializable {

    private static final long serialVersionUID = 3076961754592446572L;

    private String bookId;

    private String bookName;

    private String bookAuthor;

    private String bookPress;

    private String bookType;

    private Integer bookStockNumber;

    private BigDecimal bookBuyPrice;

    private BigDecimal bookSellPrice;

    private String bookPack;

    private Integer bookState;

    private String bookImageUrl;

    private String bookInfo;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    private Integer createUserId;

    /**
     * 书籍录入人的名称
     */
    private String createUserName;

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId == null ? null : bookId.trim();
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor == null ? null : bookAuthor.trim();
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress == null ? null : bookPress.trim();
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType == null ? null : bookType.trim();
    }

    public Integer getBookStockNumber() {
        return bookStockNumber;
    }

    public void setBookStockNumber(Integer bookStockNumber) {
        this.bookStockNumber = bookStockNumber;
    }

    public BigDecimal getBookBuyPrice() {
        return bookBuyPrice;
    }

    public void setBookBuyPrice(BigDecimal bookBuyPrice) {
        this.bookBuyPrice = bookBuyPrice;
    }

    public BigDecimal getBookSellPrice() {
        return bookSellPrice;
    }

    public void setBookSellPrice(BigDecimal bookSellPrice) {
        this.bookSellPrice = bookSellPrice;
    }

    public Integer getBookState() {
        return bookState;
    }

    public void setBookState(Integer bookState) {
        this.bookState = bookState;
    }

    public String getBookImageUrl() {
        return bookImageUrl;
    }

    public void setBookImageUrl(String bookImageUrl) {
        this.bookImageUrl = bookImageUrl == null ? null : bookImageUrl.trim();
    }

    public String getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(String bookInfo) {
        this.bookInfo = bookInfo == null ? null : bookInfo.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public String getBookPack() {
        return bookPack;
    }

    public void setBookPack(String bookPack) {
        this.bookPack = bookPack;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPress='" + bookPress + '\'' +
                ", bookType='" + bookType + '\'' +
                ", bookStockNumber=" + bookStockNumber +
                ", bookBuyPrice=" + bookBuyPrice +
                ", bookSellPrice=" + bookSellPrice +
                ", bookPack='" + bookPack + '\'' +
                ", bookState=" + bookState +
                ", bookImageUrl='" + bookImageUrl + '\'' +
                ", bookInfo='" + bookInfo + '\'' +
                ", createTime=" + createTime +
                ", createUserId=" + createUserId +
                ", createUserName='" + createUserName + '\'' +
                '}';
    }
}