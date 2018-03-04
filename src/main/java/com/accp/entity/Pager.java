package com.accp.entity;

import java.util.List;

public class Pager<T> {
    //   当前页数
    private  int  pagerNo;
    //   每页行数
    private  int  pagerSize;
    //    总行数
    private  int  totalCount;
    //    总页数
    private  int  totalPageCount;
    private List<T> data;

    public int getPagerNo() {
        return pagerNo;
    }

    public void setPagerNo(int pagerNo) {
        this.pagerNo = pagerNo;
    }

    public int getPagerSize() {
        return pagerSize;
    }

    public void setPagerSize(int pagerSize) {
        this.pagerSize = pagerSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
