package com.accp.entity;

import java.util.List;

public class Pager<T> {
    private  int  pagerNo;
    private  int  pagerSize;
    private  int  totalCount;
    private  int  totalPageCount;
    private List<T> date;

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

    public List<T> getDate() {
        return date;
    }

    public void setDate(List<T> date) {
        this.date = date;
    }
}
