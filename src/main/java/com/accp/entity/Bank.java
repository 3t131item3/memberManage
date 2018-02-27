package com.accp.entity;

public class Bank {
    private int  id; /*主键 */
    private String  name; /*银行名称*/
    private String  no ;/*银行卡号 唯一*/
    private String  pwd ;/*银行卡密码*/
    private Double remainder;/*余额*/
    private String  openUser;/*开户人*/
    private String  telphon;/*开户电话号码号码*/
    private String  papersNo;/*身份证*/

    public Bank() {
    }

    public Bank(int id, String name, String no, String pwd, Double remainder, String openUser, String telphon, String papersNo) {
        this.id = id;
        this.name = name;
        this.no = no;
        this.pwd = pwd;
        this.remainder = remainder;
        this.openUser = openUser;
        this.telphon = telphon;
        this.papersNo = papersNo;
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

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Double getRemainder() {
        return remainder;
    }

    public void setRemainder(Double remainder) {
        this.remainder = remainder;
    }

    public String getOpenUser() {
        return openUser;
    }

    public void setOpenUser(String openUser) {
        this.openUser = openUser;
    }

    public String getTelphon() {
        return telphon;
    }

    public void setTelphon(String telphon) {
        this.telphon = telphon;
    }

    public String getPapersNo() {
        return papersNo;
    }

    public void setPapersNo(String papersNo) {
        this.papersNo = papersNo;
    }
}
