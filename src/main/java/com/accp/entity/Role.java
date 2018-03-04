package com.accp.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Role {
   private int id ;/*id*/
    private String  no;/*编号*/
    private String name;/*名称*/
    private int  stats ;/*状态：1启用,0禁用*/

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modifyTime;

    public Role() {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStats() {
        return stats;
    }

    public void setStats(int stats) {
        this.stats = stats;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}
