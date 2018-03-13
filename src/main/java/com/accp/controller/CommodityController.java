package com.accp.controller;

import com.accp.biz.CommodityBiz;
import com.accp.biz.CommoditySetMealBiz;
import com.accp.entity.Commodity;
import com.accp.entity.CommoditySetMeal;
import com.accp.entity.Errors;
import com.accp.entity.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
    @Resource(name = "commodityBiz")
    private CommodityBiz commodityBiz;
    @Resource(name = "commoditySetMealBiz")
    private CommoditySetMealBiz commoditySetMealBiz;

    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> getList(HttpServletRequest request) {
        int pagerNo = 1;
        if (request.getParameter("pageIndex") != null) {
            pagerNo = Integer.parseInt(request.getParameter("pageIndex"));
        }
        String userName = null;
        if (request.getParameter("name") != null && request.getParameter("name") != "") {
            userName = request.getParameter("name");
        }
        int pageSize = 3;
        if (request.getParameter("pageSize") != null && request.getParameter("pageSize") != "") {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        Pager<Commodity> list = commodityBiz.getList(null, pagerNo, pageSize);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rel", true);
        map.put("msg", "获取成功");
        map.put("list", list.getData());
        map.put("count", list.getTotalCount());
        return map;
    }

    //新增
    @ResponseBody
    @RequestMapping(value = "/add/{mycars}", method = RequestMethod.GET)
    private Map<String, Object> add(@PathVariable String[] mycars) {
        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, String> map1 = new HashMap<String, String>();
        Commodity comm = new Commodity();
        comm.setCommodityNo(mycars[0]);
        comm.setName(mycars[1]);
        comm.setPrice(Double.parseDouble(mycars[2]));
        comm.setDiscountPrice(Double.parseDouble(mycars[3]));
        comm.setStock(Integer.parseInt(mycars[4]));
        comm.setUnit(mycars[5]);
        comm.setState(Integer.parseInt(mycars[6]));
        comm.setIllustrate(mycars[7]);
        if (commodityBiz.addCommodity(comm)) {
//        if(2<1){
            map.put("msg", "成功");
        } else {
            map.put("msg", "失败");
        }
        return map;
    }

    //删除
    @ResponseBody
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    private Map<String, Object> delete(@PathVariable int id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Commodity commodity = commodityBiz.queryCommodityId(id);
        CommoditySetMeal commpage = commoditySetMealBiz.queryCommodityId(commodity.getId());
        Commodity commodity1 = new Commodity();
        commodity1.setId(id);
        if (commpage != null) {
//            map.put("msg", "商品套餐表有数据，请先删除其数据!");
            map.put("msg", "noNull");
        } else {
            if (commodityBiz.deleteCommodity(commodity1)) {
                map.put("msg", "true");
            } else {
                map.put("msg", "fales");
            }
        }
        return map;
    }
    //
    @RequestMapping(value = "/getId/{id}", method = RequestMethod.GET)
    private String getId(@PathVariable int id,HttpServletRequest request) {
        Commodity commodity = commodityBiz.queryCommodityId(id);
        request.setAttribute("commodity",commodity);
        return "showCommodity";
    }
}
