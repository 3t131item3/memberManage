package com.accp.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Users {
    private int id;/*用户编号*/
    private String userName;/*用户名*/
    private String pwd;/*密码*/
    private String pwd2;/*支付密码*/
    private String name;/*真实姓名*/
    private String papersType;/*证件类型*/
    private String papersNo;/*证件号码*/
    private String telephoneNumber;/*联系电话*/
    private String email;/*电子邮件*/
    private String postalcode;/*邮政编码*/
    private String referee;/*推荐人*/
    private String nations;/*收货国家*/
    private String openBank;/*开户行*/
    private String openUserName;/*开户人*/
    private String openNo;/*开户卡号*/
    private String papersImgZ;/*证件照正面图片路径*/
    private String papersImgF;/*证件照反面图片路径*/
    private String bankCard;/*银行卡图片路径*/
    private String address;/*收货地址*/

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;/*创建时间*/

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modifyTime;/*最后修改时间*/

    private int state; /*0禁用,1启用*/
    private int roleId;/*角色id*/
    private double remainder;/*余额*/
    private Role role;
    private Bank bank;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }


    public int getId() {
        return id;
    }

    public Users() {
    }


    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPapersType() {
        return papersType;
    }

    public void setPapersType(String papersType) {
        this.papersType = papersType;
    }

    public String getPapersNo() {
        return papersNo;
    }

    public void setPapersNo(String papersNo) {
        this.papersNo = papersNo;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }

    public String getNations() {
        return nations;
    }

    public void setNations(String nations) {
        this.nations = nations;
    }

    public String getOpenBank() {
        return openBank;
    }

    public void setOpenBank(String openBank) {
        this.openBank = openBank;
    }

    public String getOpenUserName() {
        return openUserName;
    }

    public void setOpenUserName(String openUserName) {
        this.openUserName = openUserName;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public String getPapersImgZ() {
        return papersImgZ;
    }

    public void setPapersImgZ(String papersImgZ) {
        this.papersImgZ = papersImgZ;
    }

    public String getPapersImgF() {
        return papersImgF;
    }

    public void setPapersImgF(String papersImgF) {
        this.papersImgF = papersImgF;
    }

    public String getBankCard() {
        return bankCard;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public double getRemainder() {
        return remainder;
    }

    public void setRemainder(double remainder) {
        this.remainder = remainder;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPwd2() {
        return pwd2;
    }

    public void setPwd2(String pwd2) {
        this.pwd2 = pwd2;
    }

    public String getOpenNo() {
        return openNo;
    }

    public void setOpenNo(String openNo) {
        this.openNo = openNo;
    }
}
