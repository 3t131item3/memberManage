package com.accp.controller;

import com.accp.biz.BankBiz;
import com.accp.biz.BankTranRecordsBiz;
import com.accp.biz.TranRecordsBiz;
import com.accp.biz.UsersBiz;
import com.accp.entity.Bank;
import com.accp.entity.BankTranRecords;
import com.accp.entity.TranRecords;
import com.accp.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class BankController {
    @Resource(name = "bankBiz")
    private BankBiz bankBiz;

    @Resource(name = "bankTranRecordsBiz")
    private BankTranRecordsBiz bankTranRecordsBiz;

    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;

    @Resource(name = "tranRecordsBiz")
    private TranRecordsBiz tranRecordsBiz;

    @RequestMapping("/recharge")
    public String recharge(BankTranRecords bankTranRecords, HttpServletRequest request){
        Users user = (Users) request.getSession().getAttribute("user");
//        更新银行卡的余额
        Bank bank=new Bank();
        bank.setNo(user.getOpenNo());
        bank=bankBiz.bank(bank);
        double price=bank.getRemainder()-bankTranRecords.getPrice();
        bank.setRemainder(Math.round(price* 100)/100.0);
        bankBiz.modify(bank);

//        修改当前用户的余额
        user.setRemainder(user.getRemainder()+bankTranRecords.getPrice());
        usersBiz.modify(user);
//        添加银行卡交易记录
        bankTranRecords.setTranTime(new Date());
        bankTranRecords.setType("网络消费");
        bankTranRecordsBiz.add(bankTranRecords);
//        添加交易记录
        TranRecords tranRecords=new TranRecords();
        tranRecords.setTranTime(new Date());
        tranRecords.setTitle(user.getOpenBank()+"充值");
        tranRecords.setRemainder(user.getRemainder());
        tranRecords.setPrice(bankTranRecords.getPrice());
        tranRecords.setUserid(user.getId());
        tranRecordsBiz.add(tranRecords);
        return "/remittanc";
    }
    @RequestMapping("/queryPrice")
    @ResponseBody
    public String queryPrice( HttpServletRequest request){
        double price=Double.parseDouble(request.getParameter("price"));
        Users user = (Users) request.getSession().getAttribute("user");
        Bank bank=new Bank();
        bank.setNo(user.getOpenNo());
        bank=bankBiz.bank(bank);
        if(bank.getRemainder()<price){
            return "{\"result\":\"false\"}";
        }else {
            return "{\"result\":\"true\"}";
        }
    }
}
