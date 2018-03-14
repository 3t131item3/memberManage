package com.accp.controller;

import com.accp.biz.ProclamationBiz;
import com.accp.dao.ProclamationDao;
import com.accp.entity.Proclamation;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProclamationController{
    @Resource(name = "proclamationBiz")
    private ProclamationBiz proclamationBiz;

    @RequestMapping("/showProclamation")
    @ResponseBody
    public String showProclamation(){
        Map<String,Object>map=new HashMap<String,Object>();
        map.put("rel",true);
        map.put("msg","获取成功");
        List<Proclamation> list = proclamationBiz.getList();
        map.put("list",list);
        map.put("count",list.size());
        return JSON.toJSONString(map);
    }
}
