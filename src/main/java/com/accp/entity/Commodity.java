package com.accp.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Commodity {
    private int id;/*id*/
    private String name;/*商品名称*/
    private String commodityNo;/*商品编号*/
    private double price;/*市场价*/
    private double discountPrice;/*优惠价*/
    private int stock;/*库存*/
    private String unit;/*单位*/
    private int state;/*0下架,1上架*/
    private String spec;/*规格*/
    private String illustrate;/*说明*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modifyTime;/*修改时间*/

    public Commodity() {
    }

    public Commodity(int id, String name, String commodityNo, double price, double discountPrice, int stock, String unit, int state, String spec, String illustrate, Date modifyTime) {
        this.id = id;
        this.name = name;
        this.commodityNo = commodityNo;
        this.price = price;
        this.discountPrice = discountPrice;
        this.stock = stock;
        this.unit = unit;
        this.state = state;
        this.spec = spec;
        this.illustrate = illustrate;
        this.modifyTime = modifyTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCommodityNo() {
        return commodityNo;
    }

    public void setCommodityNo(String commodityNo) {
        this.commodityNo = commodityNo;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getIllustrate() {
        return illustrate;
    }

    public void setIllustrate(String illustrate) {
        this.illustrate = illustrate;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}
