package com.accp.entity;

public class Root  {
  private int   id ;/*编号*/
    private int  manageItemId;/*管理表项编号*/
    private int  roleId ; /*角色编号*/

    public Root() {
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
}
