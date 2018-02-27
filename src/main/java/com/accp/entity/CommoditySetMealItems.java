package com.accp.entity;

public class CommoditySetMealItems {
   private int  id;
    private int commoditySetMealId;/*套餐id*/
    private int  commodityId ;/*商品id*/
    private int  num ;/*个数*/

    public CommoditySetMealItems() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCommoditySetMealId() {
        return commoditySetMealId;
    }

    public void setCommoditySetMealId(int commoditySetMealId) {
        this.commoditySetMealId = commoditySetMealId;
    }

    public int getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(int commodityId) {
        this.commodityId = commodityId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
