package com.accp.controller;

import com.accp.biz.BankBiz;
import com.accp.biz.BankTranRecordsBiz;
import com.accp.biz.TranRecordsBiz;
import com.accp.biz.UsersBiz;
import com.accp.entity.*;
import com.accp.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/Users")
public class UsersController {
    @Resource(name = "usersBiz")
    private UsersBiz usersBiz;

    @Resource(name = "tranRecordsBiz")
    private TranRecordsBiz tranRecordsBiz;

    @Resource(name = "bankBiz")
    private BankBiz bankBiz;

    @Resource(name = "bankTranRecordsBiz")
    private BankTranRecordsBiz bankTranRecordsBiz;

    public  String usersList(){
        return null;
    }
    @RequestMapping(value = "/add.do/{userName}/{password}",method = RequestMethod.GET)
    public  String addUsers(@PathVariable String userName,@PathVariable String password){
        Users users=new Users();
        users.setUserName(userName);
        users.setPwd(MD5.MD5Encode(password));
        if( usersBiz.addUsers(users)){
            return "redirect:/login";
        }
        return  "redirect:/register";
    }
    @RequestMapping("/pwdmodifys/{oldpassword}")
    @ResponseBody
    private Object updatepwd(@PathVariable String oldpassword, HttpServletRequest req) {
        Errors errors = new Errors();
//        if (oldpassword != null&& oldpassword!="") {
//            if(usersBiz.queryUserName(oldpassword)){
//                errors.setResult("false");
//            }else {
//                errors.setResult("true");
//            }
//        } else {
//            errors.setResult("error");
//        }
        return errors;
    }
//判断二级密码是否正确
    @ResponseBody
    @RequestMapping("/pwdeq")
    private String pwd2eq(HttpServletRequest request){
        Users user = (Users) request.getSession().getAttribute("user");
//        String pwd2 = MD5.MD5Encode(request.getParameter("pwd2"));
        String pwd2 = request.getParameter("pwd2");
        if(user.getPwd2().equals(pwd2)){
            return "{\"result\":\"true\"}";
        }else {
            return "{\"result\":\"false\"}";
        }
    }
    @ResponseBody
    @RequestMapping("/unlock")
    public String unlock(HttpServletRequest request){
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(usersBiz.queryUser(userName,password)!=null){
            return "{\"rel\":\"true\"}";
        }else {
            return "{\"rel\":\"密码错误！(ps:解锁密码为登录密码)\"}";
        }
    }

    @ResponseBody
    @RequestMapping("/list")
    private Map<String, Object> getList(HttpServletRequest request){
        int pagerNo =1;
        if(request.getParameter("pageIndex")!=null){
            pagerNo=Integer.parseInt(request.getParameter("pageIndex"));
        }
        String userName=null;
        if(request.getParameter("name")!=null && request.getParameter("name")!="" ){
            userName= request.getParameter("name");
        }
        int   pageSize=3;
        if(request.getParameter("pageSize")!=null){
            pageSize=Integer.parseInt(request.getParameter("pageSize"));
        }
        Pager<Users> usersPager = usersBiz.queryList(userName, pagerNo, pageSize);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("rel",true);
        map.put("msg","获取成功");
        map.put("list",usersPager.getData());
        map.put("count",usersPager.getTotalCount());
        return  map ;
    }
    //删除
    @ResponseBody
    @RequestMapping(value ="/delete/{id}",method = RequestMethod.GET)
    private  Map<String, Object>  delete(@PathVariable int id){
        Map<String, Object> map=new HashMap<String, Object>();
        if(usersBiz.deleteUsers(id)){
            map.put("msg","删除成功!");
        }else {
            map.put("msg","删除失败!");
        }

        return map;
    }

    @ResponseBody
    @RequestMapping("/existsUser")
    public String existsUser(HttpServletRequest request){
        String userName =request.getParameter("userName") ;
        if(usersBiz.queryUserName(userName)){
            return "{\"result\":\"true\"}";
        }else {
            return "{\"result\":\"false\"}";
        }
    }
    @RequestMapping("/zhuanzhang")
    public String zhuanzhang(Users users,HttpServletRequest request){
//        被转账人
        Users users1=new Users();
        users1.setUserName(users.getUserName());
        users1=usersBiz.query(users1);
//        转账人
        Users users2=(Users) request.getSession().getAttribute("user");
//       扣去余额
        users2.setRemainder(Math.round((users2.getRemainder()-users.getRemainder())*100)/100.0);
//        增加余额
        users1.setRemainder(users1.getRemainder()+users.getRemainder());
//        更新余额
        usersBiz.modify(users1);
        usersBiz.modify(users2);
//        添加交易记录  转出
        TranRecords tranRecords=new TranRecords();
        tranRecords.setTranType("转出");
        tranRecords.setUserid(users2.getId());
        tranRecords.setPrice(users.getRemainder());
        tranRecords.setRemainder(users2.getRemainder());
        tranRecords.setTranTime(new Date());
        tranRecords.setTitle("使用余额转出"+users.getRemainder()+"元给"+users1.getUserName());
        tranRecordsBiz.add(tranRecords);
//        添加交易记录 转入
        tranRecords.setTranType("转入");
        tranRecords.setUserid(users1.getId());
        tranRecords.setPrice(users.getRemainder());
        tranRecords.setRemainder(users1.getRemainder());
        tranRecords.setTranTime(new Date());
        tranRecords.setTitle(users2.getUserName()+"转给你"+users.getRemainder()+"元");
        tranRecordsBiz.add(tranRecords);
        return "redirect:/nternaltransfer";
    }

    @RequestMapping("/tixian")
    public String tixian(HttpServletRequest request){
        Date date=new Date();
        Users users=(Users)request.getSession().getAttribute("user");
        Bank bank=new Bank();
        bank.setNo(users.getOpenNo());
        bank=bankBiz.bank(bank);
//        扣除余额
        String remainder = request.getParameter("remainder");
        if(remainder!=null){
            users.setRemainder((Math.round((users.getRemainder()-Double.parseDouble(remainder))*100)/100.0));
        }
//        添加银行卡余额
        bank.setRemainder(bank.getRemainder()+Double.parseDouble(remainder));
//        更新
        usersBiz.modify(users);
        bankBiz.modify(bank);

//        添加用户交易记录
        TranRecords tranRecords=new TranRecords();
        tranRecords.setTitle("提现"+remainder+"元到"+users.getOpenBank()+"银行卡尾号"+users.getOpenNo().substring(users.getOpenNo().length()-4,users.getOpenNo().length()));
        tranRecords.setTranTime(date);
        tranRecords.setRemainder(users.getRemainder());
        tranRecords.setPrice(Double.parseDouble(remainder));
        tranRecords.setUserid(users.getId());
        tranRecords.setTranType("提现");
        tranRecordsBiz.add(tranRecords);
//        添加银行卡交易记录
        BankTranRecords bankTranRecords=new BankTranRecords();
        bankTranRecords.setType("入账");
        bankTranRecords.setTitle("会员商城转入"+remainder+"元");
        bankTranRecords.setTranTime(date);
        bankTranRecords.setNo(users.getOpenNo());
        bankTranRecords.setPrice(Double.parseDouble(remainder));
        bankTranRecords.setOrderNo(date.getYear() + "" + date.getMonth() + "" + date.getDate() + "" + date.getHours() + "" + date.getMinutes() + "" + date.getSeconds() + "" + users.getId());
        bankTranRecordsBiz.add(bankTranRecords);
        return "/destoon_finance_cash";
    }

}
