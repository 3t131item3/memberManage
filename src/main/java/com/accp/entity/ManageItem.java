package com.accp.entity;

public class ManageItem {

    private int id ;/*编号  */
    private String name;/*名称*/
    private int manageId; /*管理表编号*/
    private String title;/*鼠标悬浮显示的标题*/
    private String icon;/*小图标*/
    private String href;/*要跳转的路径*/
    private Manage manage;/*管理类对象*/

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

    public int getManageId() {
        return manageId;
    }

    public void setManageId(int manageId) {
        this.manageId = manageId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Manage getManage() {
        return manage;
    }

    public void setManage(Manage manage) {
        this.manage = manage;
    }
}
