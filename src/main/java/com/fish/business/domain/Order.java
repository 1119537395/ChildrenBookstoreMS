package com.fish.business.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fish.system.domain.User;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * @ClassName Order
 * @Description 订单实体类
 * @Author 柚子茶
 * @Date 2021/4/17 18:55
 * @Version 1.0
 */
public class Order implements Serializable {

    private static final long serialVersionUID = 993764139362161671L;

    private String orderId;

    private String bookId;

    private BigDecimal bookSellPrice;

    private Integer orderSellNumber;

    private BigDecimal orderAmount;

    private String orderInfo;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date orderCreateTime;

    private Integer createUserId;

    /** 关联表查询 */
    private Book book;

    /** 关联表查询 */
    private User user;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId == null ? null : bookId.trim();
    }

    public BigDecimal getBookSellPrice() {
        return bookSellPrice;
    }

    public void setBookSellPrice(BigDecimal bookSellPrice) {
        this.bookSellPrice = bookSellPrice;
    }

    public Integer getOrderSellNumber() {
        return orderSellNumber;
    }

    public void setOrderSellNumber(Integer orderSellNumber) {
        this.orderSellNumber = orderSellNumber;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(String orderInfo) {
        this.orderInfo = orderInfo == null ? null : orderInfo.trim();
    }

    public Date getOrderCreateTime() {
        return orderCreateTime;
    }

    public void setOrderCreateTime(Date orderCreateTime) {
        this.orderCreateTime = orderCreateTime;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", bookId='" + bookId + '\'' +
                ", bookSellPrice=" + bookSellPrice +
                ", orderSellNumber=" + orderSellNumber +
                ", orderAmount=" + orderAmount +
                ", orderInfo='" + orderInfo + '\'' +
                ", orderCreateTime=" + orderCreateTime +
                ", createUserId=" + createUserId +
                ", book=" + book +
                ", user=" + user +
                '}';
    }
}