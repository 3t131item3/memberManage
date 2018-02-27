package com.accp.entity;

import java.util.Date;

public class Order
{
    private int id;/*主键 */
    private int userid;/*用户编号*/
    private int commodityId;/*商品id*/
    private String orderNo;/*订单号*/
    private String userName;/*会员名称*/
    private String consignee;/*收货人*/
    private Date ordertime;/*交易日期*/
    private String type;/*交易类型*/
    private Double price;/*交易金额*/

    public Order(int id, int userid, int commodityId, String orderNo, String userName, String consignee, Date ordertime, String type, Double price) {
        this.id = id;
        this.userid = userid;
        this.commodityId = commodityId;
        this.orderNo = orderNo;
        this.userName = userName;
        this.consignee = consignee;
        this.ordertime = ordertime;
        this.type = type;
        this.price = price;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(int commodityId) {
        this.commodityId = commodityId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
