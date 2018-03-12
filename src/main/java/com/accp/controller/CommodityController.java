package com.accp.controller;

import com.accp.biz.CommodityBiz;
import com.accp.entity.Commodity;
import com.accp.entity.Errors;
import com.accp.entity.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        map.put("list",list.getData());
        map.put("count",57);
        return  map;
    }
    //新增
    @ResponseBody
    @RequestMapping(value ="/add/{mycars}",method = RequestMethod.GET)
    private  Map<String, Object>  add(@PathVariable String[] mycars){
        Map<String, Object> map=new HashMap<String, Object>();
        Map<String,String>map1=new HashMap<String,String>();
        Commodity comm=new Commodity();
        comm.setCommodityNo(mycars[0]);
        comm.setName(mycars[1]);
        comm.setPrice(Double.parseDouble(mycars[2]));
        comm.setDiscountPrice(Double.parseDouble(mycars[3]));
        comm.setStock(Integer.parseInt(mycars[4]));
        comm.setUnit(mycars[5]);
        comm.setState(Integer.parseInt(mycars[6]));
        comm.setIllustrate(mycars[7]);
        if(commodityBiz.addCommodity(comm)){
//        if(2<1){
            map.put("msg","成功");
        }else {
            map.put("msg","失败");
        }
        return map;
    }

    //删除
    @ResponseBody
    @RequestMapping(value ="/delete/{id}",method = RequestMethod.GET)
    private  Map<String, Object>  delete(@PathVariable int id){
        Map<String, Object> map=new HashMap<String, Object>();
        Commodity commodity=new Commodity();
        commodity.setId(id);
        if(commodityBiz.deleteCommodity(commodity)){
            map.put("msg","删除成功!");
        }else {
            map.put("msg","删除失败!");
        }

        return map;
    }
}
