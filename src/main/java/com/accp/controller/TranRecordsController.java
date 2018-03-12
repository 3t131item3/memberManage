package com.accp.controller;

import com.accp.biz.TranRecordsBiz;
import com.accp.entity.Pager;
import com.accp.entity.TranRecords;
import com.accp.entity.Users;
import com.accp.util.FormatDate;
import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
@Controller
public class TranRecordsController {
    @Resource(name = "tranRecordsBiz")
    private TranRecordsBiz tranRecordsBiz;

    @RequestMapping("/queryPageTranRecords")
    @ResponseBody
    public Pager<TranRecords> queryPageTranRecords(TranRecords tranRecords, HttpServletRequest request, Model model){
        String type=request.getParameter("type");
        if(type!=null){
            tranRecords.setTranType(type);
        }
        Users user = (Users) request.getSession().getAttribute("user");
        tranRecords.setUserid(user.getId());
//        获取开始时间
        Date beginDate=request.getParameter("beginDate")==null ? null: FormatDate.formatDate(request.getParameter("beginDate"));
//        获取结束时间
        Date endDate=request.getParameter("endDate")==null ? null: FormatDate.formatDate(request.getParameter("endDate"));
//        在sql映射文件使用了between and 由于and那边不包含条件所以要加一天还有ennDate>=tranTime
        if(endDate!=null){
            Calendar calendar=Calendar.getInstance();
            calendar.setTime(endDate);
//            加一天
            calendar.add(calendar.DATE,1);
//            重新赋值已经加一天的结果
            endDate=calendar.getTime();
        }
//        每页12行
        int rowCount=13;
//        当前页数
        int thisPage=request.getParameter("thisPage")==null ? 1:Integer.parseInt(request.getParameter("thisPage"));

        Pager<TranRecords> tranRecordsPager = tranRecordsBiz.pageQuerys(tranRecords, rowCount, thisPage, beginDate, endDate);

        return tranRecordsPager;
    }
}
