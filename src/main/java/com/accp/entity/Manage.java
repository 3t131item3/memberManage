package com.accp.entity;

import java.util.List;

public class Manage {
    private int id ;/*编号*/
    private String name  ;/*名称*/
//    private List<ManageItem>manageItems;/*管理表项集合*/
    public Manage() {
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

//    public List<ManageItem> getManageItems() {
//        return manageItems;
//    }
//
//    public void setManageItems(List<ManageItem> manageItems) {
//        this.manageItems = manageItems;
//    }
}
