package com.accp.entity;

import java.util.List;

public class Root  {
    private int id;/*编号*/
    private int manageItemId;/*管理表项编号*/
    private int roleId; /*角色编号*/
    private int rootState;/*是否有该权限 1有 2无*/
    private ManageItem manageItem;

    public ManageItem getManageItem() {
        return manageItem;
    }

    public void setManageItem(ManageItem manageItem) {
        this.manageItem = manageItem;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getManageItemId() {
        return manageItemId;
    }

    public void setManageItemId(int manageItemId) {
        this.manageItemId = manageItemId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getRootState() {
        return rootState;
    }

    public void setRootState(int rootState) {
        this.rootState = rootState;
    }
}
