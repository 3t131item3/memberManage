package com.accp.entity;

import java.util.List;

public class Manage {
    private int mId ;/*编号*/
    private String mName  ;/*名称*/
    private String mIcon;/*小图标*/
    private List<ManageItem>manageItems;/**/

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmIcon() {
        return mIcon;
    }

    public void setmIcon(String mIcon) {
        this.mIcon = mIcon;
    }

    public List<ManageItem> getManageItems() {
        return manageItems;
    }

    public void setManageItems(List<ManageItem> manageItems) {
        this.manageItems = manageItems;
    }
}
