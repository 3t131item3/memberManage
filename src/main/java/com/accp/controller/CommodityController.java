package com.accp.controller;

import com.accp.biz.CommodityBiz;
import com.accp.entity.Commodity;
import com.accp.entity.Errors;
import com.accp.entity.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController {
    @Resource(name ="commodityBiz")
    private CommodityBiz commodityBiz;
    @RequestMapping(value = "/list")
    @ResponseBody
    public Map<String, Object> getList(){
        Pager<Commodity> list = commodityBiz.getList(null, 1, 3);
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("rel",true);
        map.put("msg","获取成功");
        map.put("list",list.getDate());
        map.put("count",57);
        return  map;
    }
}
