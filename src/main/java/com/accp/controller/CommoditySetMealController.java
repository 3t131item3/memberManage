package com.accp.controller;

import com.accp.biz.CommoditySetMealBiz;
import com.accp.entity.CommoditySetMeal;
import com.accp.entity.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/commoditySetMeal")
public class CommoditySetMealController {
    @Resource
    private CommoditySetMealBiz commoditySetMealBiz;
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

}
