package com.accp.controller;

import com.accp.biz.CommodityBiz;
import com.accp.biz.CommoditySetMealBiz;
import com.accp.biz.UsersBiz;
import com.accp.entity.*;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/commoditySetMeal")
public class CommoditySetMealController {
    @Resource
    private CommoditySetMealBiz commoditySetMealBiz;
    @Resource
    private UsersBiz usersBiz;
    @Resource
    private CommodityBiz commodityBiz;
    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> getList(HttpServletRequest request){
        int pagerNo =1;
        if(request.getParameter("pageIndex")!=null){
            pagerNo=Integer.parseInt(request.getParameter("pageIndex"));
        }
        String userName=null;
        if(request.getParameter("name")!=null && request.getParameter("name")!="" ){
            userName= request.getParameter("name");
        }
        int   pageSize=3;
        if(request.getParameter("pageSize")!=null && request.getParameter("pageSize")!="" ){
            pageSize=Integer.parseInt( request.getParameter("pageSize"));
        }
        Pager<CommoditySetMeal> list = commoditySetMealBiz.getList(null, pagerNo, pageSize);
        Map<String, Object> map=new HashMap<String, Object>();
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy.mm.dd");
        map.put("rel",true);
        map.put("msg","获取成功");
        map.put("list",list.getData());
        map.put("count",list.getTotalCount());
        return  map;
    }
    @RequestMapping(value = "/Clearing/{mycars}/{names}")
    public String Clearing(@PathVariable String[] mycars, @PathVariable String[]  names, HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("mycars",mycars);
        map.put("names",names);
        request.getSession().setAttribute("map",map);
//        Users users =(Users) request.getSession().getAttribute("user");
//        request.getSession().setAttribute("user",users);
        return "redirect:/Clearing";
    }
    @RequestMapping(value = "/Clearings")
    @ResponseBody
    public Map<String, Object> Clearings(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> maps=new HashMap<String, Object>();
        List<Commodity> list=new ArrayList<Commodity>();
        if(request.getSession().getAttribute("map")!=null){
            maps=(Map<String,Object>)request.getSession().getAttribute("map");
            String[]  ms=(String [])maps.get("names");
            int i=0;
            int countPice=0;
            if(maps.get("mycars")!=null){
                for (String m:(String[]) maps.get("mycars")){
                    Commodity commodity = commodityBiz.queryCommodityId(Integer.parseInt(m));
                    double pice=Integer.parseInt(ms[i])*commodity.getDiscountPrice();
                    countPice+=pice;
                    commodity.setPrice(pice);
                    if(i<=ms.length){
                        commodity.setIllustrate(ms[i]);
                    }
                    list.add(commodity);
                    i++;
                }
                map.put("list",list);
                map.put("countPice",countPice);
            }
        }
        return map;
    }
    @RequestMapping(value = "/add/{commoditySetMealId}/{number}",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String  addShoppingcart(@PathVariable String[] commoditySetMealId, @PathVariable String[] number,HttpServletRequest request){
        Object erer=null;
        String[] mycars=new String[7];
        if(request.getParameterValues("beginDate")!=null){
            mycars = request.getParameterValues("beginDate");
        }
        int i=0;
        Users user=null;
        if(request.getSession().getAttribute("user")!=null){
            user = (Users) request.getSession().getAttribute("user");
        }
        if(user!=null&&number.length>0){
            if(user.getPwd2().equals(mycars[6])){
                user.setAddress(mycars[3]);
                user.setNations(mycars[2]);
                user.setPostalcode((String)mycars[4]);
                user.setRemainder(user.getRemainder()-Integer.parseInt(mycars[7]));
                if(usersBiz.modify(user)){
                    for (int is=0;is<commoditySetMealId.length;is++){
                        Commodity commodity = commodityBiz.queryCommodityId(Integer.parseInt(commoditySetMealId[is]));
                        Order order=new Order();
                        order.setCommodityId(commodity.getId());
                        order.setUserid(user.getId());
                        String v=mycars[5]+i;
                        order.setOrderNo(v);
                        order.setUserName(user.getUserName());
                        order.setConsignee(user.getName());
                        order.setOrdertime(new Date());
                        order.setType(mycars[0]);
                        if(i<number.length) {
                            order.setPrice(Integer.parseInt(number[i]) * commodity.getDiscountPrice());
                        }
                        if(commodityBiz.addOrder(order)){
                            erer="true";
//                            if(is==commoditySetMealId.length){
//                                return  erer;
//                            }
                            i++;
                        }else {
                            erer="false";

                        }
                    }
                }else {
                    erer="userFales";

                }

            }else {
                erer="noPwd";
            }
        }
        return JSON.toJSONString(erer);
    }

}
