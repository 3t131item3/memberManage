package com.accp.entity;

import java.util.Date;

public class BankTranRecords {
    private int id;
    private String no; /*交易卡号*/
    private String type;/*交易类型*/
    private Double price;/*交易金额*/
    private Date tranTime;/*交易时间*/

    public BankTranRecords() {
    }

    public BankTranRecords(int id, String no, String type, Double price, Date tranTime) {
        this.id = id;
        this.no = no;
        this.type = type;
        this.price = price;
        this.tranTime = tranTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getTranTime() {
        return tranTime;
    }

    public void setTranTime(Date tranTime) {
        this.tranTime = tranTime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
